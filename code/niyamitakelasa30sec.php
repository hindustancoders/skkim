<?php 
    include("serive/samparka.php");
    include_once("wingo_api_lib.php");
    include("nayakaphalitansa_mulaka_unohs30.php");

    /* =========================================================
     * WinGo 30 Sec — API issueNumber driven (UTC aligned)
     * Period id: UTC YYYYMMDD + 10005 + 4-digit serial (1..2880)
     * serial = floor(seconds_of_UTC_day / 30) + 1  (1-based slot)
     *
     * PERIOD RULE (API mapping):
     *   - The displayed/open betting period always follows the API
     *     issueNumber:  open slot = latest published issueNumber + 1
     *     (the API publishes one issue per 30s; after issue 161's
     *     data arrives, 162 arrives 30 seconds later).
     *   - If the API is not reachable / issueNumber not available,
     *     the period continues locally as last + 1 via the same
     *     UTC wall-clock scheme (identical numbering).
     *   - Missed slots (cron downtime) are backfilled in order so
     *     the period sequence stays continuous, capped per run.
     *
     * Idempotent: current slot row is created once, duplicates
     * avoided via GET_LOCK + equality check.
     * ========================================================= */
    $tarika = date('Y-m-d H:i:s');
    $dinank = gmdate('Ymd');   // UTC date (API issueNumber date part)
    $secsUtc = intval(gmdate('H')) * 3600 + intval(gmdate('i')) * 60 + intval(gmdate('s'));
    $serial = intval(floor($secsUtc / 30)) + 1;
    if ($serial > 2880) $serial = 2880;
    $expected = $dinank . "10005" . sprintf("%04d", $serial);

    /* ---- API issueNumber sync: open slot = latest published + 1 ---- */
    $wingoTarget = $expected;
    $wingoFeed = wingo_api_fetch_feed($conn, '30s');
    if ($wingoFeed['ok'] && count($wingoFeed['candidates']) > 0) {
        $wingoLatest = $wingoFeed['candidates'][0]['period'];
        if ($wingoLatest !== null && preg_match('/^\d{17}$/', strval($wingoLatest))) {
            $wingoApiOpen = wingo_api_next_issue($wingoLatest);
            if ($wingoApiOpen !== null && strcasecmp($wingoApiOpen, $wingoTarget) > 0) {
                $wingoTarget = $wingoApiOpen;   // API ahead of local clock -> follow the API
            }
        }
    }

    // serialise creation across processes
    $lockOk = mysqli_query($conn, "SELECT GET_LOCK('wingo30_period', 3) AS l");
    $lockRow = $lockOk ? mysqli_fetch_assoc($lockOk) : null;
    $haveLock = ($lockRow && intval($lockRow['l']) === 1);

    if ($haveLock) {
        $dekhakalakrama = mysqli_query($conn, "SELECT atadaaidi FROM `wingo_periods_30sec` ORDER BY kramasankhye DESC LIMIT 1");
        $kaladhadi = mysqli_num_rows($dekhakalakrama);
        $kalakramadhadi = mysqli_fetch_array($dekhakalakrama);
        $lastId = ($kaladhadi > 0) ? strval($kalakramadhadi['atadaaidi']) : null;

        $nayiRow = false;
        if ($lastId === null || strlen($lastId) != 17) {
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoTarget', '$tarika')");
            $nayiRow = true;
        } else if (substr($lastId, 0, 8) != $dinank) {
            // UTC day rolled over: start fresh with the current slot
            mysqli_query($conn, "TRUNCATE TABLE `wingo_periods_30sec`");
            mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoTarget', '$tarika')");
            $nayiRow = true;
        } else if ($lastId < $wingoTarget) {
            // catch up: backfill every missed slot in order (+1 each),
            // so period numbering stays continuous like the API feed
            $wingoCur = $lastId;
            $wingoFilled = 0;
            while ($wingoFilled < 12) {
                $wingoNext = wingo_api_next_issue($wingoCur);
                if ($wingoNext === null || strcasecmp($wingoNext, $wingoTarget) > 0) break;
                mysqli_query($conn, "INSERT INTO `wingo_periods_30sec` (`atadaaidi`, `dinankavannuracisi`) VALUES ('$wingoNext', '$tarika')");
                $wingoCur = $wingoNext;
                $nayiRow = true;
                $wingoFilled++;
                if (strcasecmp($wingoCur, $wingoTarget) === 0) break;
            }
        }
        // $lastId == $wingoTarget -> current slot already exists: no-op

        // Manual prediction is cleared only when a new period (slot) begins;
        // the result script also clears it right after consuming it.
        if ($nayiRow) {
            mysqli_query($conn, "UPDATE wingo_manual_result_30sec SET sthiti='0'");
        }
        mysqli_query($conn, "SELECT RELEASE_LOCK('wingo30_period')");
    }
?>
