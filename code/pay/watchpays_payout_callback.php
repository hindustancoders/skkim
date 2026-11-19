<?php
/**
 * WatchPay Payout Async Callback (代付异步通知) -> back_url
 * Official docs: https://www.showdoc.com.cn/WatchPay
 *
 * Gateway POSTs FORM data:
 *   tradeResult (1=success, 2=fail), merTransferId, merNo, tradeNo,
 *   transferAmount, applyDate, version, respCode, sign, signType
 * Reply "success" after processing.
 */

require_once(__DIR__ . "/watchpay_lib.php");

if (file_exists(__DIR__ . "/../serive/samparka.php")) {
    include_once(__DIR__ . "/../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../../serive/samparka.php")) {
    include_once(__DIR__ . "/../../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../conn.php")) {
    include_once(__DIR__ . "/../conn.php");
}
if (!isset($conn) || !$conn) { echo "db error"; exit; }

watchpay_log("Payout webhook received (POST)", $_POST);

$data = $_POST;
if (empty($data)) {
    $raw = file_get_contents("php://input");
    $json = json_decode($raw, true);
    if (is_array($json) && !empty($json)) $data = $json;
    else { watchpay_log("Payout callback: empty payload", $raw); http_response_code(400); echo "invalid payload"; exit; }
}

$merTransferId  = trim($data['merTransferId'] ?? '');
$merNo          = trim($data['merNo'] ?? '');
$tradeResult    = trim($data['tradeResult'] ?? '');
$tradeNo        = trim($data['tradeNo'] ?? '');
$transferAmount = floatval($data['transferAmount'] ?? 0);

if ($merTransferId === '') { http_response_code(400); echo "missing merTransferId"; exit; }

/* Find payout order */
$stmt = mysqli_prepare($conn, "SELECT * FROM `payout_orders` WHERE `mch_transfer_id` = ? LIMIT 1");
mysqli_stmt_bind_param($stmt, 's', $merTransferId);
mysqli_stmt_execute($stmt);
$res = mysqli_stmt_get_result($stmt);
if (!$res || mysqli_num_rows($res) == 0) {
    watchpay_log("Payout callback: order not found $merTransferId");
    http_response_code(404); echo "order not found"; exit;
}
$payout = mysqli_fetch_assoc($res);
if (in_array($payout['status'], array('success', 'fail', 'rejected'))) {
    watchpay_log("Payout callback: already final status for $merTransferId ({$payout['status']})");
    echo "success"; exit;
}

/* Verify signature */
$acct = watchpay_get_account_by_mch($conn, $merNo);
if (!$acct) {
    $aid = intval($payout['account_id']);
    $r2 = mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE id = $aid LIMIT 1");
    if ($r2 && mysqli_num_rows($r2)) $acct = mysqli_fetch_assoc($r2);
}
if (!$acct) { http_response_code(400); echo "unknown merchant"; exit; }

if (!watchpay_verify_signature($data, $acct['payout_key'])) {
    watchpay_log("Payout callback SIGN FAIL $merTransferId: " . json_encode($data));
    http_response_code(400); echo "signature fail"; exit;
}

$withdrawId = intval($payout['withdraw_id']);
$userId = intval($payout['user_id']);
$amount = floatval($payout['amount']);

if ($tradeResult === '1') {
    /* Payout success: mark payout + withdraw completed */
    $stmt = mysqli_prepare($conn, "UPDATE `payout_orders` SET `status`='success', `trade_no`=?, `resp_code`=?, `api_response`=?, `updated_at`=NOW() WHERE `id`=?");
    $raw = json_encode($data);
    $respCodeVal = $data['respCode'] ?? '';
    $payoutIdVal = intval($payout['id']);
    mysqli_stmt_bind_param($stmt, 'sssi', $tradeNo, $respCodeVal, $raw, $payoutIdVal);
    mysqli_stmt_execute($stmt);

    mysqli_query($conn, "UPDATE `withdraw_requests` SET `sthiti`='1', `tike`='Completed', `remarks`=CONCAT(remarks,' [WatchPay auto-paid $tradeNo]') WHERE `shonu`='$withdrawId' AND `sthiti`='0'");

    $title = "Withdrawal Paid";
    $today = date('Y-m-d H:i:s');
    $stmt3 = mysqli_prepare($conn, "INSERT INTO `user_notifications` (`state`, `title`, `user_id`, `created_at`) VALUES (0, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt3, 'sis', $title, $userId, $today);
    mysqli_stmt_execute($stmt3);

    watchpay_log("Payout callback SUCCESS withdraw=$withdrawId amount=$amount tradeNo=$tradeNo");
    echo "success";
    exit;
} else {
    /* Payout failed (2=fail, 3=rejected): mark + refund wallet */
    $stmt = mysqli_prepare($conn, "UPDATE `payout_orders` SET `status`='fail', `trade_no`=?, `resp_code`=?, `error_msg`=?, `api_response`=?, `updated_at`=NOW() WHERE `id`=?");
    $raw = json_encode($data);
    $err = 'Gateway reported failure (tradeResult=' . $tradeResult . ')';
    $respCodeVal = $data['respCode'] ?? '';
    $payoutIdVal = intval($payout['id']);
    mysqli_stmt_bind_param($stmt, 'ssssi', $tradeNo, $respCodeVal, $err, $raw, $payoutIdVal);
    mysqli_stmt_execute($stmt);

    mysqli_query($conn, "UPDATE `withdraw_requests` SET `sthiti`='2', `tike`='Rejected', `remarks`=CONCAT(remarks,' [WatchPay payout failed - refunded]') WHERE `shonu`='$withdrawId' AND `sthiti`='0'");

    /* Refund wallet */
    $wq = mysqli_query($conn, "SELECT motta FROM `user_wallets` WHERE `balakedara` = '$userId'");
    if (mysqli_num_rows($wq) > 0) {
        $stmt2 = mysqli_prepare($conn, "UPDATE `user_wallets` SET `motta` = ROUND(motta + ?, 2) WHERE `balakedara` = ?");
        mysqli_stmt_bind_param($stmt2, 'di', $amount, $userId);
        mysqli_stmt_execute($stmt2);
        watchpay_log("Payout callback FAIL -> refunded $amount to user $userId (withdraw=$withdrawId)");
    }
    echo "success";
    exit;
}
