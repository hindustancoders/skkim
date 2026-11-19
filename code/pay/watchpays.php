<?php
/**
 * WatchPay Pay-in Order Creation (api.watchglb.com/pay/web)
 * Official docs: https://www.showdoc.com.cn/WatchPay
 *
 * Multi-account: /pay/watchpays?a={account_id}  (default account when omitted)
 * Flow: verify user signature -> insert pending deposit -> call gateway
 *       (version=1.0 JSON mode) -> verify response sign -> redirect to payInfo
 */

require_once(__DIR__ . "/watchpay_lib.php");

/* DB connection */
if (file_exists(__DIR__ . "/../serive/samparka.php")) {
    include_once(__DIR__ . "/../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../../serive/samparka.php")) {
    include_once(__DIR__ . "/../../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../conn.php")) {
    include_once(__DIR__ . "/../conn.php");
}

if (!isset($conn) || !$conn) { die("Database connection failed"); }

function render_error_page($errorMessage) {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>Payment Notification</title>
        <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            body {
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
                background: #f7f9fc;
                color: #333;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                padding: 20px;
            }
            .card {
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.08);
                max-width: 420px;
                width: 100%;
                padding: 32px 24px;
                text-align: center;
            }
            .icon {
                width: 64px;
                height: 64px;
                line-height: 64px;
                background: #fff0f0;
                color: #ff4d4f;
                border-radius: 50%;
                font-size: 32px;
                margin: 0 auto 20px;
            }
            h2 { font-size: 20px; margin-bottom: 12px; color: #1a1a1a; }
            p { font-size: 14px; color: #666; line-height: 1.6; margin-bottom: 24px; }
            .btn {
                display: inline-block;
                width: 100%;
                padding: 14px 20px;
                background: linear-gradient(135deg, #1890ff 0%, #096dd9 100%);
                color: #fff;
                border: none;
                border-radius: 8px;
                font-size: 15px;
                font-weight: 600;
                text-decoration: none;
                cursor: pointer;
                transition: opacity 0.2s;
            }
            .btn:hover { opacity: 0.9; }
        </style>
    </head>
    <body>
        <div class="card">
            <div class="icon">!</div>
            <h2>Unable to Process Payment</h2>
            <p><?php echo htmlspecialchars($errorMessage); ?></p>
            <a href="/#/wallet/Recharge" class="btn">Return to Recharge</a>
        </div>
    </body>
    </html>
    <?php
    exit;
}

$ramt = isset($_GET['amount']) ? floatval($_GET['amount']) : 0;
$uid = isset($_GET['uid']) ? intval($_GET['uid']) : 0;
$sign = isset($_GET['sign']) ? trim($_GET['sign']) : '';
$acctId = isset($_GET['a']) ? intval($_GET['a']) : 0;

/* ---- 1. Account selection (multi-account support) ---- */
$acct = watchpay_get_account($conn, $acctId);
if (!$acct || $acct['status'] != 1) {
    watchpay_log("Payin error: no active WatchPay account" . ($acctId ? " (id=$acctId)" : ""));
    render_error_page("Payment channel is currently unavailable. Please try another channel.");
}

/* ---- 2. Basic validation ---- */
if ($ramt <= 0) render_error_page("Please enter a valid amount greater than 0.");
if ($ramt < (float)$acct['min_payin'] || $ramt > (float)$acct['max_payin']) {
    render_error_page("Amount must be between " . $acct['min_payin'] . " and " . $acct['max_payin'] . " for this channel.");
}
if ($uid <= 0) render_error_page("Invalid user account. Please log in again.");

$amountFormatted = number_format($ramt, 2, '.', '');

/* ---- 3. Fetch and verify user ---- */
$stmt = mysqli_prepare($conn, "SELECT id, mobile, codechorkamukala, createdate, status FROM `users` WHERE `id` = ? LIMIT 1");
mysqli_stmt_bind_param($stmt, 'i', $uid);
mysqli_stmt_execute($stmt);
$userQuery = mysqli_stmt_get_result($stmt);
if (!$userQuery || mysqli_num_rows($userQuery) == 0) render_error_page("User account not found.");

$user = mysqli_fetch_assoc($userQuery);
if ($user['status'] != 1) render_error_page("Your account recharge option is currently suspended. Please contact customer support.");

/* ---- 4. Verify client signature (same mechanism as original app) ---- */
$userPhoto = '1';
$userName = '91' . $user['mobile'];
$nickName = $user['codechorkamukala'];
$knbdstr = '{"userId":' . $uid . ',"userPhoto":"' . $userPhoto . '","userName":' . $userName . ',"nickName":"' . $nickName . '","createdate":"' . $user['createdate'] . '"}';
$expectedSign = strtoupper(hash('sha256', $knbdstr));

if (!empty($sign) && $expectedSign !== $sign) {
    watchpay_log("Security signature mismatch for User: $uid. Expected: $expectedSign, Received: $sign");
    render_error_page("Security token verification failed. Please refresh the app and try again.");
}

/* ---- 5. Generate unique order number ---- */
$dateStr = date("YmdHis");
$merchant_order_no = "WP" . $dateStr . rand(1000, 9999);
$createdate = date("Y-m-d H:i:s");
$mobile = $user['mobile'];

/* ---- 6. Insert pending deposit ---- */
$stmt = mysqli_prepare($conn, "INSERT INTO `deposits`
    (`balakedara`, `motta`, `dharavahi`, `mula`, `payid`, `ullekha`, `duravani`, `ekikrtapavati`, `dinankavannuracisi`, `madari`, `pavatiaidi`, `sthiti`, `pay_acct_id`, `pay_type_code`)
    VALUES (?, ?, ?, 'WatchPay', 2, '', ?, 'WatchPay', ?, 1023, 2, 0, ?, ?)");
mysqli_stmt_bind_param($stmt, 'idsssis', $uid, $amountFormatted, $merchant_order_no, $mobile, $createdate, $acct['id'], $acct['pay_type']);
if (!mysqli_stmt_execute($stmt)) {
    watchpay_log("Database insert error for Order $merchant_order_no: " . mysqli_stmt_error($stmt));
    render_error_page("Failed to initialize transaction record in database. Please try again.");
}

/* ---- 7. Call WatchPay payin API ---- */
$callback_url = watchpay_get_base_url() . "/pay/watchpays_callback.php";
$page_url     = watchpay_get_base_url() . "/pay/watchpays_return.php";

watchpay_log("Payin request order=$merchant_order_no acct={$acct['id']} mch={$acct['mch_id']} amount=$amountFormatted");

$resp = watchpay_create_payin(
    $acct,
    $merchant_order_no,
    $amountFormatted,
    $callback_url,
    $page_url,
    'BharatGames Recharge',
    (string)$uid
);

if ($resp['ok'] && !empty($resp['payInfo'])) {
    $gatewayOrderNo = mysqli_real_escape_string($conn, $resp['orderNo'] ?? '');
    mysqli_query($conn, "UPDATE `deposits` SET `ullekha` = '$gatewayOrderNo' WHERE `dharavahi` = '$merchant_order_no'");
    watchpay_log("Payin success order=$merchant_order_no gatewayOrder=$gatewayOrderNo -> redirect payInfo");
    header("Location: " . $resp['payInfo']);
    exit;
} else {
    /* mark deposit failed */
    mysqli_query($conn, "UPDATE `deposits` SET `sthiti` = '2' WHERE `dharavahi` = '$merchant_order_no'");
    $msg = $resp['msg'] ?: 'Payment gateway error, please try again later.';
    watchpay_log("Payin FAILED order=$merchant_order_no: $msg");
    render_error_page($msg);
}
