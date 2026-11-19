<?php 
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");
    include("nayakaphalitansa_mulaka_unohs.php");

    /* =========================================================
     * WinGo 1 Min — API issueNumber driven (UTC aligned)
     * Period id: UTC YYYYMMDD + 10001 + 4-digit serial (1..1440)
     * serial = floor(minutes_of_UTC_day / 1) + 1  (1-based slot)
     *
     * PERIOD RULE (API mapping):
     *   - Open betting period = latest published API issueNumber + 1
     *     (one new issue every 60 seconds).
     *   - API unavailable -> continue locally as last + 1 (same
     *     UTC wall-clock scheme, identical numbering).
     *   - Missed slots are backfilled in order, capped per run.
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = gmdate('Ymd');   // UTC date (API issueNumber date part)
    $secsUtc = intval(gmdate('H')) * 3600 + intval(gmdate('i')) * 60 + intval(gmdate('s'));
    $serial = intval(floor($secsUtc / 60)) + 1;
    if ($serial > 1440) $serial = 1440;
    $expected = $dinank . "10001" . sprintf("%04d", $serial);

    /* ---- API issueNumber sync: open slot = latest published + 1 ---- */
    $wingoTarget = $expected;
    $wingoFeed = wingo_api_fetch_feed($conn, '1m');
    if ($wingoFeed['ok'] && count($wingoFeed['candidates']) > 0) {
        $wingoLatest = $wingoFeed['candidates'][0]['period'];
        if ($wingoLatest !== null && preg_match('/^\d{17}$/', strval($wingoLatest))) {
            $wingoApiOpen = wingo_api_next_issue($wingoLatest);
            if ($wingoApiOpen !== null && strcasecmp($wingoApiOpen, $wingoTarget) > 0) {
                $wingoTarget = $wingoApiOpen;
            }
        }
    }

    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo1min_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_1min` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_1min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoTarget', '$tarika')");
            $nayiRow = true;
        } else if (substr($lastId, 0, 8) != $dinank) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_1min`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoTarget', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $wingoTarget) {
            // catch up: backfill every missed slot in order (+1 each)
            $wingoCur = $lastId;
            $wingoFilled = 0;
            while ($wingoFilled < 12) {
                $wingoNext = wingo_api_next_issue($wingoCur);
                if ($wingoNext === null || strcasecmp($wingoNext, $wingoTarget) > 0) break;
                mysqli_query($conn, "INSERT INTO `wingo_periods_1min` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoNext', '$tarika')");
                $wingoCur = $wingoNext;
                $nayiRow = true;
                $wingoFilled++;
                if (strcasecmp($wingoCur, $wingoTarget) === 0) break;
            }
        }

        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_1min SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo1min_period')");
    }
?>
