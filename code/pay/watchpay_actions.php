<?php
/**
 * WatchPay shared action functions (no session / no exit - reusable library).
 * Used by pay/watchpay_admin_api.php (JSON endpoints) and admin pages.
 */

if (defined('WATCHPAY_ACTIONS_LOADED')) return;
define('WATCHPAY_ACTIONS_LOADED', true);

/**
 * Create a payout for a withdrawal request.
 * Returns array: ok(bool), status, tradeNo, payAmount, fee, msg, raw
 */
function watchpay_action_payout($conn, $withdrawId, $accountId, $ifsc = '') {
    $acct = watchpay_get_account($conn, $accountId);
    if (!$acct) return array('ok' => false, 'msg' => 'No active WatchPay account');

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

    /* payout amount = amount minus fee if configured */
    $fee = round($amount * (float)$acct['payout_fee_percent'] / 100, 2);
    $payAmount = round($amount - $fee, 2);

    $mchTransferId = $w['dharavahi'];
    $backUrl = watchpay_get_base_url() . '/pay/watchpays_payout_callback.php';

    /* India payouts require IFSC in remark (official docs) */
    $extra = array();
    if ($ifsc !== '') $extra['remark'] = $ifsc;

    $resp = watchpay_create_payout($acct, $mchTransferId, $payAmount, $bc['name'], $bc['account'], '', $backUrl, $extra);

    $status = 'applied';
    if (!$resp['ok']) $status = 'failed';
    elseif ((string)$resp['tradeResult'] === '1') $status = 'success';
    elseif ((string)$resp['tradeResult'] === '2') $status = 'fail';
    elseif ((string)$resp['tradeResult'] === '3') $status = 'rejected';
    elseif ((string)$resp['tradeResult'] === '4') $status = 'processing';

    $stmt = mysqli_prepare($conn, "INSERT INTO payout_orders (withdraw_id, account_id, user_id, amount, mch_transfer_id, trade_no, receive_name, receive_account, status, resp_code, error_msg, api_response)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $tradeNo = $resp['tradeNo'] ?? '';
    $rc = $resp['ok'] ? 'SUCCESS' : 'FAIL';
    $errMsg = $resp['msg'] ?? '';
    $rawJson = json_encode($resp['raw'] ?? array());
    $rname = $bc['name']; $racc = $bc['account'];
    mysqli_stmt_bind_param($stmt, 'iiiidsssssss', $withdrawId, $acct['id'], $uid, $payAmount, $mchTransferId, $tradeNo, $rname, $racc, $status, $rc, $errMsg, $rawJson);
    mysqli_stmt_execute($stmt);

    if (!$resp['ok']) {
        return array('ok' => false, 'msg' => $resp['msg'], 'raw' => $resp['raw'], 'status' => $status);
    }
    if ($status === 'success') {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [WatchPay paid {$resp['tradeNo']}]') WHERE shonu='$withdrawId'");
    } elseif (in_array($status, array('fail', 'rejected'))) {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [WatchPay payout failed - refunded]') WHERE shonu='$withdrawId'");
        mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
    } elseif ($status === 'applied' || $status === 'processing') {
        mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=3, tike='Processing' WHERE shonu='$withdrawId' AND sthiti='0'");
    }

    return array('ok' => true, 'status' => $status, 'tradeNo' => $tradeNo, 'payAmount' => $payAmount, 'fee' => $fee, 'raw' => $resp['raw']);
}

/**
 * Query one payout order at the gateway and sync local state.
 */
function watchpay_action_query($conn, $payoutId) {
    $res = mysqli_query($conn, "SELECT * FROM payout_orders WHERE id = " . intval($payoutId) . " LIMIT 1");
    $payout = mysqli_fetch_assoc($res);
    if (!$payout) return array('ok' => false, 'msg' => 'Payout order not found');
    $acct = watchpay_get_account($conn, intval($payout['account_id']));
    if (!$acct) return array('ok' => false, 'msg' => 'Account not found');

    $data = watchpay_query_transfer($acct, $payout['mch_transfer_id']);
    if (!$data) return array('ok' => false, 'msg' => 'Query failed or signature mismatch');

    $tradeResult = (string)($data['tradeResult'] ?? '');
    $statusMap = array('0' => 'applied', '1' => 'success', '2' => 'fail', '3' => 'rejected', '4' => 'processing');
    $status = $statusMap[$tradeResult] ?? 'processing';
    $raw = json_encode($data);
    $tradeNo = mysqli_real_escape_string($conn, $data['tradeNo'] ?? '');

    if (in_array($status, array('success', 'fail', 'rejected')) && !in_array($payout['status'], array('success', 'fail', 'rejected'))) {
        mysqli_query($conn, "UPDATE payout_orders SET status='$status', trade_no='$tradeNo', api_response='" . mysqli_real_escape_string($conn, $raw) . "', updated_at=NOW() WHERE id=" . $payout['id']);
        $wid = intval($payout['withdraw_id']);
        $uid = intval($payout['user_id']);
        $amount = floatval($payout['amount']);
        if ($status === 'success') {
            mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [WatchPay paid $tradeNo]') WHERE shonu='$wid' AND sthiti IN ('0','3')");
        } else {
            mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [WatchPay payout failed - refunded]') WHERE shonu='$wid' AND sthiti IN ('0','3')");
            mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
        }
    } else {
        mysqli_query($conn, "UPDATE payout_orders SET trade_no='$tradeNo', api_response='" . mysqli_real_escape_string($conn, $raw) . "', updated_at=NOW() WHERE id=" . $payout['id']);
    }
    return array('ok' => true, 'status' => $status, 'data' => $data);
}

/**
 * Sync ALL processing/applied payout orders (for cron).
 */
function watchpay_action_sync($conn) {
    $updated = 0; $checked = 0;
    $res = mysqli_query($conn, "SELECT * FROM payout_orders WHERE status IN ('applied','processing') ORDER BY id DESC LIMIT 50");
    while ($payout = mysqli_fetch_assoc($res)) {
        $acct = watchpay_get_account($conn, intval($payout['account_id']));
        if (!$acct) continue;
        $checked++;
        $data = watchpay_query_transfer($acct, $payout['mch_transfer_id']);
        if (!$data) continue;
        $tradeResult = (string)($data['tradeResult'] ?? '');
        $statusMap = array('0' => 'applied', '1' => 'success', '2' => 'fail', '3' => 'rejected', '4' => 'processing');
        $status = $statusMap[$tradeResult] ?? 'processing';
        $raw = mysqli_real_escape_string($conn, json_encode($data));
        $tradeNo = mysqli_real_escape_string($conn, $data['tradeNo'] ?? '');
        mysqli_query($conn, "UPDATE payout_orders SET status='$status', trade_no='$tradeNo', api_response='$raw', updated_at=NOW() WHERE id=" . $payout['id']);
        if (in_array($status, array('success', 'fail', 'rejected'))) {
            $updated++;
            $wid = intval($payout['withdraw_id']);
            $uid = intval($payout['user_id']);
            $amount = floatval($payout['amount']);
            if ($status === 'success') {
                mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=1, tike='Completed', remarks=CONCAT(remarks,' [WatchPay paid $tradeNo]') WHERE shonu='$wid' AND sthiti='3'");
            } else {
                mysqli_query($conn, "UPDATE withdraw_requests SET sthiti=2, tike='Rejected', remarks=CONCAT(remarks,' [WatchPay payout failed - refunded]') WHERE shonu='$wid' AND sthiti='3'");
                mysqli_query($conn, "UPDATE user_wallets SET motta=ROUND(motta + $amount, 2) WHERE balakedara='$uid'");
            }
        }
    }
    return array('ok' => true, 'checked' => $checked, 'updated' => $updated);
}
