<?php
/**
 * WinGo API Settings - live test endpoint (admin only)
 * POST game=30s|1m|3m|5m|10m
 */
session_start();
if (empty($_SESSION['unohs'])) {
    http_response_code(403);
    echo json_encode(['ok' => false, 'error' => 'unauthorized']);
    exit;
}

include(__DIR__ . "/conn.php");
include_once(__DIR__ . "/../wingo_api_lib.php");

header('Content-Type: application/json; charset=utf-8');

$game = isset($_POST['game']) ? preg_replace('/[^a-z0-9]/', '', strtolower($_POST['game'])) : '';
if (!in_array($game, ['30s', '1m', '3m', '5m', '10m'], true)) {
    echo json_encode(['ok' => false, 'error' => 'invalid game']);
    exit;
}

$periodTables = [
    '30s' => 'wingo_periods_30sec',
    '1m'  => 'wingo_periods_1min',
    '3m'  => 'wingo_periods_3min',
    '5m'  => 'wingo_periods_5min',
    '10m' => 'wingo_periods_10min',
];

// current local period for this game
$localPeriod = '-';
$r = mysqli_query($conn, "SELECT atadaaidi FROM `" . $periodTables[$game] . "` ORDER BY kramasankhye DESC LIMIT 1");
if ($r && mysqli_num_rows($r) > 0) {
    $localPeriod = mysqli_fetch_assoc($r)['atadaaidi'];
}

// live fetch (bypass cache)
$fetch = wingo_api_fetch_feed($conn, $game, true);

$apiPeriod = null; $number = null; $colour = null; $match = 'unknown';
if ($fetch['ok'] && count($fetch['candidates']) > 0) {
    $latest = $fetch['candidates'][0];
    $apiPeriod = $latest['period'];
    $number = $latest['number'];
    $colour = $latest['colour'];
    if ($localPeriod !== '-' && $apiPeriod !== null) {
        $ourSerial = wingo_api_serial_of($localPeriod);
        $apiSerial = wingo_api_serial_of($apiPeriod);
        if ($ourSerial !== null && $apiSerial !== null) {
            $match = ($ourSerial === $apiSerial) ? 'yes' : 'no';
        }
    }
}

echo json_encode([
    'ok'           => (bool) $fetch['ok'],
    'error'        => $fetch['error'],
    'latency_ms'   => $fetch['latency_ms'],
    'api_period'   => $apiPeriod,
    'number'       => $number,
    'colour'       => $colour,
    'local_period' => $localPeriod,
    'match'        => $match,
    'candidates'   => array_slice($fetch['candidates'], 0, 5),
    'raw'          => substr($fetch['raw'], 0, 1200),
]);
