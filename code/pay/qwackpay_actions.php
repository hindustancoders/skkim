<?php
/**
 * QwackPay shared action functions (no session / no exit - reusable library).
 * Used by pay/qwackpay_admin_api.php (JSON endpoints) and admin pages.
 */

if (defined('QWACKPAY_ACTIONS_LOADED')) return;
define('QWACKPAY_ACTIONS_LOADED', true);

/**
 * Create a payout for a withdrawal request.
 * Returns array: ok(bool), status, tradeNo, payAmount, fee, msg, raw
 */
function qwackpay_action_payout($conn, $withdrawId, $accountId, $ifsc = '') {
    $acct = qwackpay_get_account($conn, $accountId);
    if (!$acct) return array('ok' => false, 'msg' => 'No active QwackPay account');

    $res = mysqli_query($conn, "SELECT * FROM withdraw_requests WHERE shonu = " . intval($withdrawId) . " LIMIT 1");
    $w = mysqli_fetch_assoc($res);
    if (!$w) return array('ok' => false, 'msg' => 'Withdrawal not found');
    if ($w['sthiti'] != 0) return array('ok' => false, 'msg' => 'Withdrawal is not in Applied state');

    $uid = intval($w['balakedara']);
    $amount = floatval($w['motta']);
    if ($amount < (float)$acct['min_payout'] || $amount > (float)$acct['max_payout']) {
        return array('ok' => false, 'msg' => "Amount out of range for this account ({$acct['min_payout']} - {$acct['max_payout']})");
    }

    /* bank card info */
    $bankCardId = intval($w['khateshonu']);
    $bc = mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM user_bankcards WHERE id = " . $bankCardId . " LIMIT 1"));
    if (!$bc) return array('ok' => false, 'msg' => 'User bank card not found');
    if (trim($ifsc) === '') return array('ok' => false, 'msg' => 'IFSC code is required for QwackPay payout');

    /* payout amount = amount - percent fee - flat fee (QwackPay rate: 3% + 6) */
    $fee = round($amount * (float)$acct['payout_fee_percent'] / 100 + (float)$acct['payout_fee_flat'], 2);
    $payAmount = round($amount - $fee, 2);
    if ($payAmount < 1) return array('ok' => false, 'msg' => 'Payout amount after fees is too small');

    $mchTransferId = $w['dharavahi'];
    $notifyUrl = qwackpay_get_base_url() . '/pay/qwackpay_payout_callback.php';

    /* user contact details (docs require phone + email) */
    $uRes = mysqli_query($conn, "SELECT mobile, email FROM users WHERE id = $uid LIMIT 1");
    $u = mysqli_fetch_assoc($uRes);
    $phone = $u['mobile'] ?? '9876543210';
    $email = trim($u['email'] ?? '');
    if ($email === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) $email = $phone . '@qwack.local';

    $resp = qwackpay_create_payout($acct, $mchTransferId, $payAmount, $bc['account'], strtoupper(trim($ifsc)), $bc['name'], $phone, $email, $notifyUrl);

    $status = 'applied';
    if (!$resp['ok']) $status = 'failed';
    else {
        $st = strtolower((string)$resp['status']);
        if ($st === 'success') $status = 'success';
        elseif (in_array($st, array('failed', 'fail', 'rejected'))) $status = 'fail';
        elseif ($st === 'processing') $status = 'processing';
    }

    $stmt = mysqli_prepare($conn, "INSERT INTO payout_orders (withdraw_id, gateway, account_id, user_id, amount, mch_transfer_id, trade_no, receive_name, receive_account, bank_code, status, resp_code, error_msg, api_response)
        VALUES (?, 'qwackpay', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $tradeNo = $resp['qwackOrderId'] ?? '';
    $rc = $resp['ok'] ? 'SUCCESS' : 'FAIL';
    $errMsg = $resp['msg'] ?? '';
    $rawJson = json_encode($resp['raw'] ?? array());
    $rname = $bc['name']; $racc = $bc['account']; $bcode = strtoupper(trim($ifsc));
    mysqli_stmt_bind_param($stmt, 'iiiidssssssss', $withdrawId, $acct['id'], $uid, $payAmount, $mchTransferId, $tradeNo, $rname, $racc, $bcode, $status, $rc, $errMsg, $rawJson);
    mysqli_stmt_execute($stmt);

    if (!$resp['ok']) {
        return array('ok' => false, 'msg' => $resp['msg'], 'raw' => $resp['raw'], 'status' => $status);
    }
    if ($status === 'success') {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [QwackPay paid {$tradeNo}]') WHERE shonu='$withdrawId'");
    } elseif ($status === 'fail') {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [QwackPay payout failed - refunded]') WHERE shonu='$withdrawId'");
        mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
    } elseif (in_array($status, array('applied', 'processing'))) {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=3, tike='Processing' WHERE shonu='$withdrawId' AND sthiti='0'");
    }

    return array('ok' => true, 'status' => $status, 'tradeNo' => $tradeNo, 'payAmount' => $payAmount, 'fee' => $fee, 'raw' => $resp['raw']);
}

/**
 * Query one payout order at the gateway and sync local state.
 */
function qwackpay_action_query($conn, $payoutId) {
    $res = mysqli_query($conn, "SELECT * FROM payout_orders WHERE id = " . intval($payoutId) . " LIMIT 1");
    $payout = mysqli_fetch_assoc($res);
    if (!$payout) return array('ok' => false, 'msg' => 'Payout order not found');
    $acct = qwackpay_get_account($conn, intval($payout['account_id']));
    if (!$acct) return array('ok' => false, 'msg' => 'Account not found');

    $data = qwackpay_query_order($acct, $payout['mch_transfer_id']);
    if (!$data) return array('ok' => false, 'msg' => 'Query failed or signature mismatch');

    $d = is_array($data['data'] ?? null) ? $data['data'] : $data;
    $st = strtolower((string)($d['status'] ?? ''));
    $statusMap = array('success' => 'success', 'paid' => 'success', 'failed' => 'fail', 'fail' => 'fail', 'rejected' => 'rejected');
    $status = $statusMap[$st] ?? 'processing';
    $raw = json_encode($data);
    $tradeNo = mysqli_real_escape_string($conn, $d['qwack_order_id'] ?? '');

    if (in_array($status, array('success', 'fail', 'rejected')) && !in_array($payout['status'], array('success', 'fail', 'rejected'))) {
        mysqli_query($conn, "UPDATE payout_orders SET status='$status', trade_no='$tradeNo', api_response='" . mysqli_real_escape_string($conn, $raw) . "', updated_at=NOW() WHERE id=" . $payout['id']);
        $wid = intval($payout['withdraw_id']);
        $uid = intval($payout['user_id']);
        $amount = floatval($payout['amount']);
        if ($status === 'success') {
            mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [QwackPay paid $tradeNo]') WHERE shonu='$wid' AND sthiti IN ('0','3')");
        } else {
            mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [QwackPay payout failed - refunded]') WHERE shonu='$wid' AND sthiti IN ('0','3')");
            mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
        }
    } else {
        mysqli_query($conn, "UPDATE payout_orders SET trade_no='$tradeNo', api_response='" . mysqli_real_escape_string($conn, $raw) . "', updated_at=NOW() WHERE id=" . $payout['id']);
    }
    return array('ok' => true, 'status' => $status, 'data' => $data);
}

/**
 * Sync ALL processing/applied QwackPay payout orders (for cron).
 */
function qwackpay_action_sync($conn) {
    $updated = 0; $checked = 0;
    $res = mysqli_query($conn, "SELECT * FROM payout_orders WHERE gateway='qwackpay' AND status IN ('applied','processing') ORDER BY id DESC LIMIT 50");
    while ($payout = mysqli_fetch_assoc($res)) {
        $acct = qwackpay_get_account($conn, intval($payout['account_id']));
        if (!$acct) continue;
        $checked++;
        $data = qwackpay_query_order($acct, $payout['mch_transfer_id']);
        if (!$data) continue;
        $d = is_array($data['data'] ?? null) ? $data['data'] : $data;
        $st = strtolower((string)($d['status'] ?? ''));
        $statusMap = array('success' => 'success', 'paid' => 'success', 'failed' => 'fail', 'fail' => 'fail', 'rejected' => 'rejected');
        $status = $statusMap[$st] ?? 'processing';
        $raw = mysqli_real_escape_string($conn, json_encode($data));
        $tradeNo = mysqli_real_escape_string($conn, $d['qwack_order_id'] ?? '');
        mysqli_query($conn, "UPDATE payout_orders SET status='$status', trade_no='$tradeNo', api_response='$raw', updated_at=NOW() WHERE id=" . $payout['id']);
        if (in_array($status, array('success', 'fail', 'rejected'))) {
            $updated++;
            $wid = intval($payout['withdraw_id']);
            $uid = intval($payout['user_id']);
            $amount = floatval($payout['amount']);
            if ($status === 'success') {
                mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [QwackPay paid $tradeNo]') WHERE shonu='$wid' AND sthiti='3'");
            } else {
                mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [QwackPay payout failed - refunded]') WHERE shonu='$wid' AND sthiti='3'");
                mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
            }
        }
    }
    return array('ok' => true, 'checked' => $checked, 'updated' => $updated);
}
