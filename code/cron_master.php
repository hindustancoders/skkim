<?php
/**
 * Master Cron Job Runner for BharatGames
 * 
 * Automatically manages period generation and game calculations for all games:
 * - WinGo: 30s, 1m, 3m, 5m, 10m
 * - 5D Lottery: 1m, 3m, 5m, 10m
 * - K3 Lottery: 1m, 3m, 5m, 10m
 * - TRX WinGo: 1m, 3m, 5m, 10m
 * - Daily Salary & Spin resets
 * 
 * Can be run via cPanel / CLI:
 * * * * * * php /path/to/public_html/cron_master.php >/dev/null 2>&1
 * Or via Web/Curl:
 * https://bharatgames.online/cron_master.php?key=2c8938261d4aa749ce3190c36e6a71e1
 */

ignore_user_abort(true);
set_time_limit(120);
date_default_timezone_set('Asia/Kolkata');
define('CRON_MASTER_RUN', 1);   // lets game scripts run under web cron too

// Security check for web invocation
if (php_sapi_name() !== 'cli') {
    $secretKey = "2c8938261d4aa749ce3190c36e6a71e1";
    if (!isset($_GET['key']) || $_GET['key'] !== $secretKey) {
        http_response_code(403);
        die("Access denied. Invalid cron key.");
    }
}

$startTime = microtime(true);
$baseDir = __DIR__;
$logs = [];

function run_game_script($filePath) {
    global $logs;
    if (file_exists($filePath)) {
        ob_start();
        try {
            include($filePath);
            $output = ob_get_clean();
            $logs[] = "[" . date('H:i:s') . "] Executed: " . basename($filePath);
        } catch (Throwable $e) {
            ob_end_clean();
            $logs[] = "[" . date('H:i:s') . "] ERROR in " . basename($filePath) . ": " . $e->getMessage();
        }
    } else {
        $logs[] = "[" . date('H:i:s') . "] File missing: " . basename($filePath);
    }
}

$currentMinute = intval(date('i'));
$currentHour = intval(date('H'));

// ==========================================
// 1. Every 1-Minute Games (Run Every Minute)
// ==========================================
run_game_script($baseDir . "/niyamitakelasa.php");         // WinGo 1 Min
run_game_script($baseDir . "/niyamitakelasa_aidudi.php");  // 5D 1 Min
run_game_script($baseDir . "/niyamitakelasa_kemuru.php");  // K3 1 Min
run_game_script($baseDir . "/ktrx.php");                   // TRX 1 Min
run_game_script($baseDir . "/niyamitakelasa30sec.php");    // WinGo 30 Sec (1st run)

// ==========================================
// 2. Every 3-Minute Games
// ==========================================
if ($currentMinute % 3 === 0) {
    run_game_script($baseDir . "/niyamitakelasa_drei.php");         // WinGo 3 Min
    run_game_script($baseDir . "/niyamitakelasa_aidudi_drei.php");  // 5D 3 Min
    run_game_script($baseDir . "/niyamitakelasa_kemuru_drei.php");  // K3 3 Min
    run_game_script($baseDir . "/ktrx3.php");                       // TRX 3 Min
}

// ==========================================
// 3. Every 5-Minute Games
// ==========================================
if ($currentMinute % 5 === 0) {
    run_game_script($baseDir . "/niyamitakelasa_funf.php");         // WinGo 5 Min
    run_game_script($baseDir . "/niyamitakelasa_aidudi_funf.php");  // 5D 5 Min
    run_game_script($baseDir . "/niyamitakelasa_kemuru_funf.php");  // K3 5 Min
    run_game_script($baseDir . "/ktrx5.php");                       // TRX 5 Min
}

// ==========================================
// 3.5 Gateway Payout Status Sync (once per 5-minute window)
// WatchPay: api.wataiglobal.com/query/transfer
// QwackPay: qwackpay.com/api/v1/order/query
// ==========================================
if ($currentMinute % 5 === 0) {
    $payoutSyncMarker = $baseDir . "/.last_payout_sync";
    if (!file_exists($payoutSyncMarker) || (time() - filemtime($payoutSyncMarker)) >= 270) {
        @touch($payoutSyncMarker);
        try {
        if (file_exists($baseDir . "/pay/watchpay_lib.php")) {
            require_once($baseDir . "/pay/watchpay_lib.php");
            require_once($baseDir . "/pay/watchpay_actions.php");
            $cronConn = mysqli_connect('127.0.0.1', 'bhar42501_SQL', 'BharatG7_Kx9mQ2vL', 'bhar42501_SQL');
            if ($cronConn) {
                mysqli_set_charset($cronConn, 'utf8mb4');
                $syncRes = watchpay_action_sync($cronConn);
                $logs[] = "[" . date('H:i:s') . "] WatchPay payout sync: checked={$syncRes['checked']} updated={$syncRes['updated']}";
                if (file_exists($baseDir . "/pay/qwackpay_lib.php")) {
                    require_once($baseDir . "/pay/qwackpay_lib.php");
                    require_once($baseDir . "/pay/qwackpay_actions.php");
                    $syncRes2 = qwackpay_action_sync($cronConn);
                    $logs[] = "[" . date('H:i:s') . "] QwackPay payout sync: checked={$syncRes2['checked']} updated={$syncRes2['updated']}";
                }
                mysqli_close($cronConn);
            } else {
                $logs[] = "[" . date('H:i:s') . "] Gateway payout sync: DB connection failed";
            }
        }
    } catch (Throwable $e) {
        $logs[] = "[" . date('H:i:s') . "] Gateway payout sync ERROR: " . $e->getMessage();
    }
    }
}

// ==========================================
// 4. Every 10-Minute Games
// ==========================================
if ($currentMinute % 10 === 0) {
    run_game_script($baseDir . "/niyamitakelasa_zehn.php");         // WinGo 10 Min
    run_game_script($baseDir . "/niyamitakelasa_aidudi_zehn.php");  // 5D 10 Min
    run_game_script($baseDir . "/niyamitakelasa_kemuru_zehn.php");  // K3 10 Min
    run_game_script($baseDir . "/ktrx10.php");                      // TRX 10 Min
}

// ==========================================
// 5. Daily Midnight Maintenance (00:00, once per day)
// ==========================================
if ($currentHour === 0 && $currentMinute === 0) {
    $midnightMarker = $baseDir . "/.last_midnight_maint";
    if (!file_exists($midnightMarker) || date('Ymd', filemtime($midnightMarker)) !== date('Ymd')) {
        @touch($midnightMarker);
        run_game_script($baseDir . "/atcron.php");
        run_game_script($baseDir . "/clear_spin.php");
    }
}

// ==========================================
// 6. 30-Second Interval Handling
// ==========================================
// Wait 15 seconds from start and run 30-second game again
// (15s tick cadence keeps result resolution within ~15s of slot end)
$elapsed = microtime(true) - $startTime;
$sleepTime = 15 - intval($elapsed);
if ($sleepTime > 0) {
    sleep($sleepTime);
    run_game_script($baseDir . "/niyamitakelasa30sec.php");    // WinGo 30 Sec (2nd run)
}

$totalTime = round(microtime(true) - $startTime, 2);
$logs[] = "Total Execution Time: {$totalTime}s";

// Output or log summary
if (php_sapi_name() === 'cli') {
    echo implode("\n", $logs) . "\n";
} else {
    header('Content-Type: application/json');
    echo json_encode([
        'status' => 'success',
        'timestamp' => date('Y-m-d H:i:s'),
        'execution_time' => $totalTime,
        'logs' => $logs
    ], JSON_PRETTY_PRINT);
}
