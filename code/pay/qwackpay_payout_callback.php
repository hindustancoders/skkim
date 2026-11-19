<?php
/**
 * QwackPay Payout Async Callback (webhook -> notify_url)
 * Docs: https://6ue86z5lbf.apifox.cn
 *
 * Gateway POSTs JSON:
 *   merchant_order_id, qwack_order_id, amount, status (success|failed), utr, sign
 * Server MUST verify sign and reply plain text: success
 */

require_once(__DIR__ . "/qwackpay_lib.php");

if (file_exists(__DIR__ . "/../serive/samparka.php")) {
    include_once(__DIR__ . "/../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../../serive/samparka.php")) {
    include_once(__DIR__ . "/../../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../conn.php")) {
    include_once(__DIR__ . "/../conn.php");
}
if (!isset($conn) || !$conn) { echo "db error"; exit; }

$rawInput = file_get_contents("php://input");
qwackpay_log("Payout webhook received", array('x-api-key' => $_SERVER['HTTP_X_API_KEY'] ?? '', 'body' => $rawInput));

$data = json_decode($rawInput, true);
if (!is_array($data) || empty($data)) $data = $_POST;
if (!is_array($data) || empty($data)) {
    qwackpay_log("Payout callback: empty payload", $rawInput);
    http_response_code(400);
    echo "invalid payload";
    exit;
}

$merchantOrder = trim($data['merchant_order_id'] ?? '');
$qwackOrderId  = trim($data['qwack_order_id'] ?? '');
$status        = strtolower(trim($data['status'] ?? ''));

if ($merchantOrder === '') { http_response_code(400); echo "missing merchant_order_id"; exit; }

/* Find payout order */
$stmt = mysqli_prepare($conn, "SELECT * FROM `payout_orders` WHERE `mch_transfer_id` = ? LIMIT 1");
mysqli_stmt_bind_param($stmt, 's', $merchantOrder);
mysqli_stmt_execute($stmt);
$res = mysqli_stmt_get_result($stmt);
if (!$res || mysqli_num_rows($res) == 0) {
    qwackpay_log("Payout callback: order not found $merchantOrder");
    http_response_code(404);
    echo "order not found";
    exit;
}
$payout = mysqli_fetch_assoc($res);
if (in_array($payout['status'], array('success', 'fail', 'rejected'))) {
    qwackpay_log("Payout callback: already final status for $merchantOrder ({$payout['status']})");
    echo "success";
    exit;
}

/* Verify signature: resolve account by X-API-Key / stored account */
$acct = qwackpay_get_account_by_key($conn, trim($_SERVER['HTTP_X_API_KEY'] ?? ''));
if (!$acct) {
    $aid = intval($payout['account_id']);
    $r2 = mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE id = $aid LIMIT 1");
    if ($r2 && mysqli_num_rows($r2)) $acct = mysqli_fetch_assoc($r2);
}
if (!$acct) { http_response_code(400); echo "unknown merchant"; exit; }

if (!qwackpay_verify_signature($data, $acct['api_key'])) {
    qwackpay_log("Payout callback SIGN FAIL $merchantOrder: " . json_encode($data));
    http_response_code(400);
    echo "signature fail";
    exit;
}

$withdrawId = intval($payout['withdraw_id']);
$userId = intval($payout['user_id']);
$amount = floatval($payout['amount']);

if ($status === 'success') {
    /* Payout success: mark payout + withdraw completed */
    $stmt = mysqli_prepare($conn, "UPDATE `payout_orders` SET `status`='success', `trade_no`=?, `resp_code`='SUCCESS', `api_response`=?, `updated_at`=NOW() WHERE `id`=?");
    $raw = json_encode($data);
    $pid = intval($payout['id']);
    mysqli_stmt_bind_param($stmt, 'ssi', $qwackOrderId, $raw, $pid);
    mysqli_stmt_execute($stmt);

    mysqli_query($conn, "UPDATE `withdraw_requests` SET `sthiti`='1', `tike`='Completed', `remarks`=CONCAT(remarks,' [QwackPay auto-paid $qwackOrderId]') WHERE `shonu`='$withdrawId' AND `sthiti` IN ('0','3')");

    $title = "Withdrawal Paid";
    $today = date('Y-m-d H:i:s');
    $stmt3 = mysqli_prepare($conn, "INSERT INTO `user_notifications` (`state`, `title`, `user_id`, `created_at`) VALUES (0, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt3, 'sis', $title, $userId, $today);
    mysqli_stmt_execute($stmt3);

    qwackpay_log("Payout callback SUCCESS withdraw=$withdrawId amount=$amount qwackOrder=$qwackOrderId");
    echo "success";
    exit;
} else {
    /* Payout failed: mark + refund wallet */
    $stmt = mysqli_prepare($conn, "UPDATE `payout_orders` SET `status`='fail', `trade_no`=?, `resp_code`='FAIL', `error_msg`='Gateway reported failure', `api_response`=?, `updated_at`=NOW() WHERE `id`=?");
    $raw = json_encode($data);
    $pid = intval($payout['id']);
    mysqli_stmt_bind_param($stmt, 'ssi', $qwackOrderId, $raw, $pid);
    mysqli_stmt_execute($stmt);

    mysqli_query($conn, "UPDATE `withdraw_requests` SET `sthiti`='2', `tike`='Rejected', `remarks`=CONCAT(remarks,' [QwackPay payout failed - refunded]') WHERE `shonu`='$withdrawId' AND `sthiti` IN ('0','3')");

    /* Refund wallet */
    $wq = mysqli_query($conn, "SELECT motta FROM `user_wallets` WHERE `balakedara` = '$userId'");
    if (mysqli_num_rows($wq) > 0) {
        $stmt2 = mysqli_prepare($conn, "UPDATE `user_wallets` SET `motta` = ROUND(motta + ?, 2) WHERE `balakedara` = ?");
        mysqli_stmt_bind_param($stmt2, 'di', $amount, $userId);
        mysqli_stmt_execute($stmt2);
        qwackpay_log("Payout callback FAIL -> refunded $amount to user $userId (withdraw=$withdrawId)");
    }
    echo "success";
    exit;
}
