<?php
/**
 * ============================================================
 *  WinGo External API Result Integration Library  (v3)
 * ============================================================
 *  Result priority (per period):
 *    1. Admin manual prediction  (wingo_manual_result_XX, sthiti=1)
 *    2. External API feed        (configurable URL + key, DIRECT hit)
 *    3. Auto algorithm           (min-payout, original behaviour)
 *
 *  v3 CHANGES (no proxy fallback):
 *    - The feed is fetched DIRECTLY from api_base only. Third-party
 *      proxy relays removed completely (they made the cron hang for
 *      minutes and froze the WinGo countdown).
 *    - Fast-fail: one short-timeout attempt + circuit breaker, so the
 *      cron loop always keeps flowing and periods keep generating.
 *    - Period ids follow the API issueNumber scheme EXACTLY:
 *        date(UTC, 8) + "1000" + code(1) + serial(4)
 *        codes: 1M=1, 3M=2, 5M=3, 30S=5, local-10M=4
 *        serial = 1-based slot index of the UTC day
 *      e.g. 30S at 14:10:27 UTC -> 20261119100051701
 *      Next period = latest published issueNumber + 1 (day wraps at
 *      the last slot). When the API is unavailable the wall-clock
 *      slot calc (+1 from the last local period) is used.
 *    - wingo_api_slot_times(): exact start/end epoch of a slot from
 *      its period id (countdown alignment for GetGameIssue).
 *    - wingo_api_normalise_colour(): sanitises API "color" field
 *      (red / green / violet, comma separated like "red,violet").
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
            `timeout_sec` TINYINT NOT NULL DEFAULT 5,
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
        // v3 migration: proxy-chain columns are obsolete -> drop them
        $res = mysqli_query($conn, "SHOW COLUMNS FROM `wingo_api_config` LIKE 'proxy_tpls'");
        if ($res && mysqli_num_rows($res) > 0) {
            mysqli_query($conn, "ALTER TABLE `wingo_api_config` DROP COLUMN `proxy_tpls`");
        }
        $res = mysqli_query($conn, "SHOW COLUMNS FROM `wingo_api_config` LIKE 'last_good_path'");
        if ($res && mysqli_num_rows($res) > 0) {
            mysqli_query($conn, "ALTER TABLE `wingo_api_config` DROP COLUMN `last_good_path`");
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
     * Colour helpers
     * wingo_api_colour_from_number(): standard WinGo mapping
     * wingo_api_normalise_colour():   sanitise the API "color"
     *   value ("green", "red,violet" ...) -> allowed tokens only.
     * --------------------------------------------------------- */
    function wingo_api_colour_from_number($n) {
        $n = intval($n);
        if ($n === 0) return 'red,violet';
        if ($n === 5) return 'green,violet';
        if ($n % 2 === 1) return 'green';
        return 'red';
    }

    function wingo_api_normalise_colour($colour) {
        $colour = strtolower(trim(strval($colour)));
        if ($colour === '') return null;
        $parts = preg_split('/[\s,\/|]+/', $colour);
        $allowed = ['red', 'green', 'violet'];
        $out = [];
        foreach ($parts as $p) {
            $p = strtolower(trim($p));
            if ($p === 'red') { if (!in_array('red', $out)) $out[] = 'red'; }
            elseif ($p === 'green') { if (!in_array('green', $out)) $out[] = 'green'; }
            elseif ($p === 'violet' || $p === 'purple') { if (!in_array('violet', $out)) $out[] = 'violet'; }
        }
        if (count($out) === 0) return null;
        return implode(',', $out);
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

    function wingo_api_prefix_of($periodId) {
        $periodId = trim(strval($periodId));
        if (strlen($periodId) != 17 || !ctype_digit($periodId)) return null;
        return substr($periodId, 8, 5);
    }

    /* slots per UTC day by prefix code */
    function wingo_api_slots_per_day($prefix) {
        $map = ['10001' => 1440, '10002' => 480, '10003' => 288, '10004' => 144, '10005' => 2880];
        return isset($map[$prefix]) ? $map[$prefix] : null;
    }

    /**
     * NEXT ISSUE NUMBER (+1 rule, day-wrapping).
     * The API emits one issueNumber per interval; the next slot is
     * always previous + 1. At the last slot of the day the serial
     * wraps to 0001 and the date part advances (UTC).
     */
    function wingo_api_next_issue($issueNumber) {
        $pid = trim(strval($issueNumber));
        if (strlen($pid) != 17 || !ctype_digit($pid)) return null;
        $date   = substr($pid, 0, 8);
        $prefix = substr($pid, 8, 5);
        $serial = intval(substr($pid, 13, 4));
        $max = wingo_api_slots_per_day($prefix);
        if ($max === null) return null;
        $y = intval(substr($date, 0, 4));
        $m = intval(substr($date, 4, 2));
        $d = intval(substr($date, 6, 2));
        if (!checkdate($m, $d, $y)) return null;
        if ($serial < 1 || $serial > $max) return null;
        if ($serial + 1 <= $max) {
            return $date . $prefix . sprintf("%04d", $serial + 1);
        }
        // day wrap: next UTC date, serial 1
        $nextTs = gmmktime(0, 0, 0, $m, $d, $y) + 86400;
        return gmdate('Ymd', $nextTs) . $prefix . "0001";
    }

    /* ---------------------------------------------------------
     * SLOT END EPOCH — scheme aware (settlement timing)
     *  New (API) scheme ids: date is UTC date, serial counts from
     *  UTC midnight -> slot end = UTC midnight + serial*interval.
     *  Legacy ids (10m always; old 30s rows prefix 10004; old
     *  1m/3m/5m rows) counted from IST midnight (+05:30).
     * --------------------------------------------------------- */
    function wingo_api_slot_end_epoch($periodId, $intervalSec, $gameKey = '') {
        $times = wingo_api_slot_times($periodId, $intervalSec, $gameKey);
        return $times ? $times['end'] : null;
    }

    /**
     * START + END epoch of a slot derived purely from the period id.
     * Returns ['start'=>int,'end'=>int] or null.
     * Used by GetGameIssue so the countdown always matches the API
     * slot boundary (no drift from late cron inserts).
     */
    function wingo_api_slot_times($periodId, $intervalSec, $gameKey = '') {
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
        $max = wingo_api_slots_per_day($prefix);
        if ($max !== null && $serial > $max) return null;
        $midUtc = gmmktime(0, 0, 0, $m, $d, $y);
        $endUtc = $midUtc + $serial * $intervalSec;
        // IST midnight of the same civil date = UTC midnight MINUS 5:30
        $endIst = $midUtc - 19800 + $serial * $intervalSec;
        $now = time();
        if ($gameKey === '10m') {
            return ['start' => $endIst - $intervalSec, 'end' => $endIst];
        }
        if ($gameKey === '30s') {
            $end = ($prefix === '10005') ? $endUtc : $endIst;
            return ['start' => $end - $intervalSec, 'end' => $end];
        }
        // 1m/3m/5m: legacy IST ids and new UTC ids share the prefix.
        // Pick the interpretation whose end is closest to "now"
        // (the row being queried is always the CURRENT slot).
        if (abs($now - $endUtc) <= abs($now - $endIst)) {
            return ['start' => $endUtc - $intervalSec, 'end' => $endUtc];
        }
        return ['start' => $endIst - $intervalSec, 'end' => $endIst];
    }

    /* ---------------------------------------------------------
     * Flexible response parser
     * Accepts the real feed shape {"data":{"list":[...]},"code":0,...}
     * and several common variants. Normalises each item to:
     * period / number / colour. Returns candidates, newest first
     * (the API list is newest-first: list[0] = latest result).
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
                if ($colour !== null) $colour = wingo_api_normalise_colour($colour);
                $candidates[] = ['period' => $period, 'number' => $number, 'colour' => $colour];
            }
            if (count($candidates) > 0) break; // first matching container wins
        }
        return $candidates;
    }

    /* ---------------------------------------------------------
     * HTTP fetch — DIRECT ONLY (v3, no proxies).
     * One short-timeout attempt per call; results cached 6s per
     * game; circuit breaker opens for 60s after 3 consecutive
     * failures so the cron loop NEVER hangs on an unreachable API.
     * Returns: ['ok','candidates','raw','latency_ms','error']
     * --------------------------------------------------------- */
    function wingo_api_fetch_feed($conn, $gameKey, $forceFresh = false) {
        static $cache = [];
        static $breaker = [];

        $cfg = wingo_api_get_config($conn);
        $fail = ['ok' => false, 'candidates' => [], 'raw' => '', 'latency_ms' => 0,
                 'error' => 'no config'];
        if (!$cfg) return $fail;

        $map = ['30s' => 'param_30s', '1m' => 'param_1m', '3m' => 'param_3m', '5m' => 'param_5m', '10m' => 'param_10m'];
        $typeParam = isset($map[$gameKey]) ? $cfg[$map[$gameKey]] : '';
        $base = rtrim(trim($cfg['api_base']), '?&');
        $key  = trim($cfg['api_key']);
        $timeout = max(2, min(15, intval($cfg['timeout_sec'])));
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

        $t0 = microtime(true);
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
        $httpCode = intval(curl_getinfo($ch, CURLINFO_RESPONSE_CODE));
        curl_close($ch);
        $latency = intval(round((microtime(true) - $t0) * 1000));

        $candidates = [];
        $ok = false;
        if ($cerrno === 0 && $httpCode >= 200 && $httpCode < 300 && trim(strval($raw)) !== '') {
            $candidates = wingo_api_parse_feed($raw);
            $ok = (count($candidates) > 0);
        }

        if ($ok) {
            $breaker[$gameKey]['fails'] = 0;
            $success = ['ok' => true, 'candidates' => $candidates, 'raw' => strval($raw),
                        'latency_ms' => $latency, 'error' => null];
            $cache[$gameKey] = ['t' => time(), 'data' => $success];
            return $success;
        }

        $breaker[$gameKey]['fails']++;
        $breaker[$gameKey]['last'] = time();
        $data = $fail;
        $data['error'] = 'direct fetch failed: HTTP ' . $httpCode .
            ($cerrno ? ' curl#' . $cerrno : '') . ' (' . $latency . 'ms)';
        $data['latency_ms'] = $latency;
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
     * MAIN RESOLVER — returns number + colour from the API for a
     * local period. The local period id IS the API issueNumber
     * (same scheme), so matching is exact-string. If the feed has
     * not published the slot yet, retry once fresh, then give up
     * (caller falls back to the auto algorithm — never stalls,
     * never applies a wrong period's number).
     * Return: ['number'=>int, 'colour'=>str|null, 'api_period'=>str, 'status'=>'used']
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
                        'used', 'API result applied (exact issueNumber match)', $fetch['latency_ms']);
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
                            'used', 'API result applied after retry', $retry['latency_ms']);
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
