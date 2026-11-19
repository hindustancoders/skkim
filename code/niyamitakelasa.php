<?php 
    include("serive/samparka.php");
    include("nayakaphalitansa_mulaka_unohs.php");

    /* =========================================================
     * WinGo 1 Min — wall-clock aligned period generation
     * Period id: YYYYMMDD + 10001 + 4-digit serial (1..1440)
     * serial = floor(minutes_of_day / 1) + 1  (1-based slot)
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = date('Ymd');
    $secsToday = intval(date('H')) * 3600 + intval(date('i')) * 60 + intval(date('s'));
    $serial = intval(floor($secsToday / 60)) + 1;
    if ($serial > 1440) $serial = 1440;
    $expected = $dinank . "10001" . sprintf("%04d", $serial);

    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo1min_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_1min` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;
        $lastDate = ($lastId !== null && strlen($lastId) >= 8) ? substr($lastId, 0, 8) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_1min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastDate != $dinank) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_1min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $expected) {
            mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$expected', '$tarika')");
            $nayiRow = true;
        }

        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_1min SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo1min_period')");
    }
?>