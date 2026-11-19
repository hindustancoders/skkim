<?php
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");

    /* =========================================================
     * WinGo 5 Min — open period creator (v4, shared engine)
     * Period id: UTC YYYYMMDD + 10003 + 4-digit serial (1..288)
     * serial = floor(seconds_of_UTC_day / 300) + 1
     * Open period = latest published issueNumber + 1 (every 300s);
     * API down -> local last + 1 (identical numbering).
     * ========================================================= */
    wingo_api_ensure_open_period($conn, '5m', 'wingo_periods_5min', 'wingo_manual_result_5min');

    include("nayakaphalitansa_mulaka_unohs_funf.php");
?>
