<?php
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");

    /* =========================================================
     * WinGo 3 Min — open period creator (v4, shared engine)
     * Period id: UTC YYYYMMDD + 10002 + 4-digit serial (1..480)
     * serial = floor(seconds_of_UTC_day / 180) + 1
     * Open period = latest published issueNumber + 1 (every 180s);
     * API down -> local last + 1 (identical numbering).
     * ========================================================= */
    wingo_api_ensure_open_period($conn, '3m', 'wingo_periods_3min', 'wingo_manual_result_3min');

    include("nayakaphalitansa_mulaka_unohs_drei.php");
?>
