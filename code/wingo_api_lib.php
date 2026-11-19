<?php
/**
 * ============================================================
 *  WinGo External API Result Integration Library
 * ============================================================
 *  Result priority (per period):
 *    1. Admin manual prediction  (wingo_manual_result_XX, sthiti=1)
 *    2. External API feed        (configurable URL + key)
 *    3. Auto algorithm           (min-payout, original behaviour)
 *
 *  Period ids are wall-clock aligned (IST):
 *    YYYYMMDD + 10001(1m) / 10002(3m) / 10003(5m) / 10004(30s) / 10005(10m)
 *    + 4-digit serial (1-based slot index of the day)
 *
 *  Config table : wingo_api_config  (single row, editable in admin)
 *  Log table    : wingo_api_log
 * ============================================================
 */

if (!defined('WINGO_API_LIB')) {
    define('WINGO_API_LIB', 1);
    date_default_timezone_set("Asia/Kolkata");

    /* ---------------------------------------------------------
     * Tables (auto-created, production safe)
     * --------------------------------------------------------- */
    function wingo_api_ensure_tables($conn) {
        mysqli_query($conn, "CREATE TABLE IF NOT EXISTS `wingo_api_config` (
            `id` TINYINT NOT NULL DEFAULT 1,
            `enabled` TINYINT(1) NOT NULL DEFAULT 1,
            `api_base` VARCHAR(300) NOT NULL DEFAULT 'https://wingo.voterx.xyz/index.php',
            `api_key` VARCHAR(200) NOT NULL DEFAULT 'key122842685683',
            `timeout_sec` TINYINT NOT NULL DEFAULT 8,
            `en_30s` TINYINT(1) NOT NULL DEFAULT 1,
            `en_1m` TINYINT(1) NOT NULL DEFAULT 1,
            `en_3m` TINYINT(1) NOT NULL DEFAULT 1,
            `en_5m` TINYINT(1) NOT NULL DEFAULT 1,
            `en_10m` TINYINT(1) NOT NULL DEFAULT 1,
            `param_30s` VARCHAR(10) NOT NULL DEFAULT '30S',
            `param_1m` VARCHAR(10) NOT NULL DEFAULT '1M',
            `param_3m` VARCHAR(10) NOT NULL DEFAULT '3M',
            `param_5m` VARCHAR(10) NOT NULL DEFAULT '5M',
            `param_10m` VARCHAR(10) NOT NULL DEFAULT '10M',
            `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
        mysqli_query($conn, "CREATE TABLE IF NOT EXISTS `wingo_api_log` (
            `log_id` BIGINT NOT NULL AUTO_INCREMENT,
            `game_key` VARCHAR(10) NOT NULL,
            `local_period` VARCHAR(30) NOT NULL,
            `api_period` VARCHAR(30) DEFAULT NULL,
            `api_number` INT DEFAULT NULL,
            `api_colour` VARCHAR(60) DEFAULT NULL,
            `status` VARCHAR(20) NOT NULL,
            `message` VARCHAR(500) DEFAULT NULL,
            `latency_ms` INT DEFAULT NULL,
            `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`log_id`),
            KEY `idx_created` (`created_at`),
            KEY `idx_game` (`game_key`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
    }

    /* ---------------------------------------------------------
     * Config
     * --------------------------------------------------------- */
    function wingo_api_get_config($conn) {
        wingo_api_ensure_tables($conn);
        $res = mysqli_query($conn, "SELECT * FROM `wingo_api_config` WHERE id = 1 LIMIT 1");
        if ($res && mysqli_num_rows($res) > 0) {
            return mysqli_fetch_assoc($res);
        }
        mysqli_query($conn, "INSERT IGNORE INTO `wingo_api_config` (`id`) VALUES (1)");
        $res = mysqli_query($conn, "SELECT * FROM `wingo_api_config` WHERE id = 1 LIMIT 1");
        return $res ? mysqli_fetch_assoc($res) : null;
    }

    function wingo_api_game_enabled($cfg, $gameKey) {
        if (!$cfg || intval($cfg['enabled']) !== 1) return false;
        $map = ['30s' => 'en_30s', '1m' => 'en_1m', '3m' => 'en_3m', '5m' => 'en_5m', '10m' => 'en_10m'];
        if (!isset($map[$gameKey])) return false;
        return intval($cfg[$map[$gameKey]]) === 1;
    }

    /* ---------------------------------------------------------
     * Colour helper (standard WinGo mapping)
     * --------------------------------------------------------- */
    function wingo_api_colour_from_number($n) {
        $n = intval($n);
        if ($n === 0) return 'red,violet';
        if ($n === 5) return 'green,violet';
        if ($n % 2 === 1) return 'green';
        return 'red';
    }

    /* ---------------------------------------------------------
     * Period id helpers (17-char ids: date(8) + prefix(5) + serial(4))
     * --------------------------------------------------------- */
    function wingo_api_serial_of($periodId) {
        $periodId = trim(strval($periodId));
        if (strlen($periodId) < 4) return null;
        // our ids: serial = last 4 digits
        $tail = substr($periodId, -4);
        if (ctype_digit($tail)) return intval($tail);
        return null;
    }

    /* ---------------------------------------------------------
     * Flexible response parser
     * Accepts: {"data":[...]}, {"data":{...}}, top-level list,
     * {"result":[...]}, {"list":[...]} etc.
     * Normalises each item to: period / number / colour
     * Returns: list of candidates (newest first, as given by API)
     * --------------------------------------------------------- */
    function wingo_api_parse_feed($rawBody) {
        $body = trim(strval($rawBody));
        if ($body === '') return [];
        // strip possible non-JSON prefix/suffix noise
        $start = strpos($body, '{');
        $startArr = strpos($body, '[');
        if ($start === false || ($startArr !== false && $startArr < $start)) $start = $startArr;
        if ($start !== false) {
            $body = substr($body, $start);
        }
        $json = json_decode($body, true);
        if ($json === null && json_last_error() !== JSON_ERROR_NONE) {
            return [];
        }

        $candidates = [];
        $containers = [];
        if (is_array($json)) {
            $containers[] = $json;
            foreach (['data', 'result', 'results', 'list', 'rows', 'records', 'items'] as $k) {
                if (isset($json[$k])) $containers[] = $json[$k];
                if (isset($json[$k]) && is_array($json[$k]) && isset($json[$k]['data'])) $containers[] = $json[$k]['data'];
                if (isset($json[$k]) && is_array($json[$k]) && isset($json[$k]['list'])) $containers[] = $json[$k]['list'];
            }
        }

        $periodKeys   = ['period', 'issueNumber', 'issue_number', 'issue', 'issueNo', 'period_id', 'periodId', 'round', 'roundId'];
        $numberKeys   = ['number', 'num', 'result', 'resultNum', 'result_num', 'premium', 'winning', 'winningNumber', 'openNum', 'open_num'];
        $colourKeys   = ['colour', 'color', 'colourName', 'colorName', 'colors', 'colours', 'colour_name', 'color_name'];

        foreach ($containers as $cont) {
            $items = [];
            if (is_array($cont) && isset($cont[0])) {
                $items = $cont;                       // list
            } elseif (is_array($cont) && count($cont) > 0) {
                $items = [$cont];                     // single object
            }
            foreach ($items as $item) {
                if (!is_array($item)) continue;
                $period = null; $number = null; $colour = null;
                foreach ($periodKeys as $k) { if (isset($item[$k]) && $item[$k] !== '') { $period = strval($item[$k]); break; } }
                foreach ($numberKeys as $k) { if (isset($item[$k]) && $item[$k] !== '' && !is_array($item[$k])) { $number = intval($item[$k]); break; } }
                foreach ($colourKeys as $k) { if (isset($item[$k]) && is_string($item[$k]) && $item[$k] !== '') { $colour = strtolower(trim($item[$k])); break; } }
                if ($number === null && $period === null) continue;
                if ($number !== null && ($number < 0 || $number > 9)) {
                    // maybe multi-digit string like "04" -> take last digit
                    $last = intval(substr(strval($number), -1));
                    $number = $last;
                }
                $candidates[] = ['period' => $period, 'number' => $number, 'colour' => $colour];
            }
            if (count($candidates) > 0) break; // first matching container wins
        }
        return $candidates;
    }

    /* ---------------------------------------------------------
     * HTTP fetch with per-process cache + retry
     * Returns: ['ok'=>bool, 'candidates'=>[], 'raw'=>str, 'latency_ms'=>int, 'error'=>str|null]
     * --------------------------------------------------------- */
    function wingo_api_fetch_feed($conn, $gameKey, $forceFresh = false) {
        static $cache = [];
        $cfg = wingo_api_get_config($conn);
        if (!$cfg) return ['ok' => false, 'candidates' => [], 'raw' => '', 'latency_ms' => 0, 'error' => 'no config'];

        $map = ['30s' => 'param_30s', '1m' => 'param_1m', '3m' => 'param_3m', '5m' => 'param_5m', '10m' => 'param_10m'];
        $typeParam = isset($map[$gameKey]) ? $cfg[$map[$gameKey]] : '';
        $base = rtrim(trim($cfg['api_base']), '?&');
        $key  = trim($cfg['api_key']);
        $timeout = max(2, intval($cfg['timeout_sec']));
        $sep = (strpos($base, '?') === false) ? '?' : '&';
        $url = $base . $sep . 'type=' . urlencode($typeParam) . '&api_key=' . urlencode($key);

        if (!$forceFresh && isset($cache[$gameKey]) && (time() - $cache[$gameKey]['t']) < 4) {
            return $cache[$gameKey]['data'];
        }

        // circuit breaker: after 3 consecutive failures, skip attempts for 60s
        static $breaker = [];
        if (!isset($breaker[$gameKey])) $breaker[$gameKey] = ['fails' => 0, 'last' => 0];
        if (!$forceFresh && $breaker[$gameKey]['fails'] >= 3 && (time() - $breaker[$gameKey]['last']) < 60) {
            $data = ['ok' => false, 'candidates' => [], 'raw' => '', 'latency_ms' => 0,
                     'error' => 'circuit-open (API unreachable, retrying later)'];
            $cache[$gameKey] = ['t' => time(), 'data' => $data];
            return $data;
        }

        $t0 = microtime(true);
        $raw = ''; $err = '';
        for ($attempt = 1; $attempt <= 2; $attempt++) {
            $ch = curl_init($url);
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_TIMEOUT        => $timeout,
                CURLOPT_CONNECTTIMEOUT => $timeout,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_USERAGENT      => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36',
                CURLOPT_HTTPHEADER     => ['Accept: application/json, text/plain, */*'],
            ]);
            $raw = curl_exec($ch);
            $cerrno = curl_errno($ch);
            $cerrmsg = curl_error($ch);
            $httpCode = intval(curl_getinfo($ch, CURLINFO_RESPONSE_CODE));
            curl_close($ch);
            if ($cerrno === 0 && $httpCode >= 200 && $httpCode < 300 && trim(strval($raw)) !== '') {
                $err = '';
                $breaker[$gameKey]['fails'] = 0;
                break;
            }
            $err = 'HTTP ' . $httpCode . ($cerrno ? ' curl#' . $cerrno . ' ' . $cerrmsg : '');
            if ($attempt < 2) sleep(2);
        }
        $latency = intval(round((microtime(true) - $t0) * 1000));

        $data = ['ok' => false, 'candidates' => [], 'raw' => strval($raw), 'latency_ms' => $latency, 'error' => $err];
        if ($err !== '') {
            $breaker[$gameKey]['fails']++;
            $breaker[$gameKey]['last'] = time();
        }
        if ($err === '') {
            $candidates = wingo_api_parse_feed($raw);
            if (count($candidates) > 0) {
                $data['ok'] = true;
                $data['candidates'] = $candidates;
            } else {
                $data['error'] = 'unparseable response';
                $breaker[$gameKey]['fails']++;
                $breaker[$gameKey]['last'] = time();
            }
        }
        $cache[$gameKey] = ['t' => time(), 'data' => $data];
        return $data;
    }

    /* ---------------------------------------------------------
     * Log
     * --------------------------------------------------------- */
    function wingo_api_log_event($conn, $gameKey, $localPeriod, $apiPeriod, $number, $colour, $status, $message, $latency = null) {
        wingo_api_ensure_tables($conn);
        mysqli_query($conn, "INSERT INTO `wingo_api_log`
            (`game_key`,`local_period`,`api_period`,`api_number`,`api_colour`,`status`,`message`,`latency_ms`)
            VALUES (
                '" . mysqli_real_escape_string($conn, strval($gameKey)) . "',
                '" . mysqli_real_escape_string($conn, strval($localPeriod)) . "',
                " . ($apiPeriod !== null ? "'" . mysqli_real_escape_string($conn, strval($apiPeriod)) . "'" : "NULL") . ",
                " . ($number !== null ? intval($number) : "NULL") . ",
                " . ($colour !== null ? "'" . mysqli_real_escape_string($conn, strval($colour)) . "'" : "NULL") . ",
                '" . mysqli_real_escape_string($conn, strval($status)) . "',
                " . ($message !== null ? "'" . mysqli_real_escape_string($conn, strval($message)) . "'" : "NULL") . ",
                " . ($latency !== null ? intval($latency) : "NULL") . ")");
        // occasional trim: keep last 800 rows
        if (mt_rand(1, 50) === 1) {
            mysqli_query($conn, "DELETE FROM `wingo_api_log` WHERE log_id NOT IN (
                SELECT log_id FROM (SELECT log_id FROM `wingo_api_log` ORDER BY log_id DESC LIMIT 800) t)");
        }
    }

    /* ---------------------------------------------------------
     * MAIN RESOLVER — returns number from API for a local period
     * Return: ['number'=>int, 'colour'=>str|null, 'api_period'=>str|null, 'status'=>str]
     *         or null (use fallback algorithm)
     * Matching: strict serial match first; if API lags exactly one
     * slot, retry once after 2.5s; else accept with 'lag' status.
     * --------------------------------------------------------- */
    function wingo_api_resolve($conn, $gameKey, $localPeriodId) {
        $cfg = wingo_api_get_config($conn);
        if (!wingo_api_game_enabled($cfg, $gameKey)) return null;

        $ourSerial = wingo_api_serial_of($localPeriodId);
        $fetch = wingo_api_fetch_feed($conn, $gameKey);

        if (!$fetch['ok']) {
            wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'error',
                'API fetch failed: ' . $fetch['error'], $fetch['latency_ms']);
            return null;
        }

        $candidates = $fetch['candidates'];
        $exact = null; $lagged = null;
        foreach ($candidates as $c) {
            $apiSerial = ($c['period'] !== null) ? wingo_api_serial_of($c['period']) : null;
            if ($ourSerial !== null && $apiSerial !== null && $apiSerial === $ourSerial) { $exact = $c; break; }
            if ($ourSerial !== null && $apiSerial !== null && ($apiSerial === $ourSerial - 1 || $apiSerial === $ourSerial + 1)) {
                if ($lagged === null) $lagged = $c;
            }
        }

        if ($exact !== null) {
            wingo_api_log_event($conn, $gameKey, $localPeriodId, $exact['period'], $exact['number'], $exact['colour'],
                'used', 'API result applied (exact period match)', $fetch['latency_ms']);
            return ['number' => $exact['number'], 'colour' => $exact['colour'], 'api_period' => $exact['period'], 'status' => 'used'];
        }

        if ($lagged !== null) {
            // one retry in case the API is a couple of seconds behind
            sleep(2);
            $retry = wingo_api_fetch_feed($conn, $gameKey, true);
            if ($retry['ok']) {
                foreach ($retry['candidates'] as $c) {
                    $apiSerial = ($c['period'] !== null) ? wingo_api_serial_of($c['period']) : null;
                    if ($ourSerial !== null && $apiSerial !== null && $apiSerial === $ourSerial) {
                        wingo_api_log_event($conn, $gameKey, $localPeriodId, $c['period'], $c['number'], $c['colour'],
                            'used', 'API result applied after retry', $retry['latency_ms']);
                        return ['number' => $c['number'], 'colour' => $c['colour'], 'api_period' => $c['period'], 'status' => 'used'];
                    }
                }
            }
            wingo_api_log_event($conn, $gameKey, $localPeriodId, $lagged['period'], $lagged['number'], $lagged['colour'],
                'lag', 'API period ' . $lagged['period'] . ' used for local serial ' . $ourSerial . ' (feed lag)', $fetch['latency_ms']);
            return ['number' => $lagged['number'], 'colour' => $lagged['colour'], 'api_period' => $lagged['period'], 'status' => 'lag'];
        }

        wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'fallback',
            'No matching API period for serial ' . $ourSerial . '; auto algorithm used', $fetch['latency_ms']);
        return null;
    }

    /* ---------------------------------------------------------
     * DUE TARGET — earliest unresolved period whose betting
     * window has ended. Uses a per-game process lock to avoid
     * double settlement. Returns period id or null.
     * --------------------------------------------------------- */
    function wingo_api_due_target($conn, $periodsTable, $resultsTable, $intervalSec, $lockKey) {
        static $heldLocks = [];
        if (isset($heldLocks[$lockKey])) return null; // already resolving in this process
        $lockFile = __DIR__ . "/.lock_" . preg_replace('/[^a-z0-9]/i', '', $lockKey);
        $fp = @fopen($lockFile, 'c');
        if (!$fp) return null;
        if (!flock($fp, LOCK_EX | LOCK_NB)) { fclose($fp); return null; }
        $heldLocks[$lockKey] = $fp; // hold until process end (auto-release)

        $intervalSec = intval($intervalSec);
        $safePeriods = preg_replace('/[^a-zA-Z0-9_]/', '', $periodsTable);
        $safeResults = preg_replace('/[^a-zA-Z0-9_]/', '', $resultsTable);

        $out = mysqli_query($conn, "SELECT p.atadaaidi
            FROM `" . $safePeriods . "` p
            LEFT JOIN `" . $safeResults . "` r ON r.kalaparichaya = p.atadaaidi
            WHERE r.shonu IS NULL
            ORDER BY p.kramasankhye ASC
            LIMIT 25");
        if (!$out) return null;

        $now = time();
        while ($row = mysqli_fetch_assoc($out)) {
            $pid = strval($row['atadaaidi']);
            if (strlen($pid) != 17) continue;
            $serial = intval(substr($pid, 13));
            $dayStart = strtotime(substr($pid, 0, 4) . "-" . substr($pid, 4, 2) . "-" . substr($pid, 6, 2) . " 00:00:00");
            if ($dayStart === false) continue;
            $slotEnd = $dayStart + $serial * $intervalSec;
            if ($slotEnd <= $now) return $pid;
            return null; // ascending order: first not-due => none due
        }
        return null;
    }
}
