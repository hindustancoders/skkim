<?php
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");

    /* =========================================================
     * WinGo 10 Min — open period creator (v4, shared engine)
     * Period id: IST YYYYMMDD + 10004 + 4-digit serial (1..144)
     * serial = floor(seconds_of_IST_day / 600) + 1  (1-based slot)
     * (prefix 10005 belongs to the 30s API scheme, so 10m uses the
     *  free 10004 prefix to avoid id collisions; no external API
     *  endpoint for 10m — en_10m stays off by default)
     * Missed slots backfilled +1 in order; expired/settled top row
     * advances instantly so the countdown never sticks.
     * ========================================================= */
    wingo_api_ensure_open_period($conn, '10m', 'wingo_periods_10min', 'wingo_manual_result_10min');

    include("nayakaphalitansa_mulaka_unohs_zehn.php");
?>
