<?php
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");

    /* =========================================================
     * WinGo 1 Min — open period creator (v4, shared engine)
     * Period id: UTC YYYYMMDD + 10001 + 4-digit serial (1..1440)
     * serial = floor(minutes_of_UTC_day / 1) + 1 (1-based slot)
     *
     * PERIOD RULE (API mapping, +1 rule):
     *   - Open betting period = latest published issueNumber + 1
     *     (one new issue every 60 seconds).
     *   - API unavailable -> continue locally as last + 1 (same
     *     UTC wall-clock scheme, identical numbering).
     *   - Expired / settled top row is advanced instantly, missed
     *     slots are backfilled in order (capped).
     * ========================================================= */
    wingo_api_ensure_open_period($conn, '1m', 'wingo_periods_1min', 'wingo_manual_result_1min');

    include("nayakaphalitansa_mulaka_unohs.php");
?>
