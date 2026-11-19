<?php 
    include("serive/samparka.php");
    include("nayakaphalitansa_mulaka_unohs30.php");
    
    // Generate identifiers for the first and last periods of the current day (17 digits)
    $prathama = date('Ymd') . "10004" . sprintf("%04d", 1);
    $sesa = date('Ymd') . "10004" . sprintf("%04d", 2880); // 24 hours * 60 minutes * 2 (30 sec intervals)

    // Calculate the current time-based identifier
    $ajitarika = date('Ymd');
    $ghanta = (int)date('H');
    $nimisa = $ghanta * 60;
    $bartamannimisa = (int)date('i');
    $bartamannisekanda = (int)date('s');

    // Total elapsed 30-second intervals in the day so far
    $elapsedIntervals = ($nimisa + $bartamannimisa) * 2 + floor($bartamannisekanda / 30);
    $bartamankalakrama = $ajitarika . "10004" . sprintf("%04d", $elapsedIntervals + 1);

    $tarika = date('Y-m-d H:i:s');

    // Fetch the latest identifier from the database
    $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi, dinankavannuracisi FROM `wingo_periods_30sec` ORDER BY kramasankhye DESC LIMIT 1");
    $kaladhadi = mysqli_num_rows($dekhakalakrama);
    $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);

    // Prevent double execution within 15 seconds
    if ($kaladhadi > 0 && isset($kalakramadhadi['dinankavannuracisi'])) {
        $last_time = strtotime($kalakramadhadi['dinankavannuracisi']);
        if ((time() - $last_time) < 15) {
            exit;
        }
    }

    if ($kaladhadi == null || strlen($kalakramadhadi['atadaaidi']) != 17) {
        $katiba = mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
        $tathya = mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$bartamankalakrama', '$tarika')");
    } else if (substr($kalakramadhadi['atadaaidi'], 0, 8) < $ajitarika) {
        $katiba = mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
        $tathya = mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$prathama', '$tarika')");
    } else {
        $lastPeriodNum = (int)substr($kalakramadhadi['atadaaidi'], 13);
        $expectedPeriodNum = $elapsedIntervals + 1;
        if (abs($lastPeriodNum - $expectedPeriodNum) <= 3) {
            $parabartikrama = $kalakramadhadi['atadaaidi'] + 1;
        } else {
            $parabartikrama = $bartamankalakrama;
        }
        $tathya = mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$parabartikrama', '$tarika')");
    }

    // Reset all statuses in the `wingo_manual_result_30sec` table
    $safa_shonu = mysqli_query($conn, "UPDATE wingo_manual_result_30sec SET sthiti='0'");
?>