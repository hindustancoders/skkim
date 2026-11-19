<?php 
    include("serive/samparka.php");
    include("nayakaphalitansa_mulaka_unohs_zehn.php");

    /* =========================================================
     * WinGo 10 Min — wall-clock aligned period generation
     * Period id: YYYYMMDD + 10005 + 4-digit serial (1..144)
     * serial = floor(seconds_of_day / 600) + 1  (1-based slot)
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = date('Ymd');
    $secsToday = intval(date('H')) * 3600 + intval(date('i')) * 60 + intval(date('s'));
    $serial = intval(floor($secsToday / 600)) + 1;
    if ($serial > 144) $serial = 144;
    $expected = $dinank . "10005" . sprintf("%04d", $serial);

    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo10min_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_10min` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;
        $lastDate = ($lastId !== null && strlen($lastId) >= 8) ? substr($lastId, 0, 8) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_10min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_10min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastDate != $dinank) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_10min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_10min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $expected) {
            mysqli_query($conn, "INSERT INTO `wingo_periods_10min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        }

        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_10min SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo10min_period')");
    }
?>