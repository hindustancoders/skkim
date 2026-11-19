<?php
/**
 * ============================================================
 *  WinGo External API Result Integration Library  (v2)
 * ============================================================
 *  Result priority (per period):
 *    1. Admin manual prediction  (wingo_manual_result_XX, sthiti=1)
 *    2. External API feed        (configurable URL + key + proxies)
 *    3. Auto algorithm           (min-payout, original behaviour)
 *
 *  Period ids now follow the API issueNumber scheme EXACTLY:
 *    date(UTC, 8) + "1000" + code(1) + serial(4)
 *    codes: 1M=1, 3M=2, 5M=3, 30S=5
 *    serial = 1-based slot index of the UTC day
 *    e.g. 30S at 14:10:27 UTC -> 20261119100051701
 *  (10 Min game has no API endpoint -> stays local IST scheme,
 *   prefix 10004, so it never collides with the 30s prefix 10005.)
 *
 *  Legacy ids (date IST + 10004/10001..10003 + IST serial) are
 *  still settled correctly via wingo_api_slot_end_epoch().
 *
 *  Config table : wingo_api_config  (single row, editable in admin)
 *  Log table    : wingo_api_log
 * ============================================================
 */

if (!defined('WINGO_API_LIB')) {
    define('WINGO_API_LIB', 1);
    date_default_timezone_set("Asia/Kolkata");

    /* ---------------------------------------------------------
     * Tables (auto-created + auto-migrated, production safe)
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
            `en_10m` TINYINT(1) NOT NULL DEFAULT 0,
            `param_30s` VARCHAR(10) NOT NULL DEFAULT '30S',
            `param_1m` VARCHAR(10) NOT NULL DEFAULT '1M',
            `param_3m` VARCHAR(10) NOT NULL DEFAULT '3M',
            `param_5m` VARCHAR(10) NOT NULL DEFAULT '5M',
            `param_10m` VARCHAR(10) NOT NULL DEFAULT '10M',
            `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
        // v2 columns: proxy chain + last-good-path memory
        $res = mysqli_query($conn, "SHOW COLUMNS FROM `wingo_api_config` LIKE 'proxy_tpls'");
        if (!$res || mysqli_num_rows($res) === 0) {
            mysqli_query($conn, "ALTER TABLE `wingo_api_config`
                ADD COLUMN `proxy_tpls` TEXT NULL AFTER `param_10m`,
                ADD COLUMN `last_good_path` TINYINT NOT NULL DEFAULT 0 AFTER `proxy_tpls`");
            mysqli_query($conn, "UPDATE `wingo_api_config` SET `proxy_tpls` = '" .
                implode("\n", [
                    'https://api.allorigins.win/raw?url={URL_ENC}',
                    'https://api.codetabs.com/v1/proxy?quest={URL_ENC}',
                    'https://corsproxy.io/?url={URL_ENC}',
                    'https://cors.eu.org/{URL}',
                ]) . "' WHERE id = 1");
        }
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
     * Period id helpers (17-char ids)
     * --------------------------------------------------------- */
    function wingo_api_serial_of($periodId) {
        $periodId = trim(strval($periodId));
        if (strlen($periodId) < 4) return null;
        $tail = substr($periodId, -4);
        if (ctype_digit($tail)) return intval($tail);
        return null;
    }

    /* ---------------------------------------------------------
     * SLOT END EPOCH — scheme aware
     *  New (API) scheme ids: date is UTC date, serial counts from
     *  UTC midnight -> slot end = UTC midnight + serial*interval.
     *  Legacy ids (10m always; old 30s rows prefix 10004; old
     *  1m/3m/5m rows) counted from IST midnight (+05:30).
     * --------------------------------------------------------- */
    function wingo_api_slot_end_epoch($periodId, $intervalSec, $gameKey = '') {
        $pid = trim(strval($periodId));
        if (strlen($pid) != 17 || !ctype_digit($pid)) return null;
        $date   = substr($pid, 0, 8);
        $prefix = substr($pid, 8, 5);
        $serial = intval(substr($pid, 13, 4));
        $y = intval(substr($date, 0, 4));
        $m = intval(substr($date, 4, 2));
        $d = intval(substr($date, 6, 2));
        if (!checkdate($m, $d, $y) || $serial < 1) return null;
        $intervalSec = max(1, intval($intervalSec));
        $midUtc = gmmktime(0, 0, 0, $m, $d, $y);
        $endUtc = $midUtc + $serial * $intervalSec;
        // IST midnight of the same civil date = UTC midnight MINUS 5:30
        // (00:00 IST == previous day 18:30 UTC == midUtc - 19800)
        $endIst = $midUtc - 19800 + $serial * $intervalSec;
        $now = time();
        if ($gameKey === '30s') {
            return ($prefix === '10005') ? $endUtc : $endIst;   // 10005 = new API scheme
        }
        if ($gameKey === '10m') {
            return $endIst;                                     // local game, IST scheme
        }
        // 1m/3m/5m share prefixes between legacy IST and new UTC ids:
        if ($endUtc > $now && $endIst <= $now && ($now - $endIst) < $intervalSec * 3) {
            return $endIst; // legacy row still inside its settle window
        }
        return $endUtc;
    }

    /* ---------------------------------------------------------
     * Flexible response parser
     * Accepts the real feed shape {"data":{"list":[...]},"code":0,...}
     * and several common variants. Normalises each item to:
     * period / number / colour. Returns candidates (as given).
     * --------------------------------------------------------- */
    function wingo_api_parse_feed($rawBody) {
        $body = trim(strval($rawBody));
        if ($body === '') return [];
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
     * HTTP fetch — DIRECT + PROXY CHAIN with memory
     * Path list: [0]=direct, [1..N]=proxy templates from config
     * (placeholders {URL} raw / {URL_ENC} urlencoded).
     * The path that last succeeded is tried first (persisted).
     * Returns: ['ok','candidates','raw','latency_ms','error',
     *           'path_used','url_used']
     * --------------------------------------------------------- */
    function wingo_api_default_proxies() {
        return [
            'https://api.allorigins.win/raw?url={URL_ENC}',
            'https://api.codetabs.com/v1/proxy?quest={URL_ENC}',
            'https://corsproxy.io/?url={URL_ENC}',
            'https://cors.eu.org/{URL}',
        ];
    }

    function wingo_api_fetch_feed($conn, $gameKey, $forceFresh = false) {
        static $cache = [];
        static $breaker = [];

        $cfg = wingo_api_get_config($conn);
        $fail = ['ok' => false, 'candidates' => [], 'raw' => '', 'latency_ms' => 0,
                 'error' => 'no config', 'path_used' => null, 'url_used' => null];
        if (!$cfg) return $fail;

        $map = ['30s' => 'param_30s', '1m' => 'param_1m', '3m' => 'param_3m', '5m' => 'param_5m', '10m' => 'param_10m'];
        $typeParam = isset($map[$gameKey]) ? $cfg[$map[$gameKey]] : '';
        $base = rtrim(trim($cfg['api_base']), '?&');
        $key  = trim($cfg['api_key']);
        $timeout = max(3, intval($cfg['timeout_sec']));
        $sep = (strpos($base, '?') === false) ? '?' : '&';
        $url = $base . $sep . 'type=' . urlencode($typeParam) . '&api_key=' . urlencode($key);

        if (!$forceFresh && isset($cache[$gameKey]) && (time() - $cache[$gameKey]['t']) < 6) {
            return $cache[$gameKey]['data'];
        }

        if (!isset($breaker[$gameKey])) $breaker[$gameKey] = ['fails' => 0, 'last' => 0];
        if (!$forceFresh && $breaker[$gameKey]['fails'] >= 3 && (time() - $breaker[$gameKey]['last']) < 60) {
            $data = $fail;
            $data['error'] = 'circuit-open (API unreachable, retrying later)';
            $cache[$gameKey] = ['t' => time(), 'data' => $data];
            return $data;
        }

        // ---- build path list -----------------------------------
        $tpls = [];
        if (isset($cfg['proxy_tpls']) && trim(strval($cfg['proxy_tpls'])) !== '') {
            $tpls = array_values(array_filter(array_map('trim', preg_split('/\r\n|\r|\n/', strval($cfg['proxy_tpls'])))));
        }
        if (count($tpls) === 0) $tpls = wingo_api_default_proxies();

        $paths = [0 => ['kind' => 'direct', 'url' => $url]];
        foreach ($tpls as $i => $tpl) {
            if (strpos($tpl, '{URL}') === false && strpos($tpl, '{URL_ENC}') === false) continue;
            $paths[$i + 1] = ['kind' => 'proxy', 'tpl' => $tpl];
        }

        // try last-good path first, then direct, then the rest
        $order = [];
        $lg = intval($cfg['last_good_path']);
        if ($lg > 0 && isset($paths[$lg])) $order[] = $lg;
        if (!in_array(0, $order)) $order[] = 0;
        foreach (array_keys($paths) as $idx) { if (!in_array($idx, $order)) $order[] = $idx; }

        // ---- attempt chain -------------------------------------
        $t0 = microtime(true);
        $attempts = [];
        $success = null;
        $triesPerPath = ($forceFresh ? 1 : 2);
        foreach ($order as $idx) {
            $p = $paths[$idx];
            for ($attempt = 1; $attempt <= $triesPerPath; $attempt++) {
                $target = $p['url'];
                if ($p['kind'] === 'proxy') {
                    $target = str_replace(['{URL_ENC}', '{URL}'], [urlencode($url), $url], $p['tpl']);
                }
                $ch = curl_init($target);
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

                $candidates = [];
                $ok = false;
                if ($cerrno === 0 && $httpCode >= 200 && $httpCode < 300 && trim(strval($raw)) !== '') {
                    $candidates = wingo_api_parse_feed($raw);
                    $ok = (count($candidates) > 0);
                }
                $attempts[] = '#'.$idx . ($p['kind'] === 'direct' ? '(direct)' : '(proxy)') .
                    ' HTTP ' . $httpCode . ($cerrno ? ' curl#' . $cerrno : '') .
                    ($ok ? ' ok(' . count($candidates) . ')' : '');
                if ($ok) {
                    $success = [
                        'ok' => true, 'candidates' => $candidates, 'raw' => strval($raw),
                        'latency_ms' => intval(round((microtime(true) - $t0) * 1000)),
                        'error' => null, 'path_used' => $idx, 'url_used' => $target,
                    ];
                    break 2;
                }
                // only retry the SAME path when it timed out (not on 403-style blocks)
                if ($cerrno !== 0) { continue; }
                break;
            }
        }

        if ($success !== null) {
            if ($breaker[$gameKey]['fails'] > 0 || intval($cfg['last_good_path']) !== intval($success['path_used'])) {
                $breaker[$gameKey]['fails'] = 0;
                mysqli_query($conn, "UPDATE `wingo_api_config` SET `last_good_path`=" . intval($success['path_used']) . " WHERE id=1");
                $cfg['last_good_path'] = $success['path_used'];
            }
            $cache[$gameKey] = ['t' => time(), 'data' => $success];
            return $success;
        }

        $breaker[$gameKey]['fails']++;
        $breaker[$gameKey]['last'] = time();
        $data = $fail;
        $data['error'] = 'all paths failed: ' . implode(' | ', array_slice($attempts, 0, 6));
        $data['latency_ms'] = intval(round((microtime(true) - $t0) * 1000));
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
     * The local period id IS the API issueNumber (same scheme),
     * so matching is exact-string first. If the feed has not
     * published the slot yet, retry once fresh, then give up
     * (caller falls back to the auto algorithm — never stalls,
     * never applies a wrong period's number).
     * Return: ['number'=>int, 'colour'=>str|null, 'api_period'=>str|null, 'status'=>str]
     *         or null (use fallback algorithm)
     * --------------------------------------------------------- */
    function wingo_api_resolve($conn, $gameKey, $localPeriodId) {
        $cfg = wingo_api_get_config($conn);
        if (!wingo_api_game_enabled($cfg, $gameKey)) return null;

        $localPeriodId = strval($localPeriodId);
        $fetch = wingo_api_fetch_feed($conn, $gameKey);

        if ($fetch['ok']) {
            foreach ($fetch['candidates'] as $c) {
                if ($c['period'] !== null && strcasecmp($c['period'], $localPeriodId) === 0) {
                    wingo_api_log_event($conn, $gameKey, $localPeriodId, $c['period'], $c['number'], $c['colour'],
                        'used', 'API result applied (exact issueNumber match, path #' . $fetch['path_used'] . ')', $fetch['latency_ms']);
                    return ['number' => $c['number'], 'colour' => $c['colour'], 'api_period' => $c['period'], 'status' => 'used'];
                }
            }
            // feed may lag a few seconds behind the slot end -> one fresh retry
            sleep(2);
            $retry = wingo_api_fetch_feed($conn, $gameKey, true);
            if ($retry['ok']) {
                foreach ($retry['candidates'] as $c) {
                    if ($c['period'] !== null && strcasecmp($c['period'], $localPeriodId) === 0) {
                        wingo_api_log_event($conn, $gameKey, $localPeriodId, $c['period'], $c['number'], $c['colour'],
                            'used', 'API result applied after retry (path #' . $retry['path_used'] . ')', $retry['latency_ms']);
                        return ['number' => $c['number'], 'colour' => $c['colour'], 'api_period' => $c['period'], 'status' => 'used'];
                    }
                }
            }
        }

        wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'fallback',
            'API issueNumber not found for period ' . $localPeriodId . ' (' . ($fetch['ok'] ? 'feed ok' : 'feed failed: ' . $fetch['error']) . '); auto algorithm used',
            $fetch['latency_ms']);
        return null;
    }

    /* ---------------------------------------------------------
     * DUE TARGET — earliest unresolved period whose betting
     * window has ended (scheme aware). Uses a per-game process
     * lock to avoid double settlement. Returns period id or null.
     * --------------------------------------------------------- */
    function wingo_api_due_target($conn, $periodsTable, $resultsTable, $intervalSec, $lockKey, $gameKey = '') {
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
            $end = wingo_api_slot_end_epoch($pid, $intervalSec, $gameKey);
            if ($end === null) continue;        // unparseable id -> skip
            if ($end <= $now) return $pid;      // due
            return null;                        // ascending order: first not-due => none due
        }
        return null;
    }
}
