<?php
/**
 * QwackPay Pay-in Async Callback (webhook -> notify_url)
 * Docs: https://6ue86z5lbf.apifox.cn
 *
 * Gateway POSTs JSON:
 *   merchant_order_id, qwack_order_id, amount, status (success|failed), utr, sign
 * Header X-API-Key identifies the merchant account.
 * Server MUST verify sign and reply plain text: success
 *
 * GET request = user browser return -> redirect to recharge history.
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

/* =========================================
 * 1. GET = browser return (return_url)
 * ========================================= */
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    qwackpay_log("Payin browser return (GET)", $_GET);
    header("Location: /#/wallet/RechargeHistory");
    exit;
}

/* =========================================
 * 2. POST = server webhook
 * ========================================= */
$rawInput = file_get_contents("php://input");
qwackpay_log("Payin webhook received", array('headers' => array('x-api-key' => $_SERVER['HTTP_X_API_KEY'] ?? ''), 'body' => $rawInput));

$data = json_decode($rawInput, true);
if (!is_array($data) || empty($data)) {
    $data = $_POST;
}
if (!is_array($data) || empty($data)) {
    qwackpay_log("Callback Error: empty payload", $rawInput);
    http_response_code(400);
    echo "invalid payload";
    exit;
}

$merchantOrder = trim($data['merchant_order_id'] ?? '');
$qwackOrderId  = trim($data['qwack_order_id'] ?? '');
$status        = strtolower(trim($data['status'] ?? ''));
$amount        = floatval($data['amount'] ?? 0);
$utr           = trim($data['utr'] ?? '');

if ($merchantOrder === '') {
    qwackpay_log("Callback Error: merchant_order_id missing");
    http_response_code(400);
    echo "missing merchant_order_id";
    exit;
}

/* ---- Find our order ---- */
$stmt = mysqli_prepare($conn, "SELECT * FROM `deposits` WHERE `dharavahi` = ? LIMIT 1");
mysqli_stmt_bind_param($stmt, 's', $merchantOrder);
mysqli_stmt_execute($stmt);
$orderRes = mysqli_stmt_get_result($stmt);
if (!$orderRes || mysqli_num_rows($orderRes) == 0) {
    qwackpay_log("Callback Error: order not found: $merchantOrder");
    http_response_code(404);
    echo "order not found";
    exit;
}
$order = mysqli_fetch_assoc($orderRes);
$userId = intval($order['balakedara']);
$dbAmount = floatval($order['motta']);
$currentStatus = intval($order['sthiti']);

/* ---- Resolve account: X-API-Key header -> stored account -> merchant_id ---- */
$acct = qwackpay_get_account_by_key($conn, trim($_SERVER['HTTP_X_API_KEY'] ?? ''));
if (!$acct && !empty($order['pay_acct_id'])) {
    $aid = intval($order['pay_acct_id']);
    $res = mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE id = $aid LIMIT 1");
    if ($res && mysqli_num_rows($res)) $acct = mysqli_fetch_assoc($res);
}
if (!$acct && !empty($data['merchant_id'])) {
    $acct = qwackpay_get_account_by_mch($conn, $data['merchant_id']);
}
if (!$acct) {
    qwackpay_log("Callback Error: no account for order=$merchantOrder");
    http_response_code(400);
    echo "unknown merchant";
    exit;
}

/* ---- Verify signature (MD5 rules with account API key) ---- */
if (!qwackpay_verify_signature($data, $acct['api_key'])) {
    qwackpay_log("Callback SIGN FAIL order=$merchantOrder (acct {$acct['id']}) data=" . json_encode($data));
    http_response_code(400);
    echo "signature fail";
    exit;
}
qwackpay_log("Callback sign OK order=$merchantOrder");

/* ---- Amount check ---- */
if ($amount > 0 && abs($dbAmount - $amount) > 0.01) {
    qwackpay_log("Callback amount mismatch order=$merchantOrder DB=$dbAmount paid=$amount (using paid amount)");
}

if ($status === 'success') {
    /* Idempotency: already processed -> ACK */
    if ($currentStatus === 1) {
        qwackpay_log("Callback duplicate ignored order=$merchantOrder");
        echo "success";
        exit;
    }

    /* 1. mark success */
    $gatewayRef = $utr !== '' ? ($qwackOrderId . ($utr !== '' ? ' UTR:' . $utr : '')) : $qwackOrderId;
    $stmt = mysqli_prepare($conn, "UPDATE `deposits` SET `sthiti` = '1', `ekikrtapavati` = 'QwackPay', `ullekha` = ? WHERE `dharavahi` = ?");
    mysqli_stmt_bind_param($stmt, 'ss', $gatewayRef, $merchantOrder);
    if (!mysqli_stmt_execute($stmt)) {
        qwackpay_log("Callback DB error (order update) $merchantOrder: " . mysqli_stmt_error($stmt));
        http_response_code(500);
        echo "database error";
        exit;
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
    if (mysqli_error($conn)) qwackpay_log("Callback wallet credit error user=$userId: " . mysqli_error($conn));

    /* 3. notification */
    $title = "Recharge Arrival";
    $today = date('Y-m-d H:i:s');
    $stmt3 = mysqli_prepare($conn, "INSERT INTO `user_notifications` (`state`, `title`, `user_id`, `created_at`) VALUES (0, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt3, 'sis', $title, $userId, $today);
    mysqli_stmt_execute($stmt3);

    qwackpay_log("Callback SUCCESS credited $creditAmount to user $userId order=$merchantOrder qwackOrder=$qwackOrderId");
    echo "success";
    exit;
} else {
    /* failed / unknown status -> mark failed (idempotent) */
    qwackpay_log("Callback non-success status=$status order=$merchantOrder");
    if ($currentStatus === 0) {
        $stmt = mysqli_prepare($conn, "UPDATE `deposits` SET `sthiti` = '2', `ullekha` = ? WHERE `dharavahi` = ? AND `sthiti` = 0");
        mysqli_stmt_bind_param($stmt, 'ss', $qwackOrderId, $merchantOrder);
        mysqli_stmt_execute($stmt);
    }
    echo "success";
    exit;
}
