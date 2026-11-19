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
        /* v4 migration: per-game shared feed cache columns (cross-process,
           so GetGameIssue / cron / fast loop all reuse one fetch) */
        foreach (['30s','1m','3m','5m','10m'] as $__gk) {
            $__cj = 'feed_json_' . $__gk;
            $__ca = 'feed_at_' . $__gk;
            $r1 = mysqli_query($conn, "SHOW COLUMNS FROM `wingo_api_config` LIKE '" . $__cj . "'");
            if ($r1 && mysqli_num_rows($r1) === 0) {
                mysqli_query($conn, "ALTER TABLE `wingo_api_config` ADD COLUMN `" . $__cj . "` MEDIUMTEXT NULL");
            }
            $r2 = mysqli_query($conn, "SHOW COLUMNS FROM `wingo_api_config` LIKE '" . $__ca . "'");
            if ($r2 && mysqli_num_rows($r2) === 0) {
                mysqli_query($conn, "ALTER TABLE `wingo_api_config` ADD COLUMN `" . $__ca . "` INT NULL DEFAULT 0");
            }
        }
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
     * HTTP fetch — DIRECT ONLY (v4, no proxies).
     * One short-timeout attempt per call. Fresh feed cached 6s:
     * first in a DB row (shared across ALL processes — GetGameIssue,
     * cron_master and the fast loop reuse the same fetch), then in a
     * per-process static. Circuit breaker opens for 60s after 3
     * consecutive failures so nothing ever hangs on a dead API.
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

        $colJson = 'feed_json_' . $gameKey;
        $colAt   = 'feed_at_' . $gameKey;
        $haveDbCols = array_key_exists($colAt, $cfg);
        $nowTs = time();

        /* dynamic TTL: the feed only changes once per interval, so cache
           half-interval (min 8s). Keeps request volume far below rate
           limits while staying fresh for every new issueNumber. */
        $ttl = max(8, intval(wingo_api_interval_of($gameKey) / 2));

        /* 1) process-local cache (cheapest) */
        if (!$forceFresh && isset($cache[$gameKey]) && ($nowTs - $cache[$gameKey]['t']) < $ttl) {
            return $cache[$gameKey]['data'];
        }

        /* 2) shared DB cache (cross-process; keeps GetGameIssue polling cheap) */
        if (!$forceFresh && $haveDbCols && intval($cfg[$colAt]) > 0
                && ($nowTs - intval($cfg[$colAt])) < $ttl && !empty($cfg[$colJson])) {
            $cand = wingo_api_parse_feed($cfg[$colJson]);
            if (count($cand) > 0) {
                $data = ['ok' => true, 'candidates' => $cand, 'raw' => '',
                         'latency_ms' => 0, 'error' => null];
                $cache[$gameKey] = ['t' => $nowTs, 'data' => $data];
                return $data;
            }
        }

        /* 3) circuit breaker FIRST — even force-fresh attempts must stop
              hammering a failing API (403s / timeouts / dead host) */
        if (!isset($breaker[$gameKey])) $breaker[$gameKey] = ['fails' => 0, 'last' => 0];
        if ($breaker[$gameKey]['fails'] >= 3 && ($nowTs - $breaker[$gameKey]['last']) < 60) {
            $data = $fail;
            $data['error'] = 'circuit-open (API unreachable, retrying later)';
            $cache[$gameKey] = ['t' => $nowTs, 'data' => $data];
            return $data;
        }

        /* 4) politeness gap: never curl the API more than once per 4s
              per game, even when multiple processes force-fresh at once */
        if ($haveDbCols && ($nowTs - intval($cfg[$colAt])) < 4) {
            $data = $fail;
            $data['error'] = 'min-gap (politeness, last attempt ' . ($nowTs - intval($cfg[$colAt])) . 's ago)';
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
            /* publish the fresh feed into the shared DB cache so every
               other process (GetGameIssue / cron / fast loop) reuses it */
            if ($haveDbCols) {
                mysqli_query($conn, "UPDATE `wingo_api_config` SET
                    `" . $colJson . "` = '" . mysqli_real_escape_string($conn, strval($raw)) . "',
                    `" . $colAt . "` = " . intval(time()) . "
                    WHERE id = 1");
            }
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
     * (same scheme), so matching is exact-string.
     *
     * v4 FAST+CORRECT (non-blocking): while the API is healthy but
     * has not yet published this slot's issueNumber, the caller is
     * told to WAIT and retries on the next fast tick (~5s) until
     * the grace window (slot end + 20s) passes. Never stalls:
     *   - API feed down            -> immediate fallback algorithm
     *   - grace window expired     -> fallback algorithm
     *   - issue not published yet  -> ['status'=>'wait'] (no block)
     * Return: ['number'=>int,'colour'=>str|null,'api_period'=>str,'status'=>'used']
     *      or ['status'=>'wait'] (caller skips settlement this tick)
     *      or null (use fallback algorithm)
     * --------------------------------------------------------- */
    function wingo_api_interval_of($gameKey) {
        $map = ['30s' => 30, '1m' => 60, '3m' => 180, '5m' => 300, '10m' => 600];
        return isset($map[$gameKey]) ? $map[$gameKey] : 60;
    }

    function wingo_api_resolve($conn, $gameKey, $localPeriodId, $graceSec = 20) {
        $cfg = wingo_api_get_config($conn);
        if (!wingo_api_game_enabled($cfg, $gameKey)) return null;

        $localPeriodId = strval($localPeriodId);
        $fetch = wingo_api_fetch_feed($conn, $gameKey, true);

        if ($fetch['ok']) {
            foreach ($fetch['candidates'] as $c) {
                if ($c['period'] !== null && strcasecmp($c['period'], $localPeriodId) === 0) {
                    wingo_api_log_event($conn, $gameKey, $localPeriodId, $c['period'], $c['number'], $c['colour'],
                        'used', 'API result applied (exact issueNumber match)', $fetch['latency_ms']);
                    return ['number' => $c['number'], 'colour' => $c['colour'], 'api_period' => $c['period'], 'status' => 'used'];
                }
            }
            /* feed healthy but this issue not published yet:
               wait (grace window from slot end) instead of publishing
               a wrong local result — caller retries next tick */
            $slot = wingo_api_slot_times($localPeriodId, wingo_api_interval_of($gameKey), $gameKey);
            $deadline = ($slot !== null) ? $slot['end'] + $graceSec : time() + 10;
            if (time() < $deadline) {
                wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'wait',
                    'API feed healthy, issueNumber ' . $localPeriodId . ' not published yet (grace until ' . date('H:i:s', $deadline) . ')', $fetch['latency_ms']);
                return ['status' => 'wait'];
            }
            wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'fallback',
                'API grace window expired without issueNumber ' . $localPeriodId . '; auto algorithm used', $fetch['latency_ms']);
            return null;
        }

        /* feed fetch failed — decide: wait (throttled/unknown) or fallback (API really down) */
        $errStr = strval($fetch['error']);
        if (strpos($errStr, 'min-gap') === 0) {
            /* just politeness-throttled: state unknown -> retry next tick (grace-bounded) */
            $slot = wingo_api_slot_times($localPeriodId, wingo_api_interval_of($gameKey), $gameKey);
            $deadline = ($slot !== null) ? $slot['end'] + $graceSec : time() + 10;
            if (time() < $deadline) {
                return ['status' => 'wait'];
            }
            wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'fallback',
                'grace expired while feed throttled; auto algorithm used', $fetch['latency_ms']);
            return null;
        }
        /* feed DOWN (curl error / HTTP error / circuit open) -> never wait on a dead API */
        wingo_api_log_event($conn, $gameKey, $localPeriodId, null, null, null, 'fallback',
            'API feed failed (' . $errStr . '); auto algorithm used', $fetch['latency_ms']);
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

    /* ---------------------------------------------------------
     * WALL-CLOCK SLOT — the period id the given game should have
     * OPEN right now, using exactly the same scheme as the API
     * issueNumber series (+1 per interval):
     *   30s -> date(UTC)+"10005"+serial  (serial = slot of UTC day)
     *   1m  -> "10001", 3m -> "10002", 5m -> "10003"  (UTC)
     *   10m -> legacy IST scheme "10004" (unchanged, no API feed)
     * --------------------------------------------------------- */
    function wingo_api_wallclock_slot($gameKey) {
        switch ($gameKey) {
            case '30s': $pfx = '10005'; $iv = 30;  $max = 2880; $utc = true;  break;
            case '1m':  $pfx = '10001'; $iv = 60;  $max = 1440; $utc = true;  break;
            case '3m':  $pfx = '10002'; $iv = 180; $max = 480;  $utc = true;  break;
            case '5m':  $pfx = '10003'; $iv = 300; $max = 288;  $utc = true;  break;
            case '10m': $pfx = '10004'; $iv = 600; $max = 144;  $utc = false; break;
            default: return null;
        }
        if ($utc) {
            $date = gmdate('Ymd');
            $secs = intval(gmdate('H')) * 3600 + intval(gmdate('i')) * 60 + intval(gmdate('s'));
        } else {
            $date = date('Ymd');
            $secs = intval(date('H')) * 3600 + intval(date('i')) * 60 + intval(date('s'));
        }
        $serial = intval(floor($secs / $iv)) + 1;
        if ($serial > $max) $serial = $max;
        return ['period' => $date . $pfx . sprintf("%04d", $serial), 'interval' => $iv];
    }

    /* ---------------------------------------------------------
     * SELF-HEALING OPEN PERIOD (v4 core fix).
     * Guarantees the currently-OPEN betting period always exists,
     * follows the +1 rule (open = latest published issueNumber + 1,
     * or wall-clock last + 1 when the API is unavailable) and NEVER
     * leaves an expired/settled period on top of the table. Used by
     * GetGameIssue (instant countdown flip at every boundary, all
     * durations 30s/1m/3m/5m/10m) and by the cron creators — one
     * single source of truth.
     *
     * Safe to call from any process / any frequency:
     *   GET_LOCK serialises writers, inserts are +1 chained, backfill
     *   is capped, and forward rows (API ahead) are never rewound.
     * Returns the open period id (string) or null on lock failure.
     * --------------------------------------------------------- */
    function wingo_api_ensure_open_period($conn, $gameKey, $periodsTable, $manualTable) {
        $slot = wingo_api_wallclock_slot($gameKey);
        if ($slot === null) return null;

        /* ---- open target = wall-clock slot, or API latest + 1 when ahead ---- */
        $target = $slot['period'];
        $cfg = wingo_api_get_config($conn);
        if (wingo_api_game_enabled($cfg, $gameKey)) {
            $feed = wingo_api_fetch_feed($conn, $gameKey);
            if ($feed['ok'] && count($feed['candidates']) > 0) {
                $latest = $feed['candidates'][0]['period'];
                if ($latest !== null && preg_match('/^\d{17}$/', strval($latest))) {
                    $apiOpen = wingo_api_next_issue($latest);
                    if ($apiOpen !== null && strcasecmp($apiOpen, $target) > 0) {
                        $target = $apiOpen;     // API ahead of local clock -> follow the API
                    }
                }
            }
        }

        $safeTable  = preg_replace('/[^a-zA-Z0-9_]/', '', $periodsTable);
        $safeManual = preg_replace('/[^a-zA-Z0-9_]/', '', $manualTable);
        $safeRes    = str_replace('_periods_', '_results_', $safeTable);
        $lockName   = 'wingo_open_' . preg_replace('/[^a-z0-9]/i', '', $gameKey);

        $lockOk = mysqli_query($conn, "SELECT GET_LOCK('" . $lockName . "', 3) AS l");
        $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
        if (!$lockRow || intval($lockRow['l']) !== 1) return null;   // another writer mid-flight

        $dekh = mysqli_query($conn, "SELECT atadaaidi FROM `" . $safeTable . "` ORDER BY kramasankhye DESC LIMIT 1");
        $lastId = null;
        if ($dekh && mysqli_num_rows($dekh) > 0) {
            $r = mysqli_fetch_array($dekh);
            $lastId = strval($r['atadaaidi']);
        }
        $tarika = date('Y-m-d H:i:s');
        $now = time();
        $inserted = false;

        if ($lastId === null || strlen($lastId) != 17 || !ctype_digit($lastId)) {
            /* no usable row -> start the day/scheme fresh */
            mysqli_query($conn, "TRUNCATE TABLE `" . $safeTable . "`");
            mysqli_query($conn, "INSERT INTO `" . $safeTable . "` (`atadaaidi`, `dinankavannuracisi`) VALUES ('" . $target . "', '" . $tarika . "')");
            $lastId = $target;
            $inserted = true;
        } else if (strcasecmp($lastId, $target) < 0) {
            /* behind the open target -> backfill every missed slot (+1 each) */
            $cur = $lastId;
            $filled = 0;
            while ($filled < 20) {
                $nxt = wingo_api_next_issue($cur);
                if ($nxt === null || strcasecmp($nxt, $target) > 0) break;
                mysqli_query($conn, "INSERT INTO `" . $safeTable . "` (`atadaaidi`, `dinankavannuracisi`) VALUES ('" . $nxt . "', '" . $tarika . "')");
                $cur = $nxt;
                $inserted = true;
                $filled++;
                if (strcasecmp($cur, $target) === 0) break;
            }
            $lastId = $cur;
        } else if (strcasecmp($lastId, $target) === 0) {
            /* current wall-clock slot on top: if its window is already
               over (or already settled) open the NEXT period (+1) so the
               countdown never sticks on a finished period */
            $st = wingo_api_slot_times($lastId, $slot['interval'], $gameKey);
            $expired = ($st !== null && $st['end'] <= $now);
            $settled = false;
            if (!$expired) {
                $rc = mysqli_query($conn, "SELECT 1 FROM `" . $safeRes . "` WHERE `kalaparichaya`='" . $lastId . "' LIMIT 1");
                if ($rc && mysqli_num_rows($rc) > 0) $settled = true;
            }
            if ($expired || $settled) {
                $nxt = wingo_api_next_issue($lastId);
                if ($nxt !== null) {
                    mysqli_query($conn, "INSERT INTO `" . $safeTable . "` (`atadaaidi`, `dinankavannuracisi`) VALUES ('" . $nxt . "', '" . $tarika . "')");
                    $lastId = $nxt;
                    $inserted = true;
                }
            }
        }
        /* lastId > target (API ahead) -> keep the API-driven row as-is */

        if ($inserted) {
            /* new open period begins: clear stale manual predictions */
            mysqli_query($conn, "UPDATE `" . $safeManual . "` SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('" . $lockName . "')");
        return $lastId;
    }
}
