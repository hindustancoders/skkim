<?php
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");

    /* =========================================================
     * WinGo 30 Sec — open period creator (v4, shared engine)
     * Period id: UTC YYYYMMDD + 10005 + 4-digit serial (1..2880)
     * serial = floor(seconds_of_UTC_day / 30) + 1 (1-based slot)
     *
     * PERIOD RULE (API mapping, +1 rule):
     *   - Open betting period = latest published issueNumber + 1
     *     (one new issue every 30s: after 161 arrives, 162 comes
     *     30 seconds later).
     *   - API unavailable -> continue locally as last + 1 via the
     *     identical UTC wall-clock scheme.
     *   - Expired / settled top row is advanced instantly, missed
     *     slots are backfilled in order (capped).
     *
     * The whole logic lives in wingo_api_ensure_open_period() so
     * that GetGameIssue, cron_master and the fast loop all share
     * ONE implementation. Settlement follows below.
     * ========================================================= */
    wingo_api_ensure_open_period($conn, '30s', 'wingo_periods_30sec', 'wingo_manual_result_30sec');

    include("nayakaphalitansa_mulaka_unohs30.php");
?>
