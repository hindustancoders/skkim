<?php 
    include("serive/samparka.php");
    include("nayakaphalitansa_mulaka_unohs_drei.php");

    /* =========================================================
     * WinGo 3 Min — API issueNumber scheme (UTC aligned)
     * Period id: UTC YYYYMMDD + 10002 + 4-digit serial (1..480)
     * serial = floor(seconds_of_UTC_day / 180) + 1  (1-based slot)
     * Same numbering as the external API (3M code = 2)
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = gmdate('Ymd');   // UTC date (API issueNumber date part)
    $secsUtc = intval(gmdate('H')) * 3600 + intval(gmdate('i')) * 60 + intval(gmdate('s'));
    $serial = intval(floor($secsUtc / 180)) + 1;
    if ($serial > 480) $serial = 480;
    $expected = $dinank . "10002" . sprintf("%04d", $serial);

    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo3min_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_3min` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;
        $lastDate = ($lastId !== null && strlen($lastId) >= 8) ? substr($lastId, 0, 8) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_3min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_3min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastDate != $dinank) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_3min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_3min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $expected) {
            mysqli_query($conn, "INSERT INTO `wingo_periods_3min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        }

        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_3min SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo3min_period')");
    }
?>