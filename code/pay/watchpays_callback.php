<?php
/**
 * WatchPay Pay-in Async Callback (交易异步通知)
 * Official docs: https://www.showdoc.com.cn/WatchPay
 *
 * Gateway POSTs FORM data to notify_url after payment success:
 *   tradeResult, mchId, mchOrderNo, oriAmount, amount, orderDate,
 *   orderNo, merRetMsg, signType, sign
 * We must reply "success" (plain text) after processing.
 *
 * GET request = user browser return -> redirect to recharge history.
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

/* =========================================
 * 1. GET = browser return (page_url)
 * ========================================= */
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    watchpay_log("Payin browser return (GET)", $_GET);
    header("Location: /#/wallet/RechargeHistory");
    exit;
}

/* =========================================
 * 2. POST = server webhook
 * ========================================= */
watchpay_log("Payin webhook received (POST)", $_POST);

$data = $_POST;
if (empty($data)) {
    $raw = file_get_contents("php://input");
    $json = json_decode($raw, true);
    if (is_array($json) && !empty($json)) $data = $json;
    else { watchpay_log("Callback Error: empty payload", $raw); http_response_code(400); echo "invalid payload"; exit; }
}

$merchantOrder = trim($data['mchOrderNo'] ?? '');
$mchId         = trim($data['mchId'] ?? '');
$tradeResult   = trim($data['tradeResult'] ?? '');
$amount        = floatval($data['amount'] ?? 0);
$orderNo       = trim($data['orderNo'] ?? '');

if ($merchantOrder === '') {
    watchpay_log("Callback Error: mchOrderNo missing");
    http_response_code(400); echo "missing mchOrderNo"; exit;
}

/* ---- Find our order ---- */
$stmt = mysqli_prepare($conn, "SELECT * FROM `deposits` WHERE `dharavahi` = ? LIMIT 1");
mysqli_stmt_bind_param($stmt, 's', $merchantOrder);
mysqli_stmt_execute($stmt);
$orderRes = mysqli_stmt_get_result($stmt);
if (!$orderRes || mysqli_num_rows($orderRes) == 0) {
    watchpay_log("Callback Error: order not found: $merchantOrder");
    http_response_code(404); echo "order not found"; exit;
}
$order = mysqli_fetch_assoc($orderRes);
$userId = intval($order['balakedara']);
$dbAmount = floatval($order['motta']);
$currentStatus = intval($order['sthiti']);

/* ---- Verify signature with the correct account's payin key ---- */
$acct = null;
if ($mchId !== '') $acct = watchpay_get_account_by_mch($conn, $mchId);
if (!$acct && !empty($order['pay_acct_id'])) {
    $aid = intval($order['pay_acct_id']);
    $res = mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE id = $aid LIMIT 1");
    if ($res && mysqli_num_rows($res)) $acct = mysqli_fetch_assoc($res);
}
if (!$acct) {
    watchpay_log("Callback Error: no account for mchId=$mchId order=$merchantOrder");
    http_response_code(400); echo "unknown merchant"; exit;
}

if (!watchpay_verify_signature($data, $acct['payin_key'])) {
    watchpay_log("Callback SIGN FAIL order=$merchantOrder (acct {$acct['id']}) data=" . json_encode($data));
    http_response_code(400); echo "signature fail"; exit;
}
watchpay_log("Callback sign OK order=$merchantOrder");

/* ---- Amount check: compare with actual paid amount ---- */
if ($amount > 0 && abs($dbAmount - $amount) > 0.01) {
    watchpay_log("Callback amount mismatch order=$merchantOrder DB=$dbAmount paid=$amount (using paid amount)");
}

if ($tradeResult === '1') {
    if ($currentStatus === 1) {
        watchpay_log("Callback duplicate ignored order=$merchantOrder");
        echo "success"; exit;
    }

    /* 1. mark success */
    $stmt = mysqli_prepare($conn, "UPDATE `deposits` SET `sthiti` = '1', `ullekha` = ? WHERE `dharavahi` = ?");
    mysqli_stmt_bind_param($stmt, 'ss', $orderNo, $merchantOrder);
    if (!mysqli_stmt_execute($stmt)) {
        watchpay_log("Callback DB error (order update) $merchantOrder: " . mysqli_stmt_error($stmt));
        http_response_code(500); echo "database error"; exit;
    }

    /* 2. credit wallet (actual paid amount) */
    $creditAmount = $amount > 0 ? $amount : $dbAmount;
    $wq = mysqli_query($conn, "SELECT motta FROM `user_wallets` WHERE `balakedara` = '$userId'");
    if (mysqli_num_rows($wq) > 0) {
        $stmt2 = mysqli_prepare($conn, "UPDATE `user_wallets` SET `motta` = ROUND(motta + ?, 2) WHERE `balakedara` = ?");
        mysqli_stmt_bind_param($stmt2, 'di', $creditAmount, $userId);
        mysqli_stmt_execute($stmt2);
    } else {
        $stmt2 = mysqli_prepare($conn, "INSERT INTO `user_wallets` (`balakedara`, `motta`, `rebet`, `spin`, `bonus`) VALUES (?, ?, 0, 0, 0)");
        mysqli_stmt_bind_param($stmt2, 'id', $userId, $creditAmount);
        mysqli_stmt_execute($stmt2);
    }
    if (mysqli_error($conn)) watchpay_log("Callback wallet credit error user=$userId: " . mysqli_error($conn));

    /* 3. notification */
    $title = "Recharge Arrival";
    $today = date('Y-m-d H:i:s');
    $stmt3 = mysqli_prepare($conn, "INSERT INTO `user_notifications` (`state`, `title`, `user_id`, `created_at`) VALUES (0, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt3, 'sis', $title, $userId, $today);
    mysqli_stmt_execute($stmt3);

    watchpay_log("Callback SUCCESS credited $creditAmount to user $userId order=$merchantOrder gateway=$orderNo");
    echo "success";
    exit;
} else {
    watchpay_log("Callback non-success tradeResult=$tradeResult order=$merchantOrder");
    if ($currentStatus === 0) {
        $stmt = mysqli_prepare($conn, "UPDATE `deposits` SET `sthiti` = '2', `ullekha` = ? WHERE `dharavahi` = ? AND `sthiti` = 0");
        mysqli_stmt_bind_param($stmt, 'ss', $orderNo, $merchantOrder);
        mysqli_stmt_execute($stmt);
    }
    echo "success";
    exit;
}
