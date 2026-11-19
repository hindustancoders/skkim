<?php
/**
 * WinGo FAST TICK (v5) — runs every ~3.5 seconds from the stack loop.
 * Keeps result declaration + history fast for ALL WinGo durations:
 *   - creates the open period instantly at every slot boundary
 *     (shared wingo_api_ensure_open_period engine, +1 rule)
 *   - settles any due period within ~3-4s of its slot end
 *   - games whose slot ended MOST RECENTLY are settled first, so the
 *     result a countdown is waiting for always has priority
 * All steps are idempotent and GET_LOCK protected, so running this
 * alongside cron_master.php is safe (no double rows / double payout).
 *
 * CLI:       php wingo_fast_tick.php
 * Web cron:  https://YOUR-DOMAIN/wingo_fast_tick.php?key=2c8938261d4aa749ce3190c36e6a71e1
 *            (same key as cron_master.php — cPanel cron 2 lines total)
 */
if (php_sapi_name() !== 'cli') {
    /* web cron: same secret key as cron_master.php */
    $secretKey = "2c8938261d4aa749ce3190c36e6a71e1";
    if (!isset($_GET['key']) || $_GET['key'] !== $secretKey) {
        http_response_code(403);
        exit("Access denied. Invalid cron key.");
    }
    ignore_user_abort(true);
    set_time_limit(60);
}

$baseDir = __DIR__;
include($baseDir . "/serive/samparka.php");
include_once($baseDir . "/wingo_api_lib.php");

/* Order games by "phase since last slot boundary" — the game whose slot
   just ended gets settled FIRST (minimal result latency). */
$games = [
    ['30s', 'niyamitakelasa30sec.php', 30],
    ['1m',  'niyamitakelasa.php',      60],
    ['3m',  'niyamitakelasa_drei.php', 180],
    ['5m',  'niyamitakelasa_funf.php', 300],
    ['10m', 'niyamitakelasa_zehn.php', 600],
];
usort($games, function ($a, $b) {
    return (time() % $a[2]) <=> (time() % $b[2]);
});

foreach ($games as $g) {
    include($baseDir . "/" . $g[1]);
}
