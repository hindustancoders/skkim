<?php 
    include("serive/samparka.php");
    include("nayakaphalitansa_mulaka_unohs30.php");

    /* =========================================================
     * WinGo 30 Sec — API issueNumber scheme (UTC aligned)
     * Period id: UTC YYYYMMDD + 10005 + 4-digit serial (1..2880)
     * serial = floor(seconds_of_UTC_day / 30) + 1  (1-based slot)
     * Same numbering as the external API (30S code = 5), e.g.
     * 20261119100051701 -> next slot 20261119100051702 (+1 each 30s)
     * Idempotent: current slot row is created once, duplicates
     * avoided via GET_LOCK + equality check.
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = gmdate('Ymd');   // UTC date (API issueNumber date part)
    $secsUtc = intval(gmdate('H')) * 3600 + intval(gmdate('i')) * 60 + intval(gmdate('s'));
    $serial = intval(floor($secsUtc / 30)) + 1;
    if ($serial > 2880) $serial = 2880;
    $expected = $dinank . "10005" . sprintf("%04d", $serial);

    // serialise creation across processes
    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo30_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_30sec` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;
        $lastDate = ($lastId !== null && strlen($lastId) >= 8) ? substr($lastId, 0, 8) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastDate != $dinank) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $expected) {
            // catch up to the current wall-clock slot (missed slots are skipped, not backfilled)
            mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        }
        // $lastId == $expected -> current slot already exists: no-op

        // Manual prediction is cleared only when a new period (slot) begins;
        // the result script also clears it right after consuming it.
        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_30sec SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo30_period')");
    }
?>