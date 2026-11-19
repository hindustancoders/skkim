<?php
/**
 * WinGo FAST TICK (v4) — runs every ~5 seconds from the stack loop.
 * Keeps result declaration + history fast for ALL WinGo durations:
 *   - creates the open period instantly at every slot boundary
 *     (shared wingo_api_ensure_open_period engine, +1 rule)
 *   - settles any due period within ~5s of its slot end
 * All steps are idempotent and GET_LOCK protected, so running this
 * alongside cron_master.php is safe (no double rows / double payout).
 *
 * CLI ONLY:  php wingo_fast_tick.php
 */
if (php_sapi_name() !== 'cli') { http_response_code(403); exit("CLI only"); }

$baseDir = __DIR__;
include($baseDir . "/serive/samparka.php");
include_once($baseDir . "/wingo_api_lib.php");

/* 30s every tick; others cheap no-ops off their slot starts */
include($baseDir . "/niyamitakelasa30sec.php");   /* 30s creator + settlement */
include($baseDir . "/niyamitakelasa.php");        /* 1m  creator + settlement */
include($baseDir . "/niyamitakelasa_drei.php");   /* 3m  creator + settlement */
include($baseDir . "/niyamitakelasa_funf.php");   /* 5m  creator + settlement */
include($baseDir . "/niyamitakelasa_zehn.php");   /* 10m creator + settlement */
