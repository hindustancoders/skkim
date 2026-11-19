<?php
/**
 * QwackPay Pay-in Return Page (return_url)
 * User lands here after completing payment at the gateway.
 * Shows a friendly status page and redirects into the app.
 */
require_once(__DIR__ . "/qwackpay_lib.php");

if (file_exists(__DIR__ . "/../serive/samparka.php")) {
    include_once(__DIR__ . "/../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../conn.php")) {
    include_once(__DIR__ . "/../conn.php");
}
if (!isset($conn) || !$conn) { header("Location: /#/wallet/RechargeHistory"); exit; }

$orderNo = trim($_GET['order_id'] ?? ($_GET['merchant_order_id'] ?? ''));
$deposit = null;
if ($orderNo !== '') {
    $stmt = mysqli_prepare($conn, "SELECT dharavahi, motta, sthiti FROM `deposits` WHERE `dharavahi` = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $orderNo);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    if ($res && mysqli_num_rows($res)) $deposit = mysqli_fetch_assoc($res);
}

/* If still pending, poll the gateway once (order/query) */
$paid = false;
if ($deposit) {
    if (intval($deposit['sthiti']) === 1) {
        $paid = true;
    } else {
        $acct = qwackpay_get_account($conn, null);
        if ($acct) {
            $q = qwackpay_query_order($acct, $deposit['dharavahi']);
            if ($q && is_array($q['data'] ?? null)) {
                $st = strtolower((string)($q['data']['status'] ?? ''));
                if ($st === 'success' && intval($deposit['sthiti']) !== 1) {
                    /* gateway says paid but webhook not yet processed: credit now (idempotent guard) */
                    $uid = null;
                    $stmt = mysqli_prepare($conn, "SELECT balakedara, motta FROM deposits WHERE dharavahi = ? AND sthiti = 0 LIMIT 1");
                    mysqli_stmt_bind_param($stmt, 's', $deposit['dharavahi']);
                    mysqli_stmt_execute($stmt);
                    $r = mysqli_stmt_get_result($stmt);
                    $row = mysqli_fetch_assoc($r);
                    if ($row) {
                        $uid = intval($row['balakedara']);
                        $amt = floatval($row['motta']);
                        mysqli_query($conn, "UPDATE deposits SET sthiti = 1, ekikrtapavati = 'QwackPay' WHERE dharavahi = '" . mysqli_real_escape_string($conn, $deposit['dharavahi']) . "' AND sthiti = 0");
                        mysqli_query($conn, "UPDATE user_wallets SET motta = ROUND(motta + $amt, 2) WHERE balakedara = '$uid'");
                        $t = date('Y-m-d H:i:s');
                        mysqli_query($conn, "INSERT INTO user_notifications (`state`,`title`,`user_id`,`created_at`) VALUES (0, 'Recharge Arrival', $uid, '$t')");
                        qwackpay_log("Return-page recovery credit order={$deposit['dharavahi']} user=$uid amount=$amt");
                    }
                    $paid = true;
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Payment Status</title>
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
            border-radius: 50%;
            font-size: 32px;
            margin: 0 auto 20px;
        }
        .ok  { background: #f0fff4; color: #28a745; }
        .pnd { background: #fff8e6; color: #f0a300; }
        h2 { font-size: 20px; margin-bottom: 12px; color: #1a1a1a; }
        p { font-size: 14px; color: #666; line-height: 1.6; margin-bottom: 24px; }
        .btn {
            display: inline-block;
            width: 100%;
            padding: 14px 20px;
            background: linear-gradient(135deg, #ff9933 0%, #138808 100%);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="card">
        <?php if ($paid): ?>
            <div class="icon ok">&#10004;</div>
            <h2>Payment Successful</h2>
            <p>Your recharge has been credited to your wallet.<br>Order: <?php echo htmlspecialchars($deposit['dharavahi']); ?> (&#8377;<?php echo htmlspecialchars($deposit['motta']); ?>)</p>
            <a href="/#/wallet/RechargeHistory" class="btn">View Recharge History</a>
        <?php else: ?>
            <div class="icon pnd">&#8987;</div>
            <h2>Payment Processing</h2>
            <p>Your payment is being verified. If the amount is debited, it will be credited to your wallet shortly.<br><?php echo $deposit ? ('Order: ' . htmlspecialchars($deposit['dharavahi'])) : ''; ?></p>
            <a href="/#/wallet/RechargeHistory" class="btn">Back to Wallet</a>
        <?php endif; ?>
    </div>
</body>
</html>
