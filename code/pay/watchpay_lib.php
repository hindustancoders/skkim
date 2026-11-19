<?php
/**
 * WatchPay Gateway Library (api.watchglb.com)
 * Official docs: https://www.showdoc.com.cn/WatchPay (password: watchpay277)
 *
 * Signature algorithm (from official docs):
 *  1. Take all params that need signing (all non-empty, except sign & sign_type)
 *  2. Sort by key ASCII ascending (ksort)
 *  3. Build "k=v&k=v&..." query string
 *  4. Append "&key=" + merchant key
 *  5. MD5 -> lowercase signature
 *  6. Empty params do NOT participate in signature and must NOT be submitted
 *
 * Endpoints:
 *  - Payin  (order):       https://api.watchglb.com/pay/web
 *  - Payout (transfer):    https://api.watchglb.com/pay/transfer
 *  - Payout query:         https://api.watchglb.com/query/transfer
 *  - Balance query:        https://api.watchglb.com/query/balance
 */

if (defined('WATCHPAY_LIB_LOADED')) return;
define('WATCHPAY_LIB_LOADED', true);

date_default_timezone_set('Asia/Kolkata');

/* ---------------------------------------------------------------
 * Account loading (multi-account support)
 * --------------------------------------------------------------- */

/**
 * Fetch one WatchPay account from DB.
 * @param int|null $id  account id; null => default active account
 * @param mysqli $conn
 * @return array|null
 */
function watchpay_get_account($conn, $id = null) {
    if ($id !== null && $id > 0) {
        $stmt = mysqli_prepare($conn, "SELECT * FROM watchpay_accounts WHERE id = ? LIMIT 1");
        mysqli_stmt_bind_param($stmt, 'i', $id);
        mysqli_stmt_execute($stmt);
        $res = mysqli_stmt_get_result($stmt);
        $acct = mysqli_fetch_assoc($res);
        if ($acct) return $acct;
    }
    /* default: flagged default + active, else any active */
    $res = mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE status = 1 AND is_default = 1 LIMIT 1");
    if ($res && mysqli_num_rows($res) > 0) return mysqli_fetch_assoc($res);
    $res = mysqli_query($conn, "SELECT * FROM watchpay_accounts WHERE status = 1 ORDER BY id ASC LIMIT 1");
    if ($res && mysqli_num_rows($res) > 0) return mysqli_fetch_assoc($res);
    return null;
}

/**
 * Find account by merchant id (needed for callback verification).
 */
function watchpay_get_account_by_mch($conn, $mchId) {
    $stmt = mysqli_prepare($conn, "SELECT * FROM watchpay_accounts WHERE mch_id = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $mchId);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    return mysqli_fetch_assoc($res);
}

/* ---------------------------------------------------------------
 * Signature helpers
 * --------------------------------------------------------------- */

/**
 * Generate MD5 signature per WatchPay official spec.
 * $params: all relevant params (sign/sign_type must NOT be included).
 */
function watchpay_make_signature($params, $key) {
    $filtered = array();
    foreach ($params as $k => $v) {
        if ($v !== null && $v !== '') $filtered[$k] = $v;
    }
    ksort($filtered, SORT_STRING);
    $parts = array();
    foreach ($filtered as $k => $v) $parts[] = $k . '=' . $v;
    $signStr = implode('&', $parts) . '&key=' . $key;
    watchpay_log('SIGN', $signStr);
    return md5($signStr);
}

/**
 * Verify a signature received from WatchPay.
 * Callback params: all non-empty except sign & signType participate.
 */
function watchpay_verify_signature($data, $key) {
    if (empty($data['sign'])) return false;
    $params = array();
    foreach ($data as $k => $v) {
        if ($k === 'sign' || $k === 'signType' || $k === 'sign_type') continue;
        if ($v === null || $v === '') continue;
        $params[$k] = $v;
    }
    $expected = watchpay_make_signature($params, $key);
    return strtolower($expected) === strtolower($data['sign']);
}

/* ---------------------------------------------------------------
 * HTTP helper (form-urlencoded POST per docs)
 * --------------------------------------------------------------- */

function watchpay_http_post($url, $postData) {
    $ch = curl_init($url);
    curl_setopt_array($ch, array(
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => array('Content-Type: application/x-www-form-urlencoded'),
        CURLOPT_POSTFIELDS => http_build_query($postData),
        CURLOPT_SSL_VERIFYPEER => true,
        CURLOPT_SSL_VERIFYHOST => 2,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_CONNECTTIMEOUT => 15,
    ));
    $response = curl_exec($ch);
    $err = curl_error($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return array('body' => $response, 'error' => $err, 'http_code' => $code);
}

/* ---------------------------------------------------------------
 * API operations
 * --------------------------------------------------------------- */

/**
 * Create payin order. Returns array with keys:
 * ok(bool), payInfo, orderNo, msg, raw
 */
function watchpay_create_payin($acct, $orderNo, $amount, $notifyUrl, $pageUrl, $goodsName = 'Recharge', $mchReturnMsg = '') {
    $params = array(
        'mch_id'        => $acct['mch_id'],
        'notify_url'    => $notifyUrl,
        'mch_order_no'  => $orderNo,
        'pay_type'      => (string)$acct['pay_type'],
        'trade_amount'  => number_format((float)$amount, 2, '.', ''),
        'order_date'    => date('Y-m-d H:i:s'),
        'goods_name'    => $goodsName,
        'version'       => '1.0',   // forces JSON response with payInfo
    );
    if (!empty($pageUrl))   $params['page_url'] = $pageUrl;
    if (!empty($mchReturnMsg)) $params['mch_return_msg'] = $mchReturnMsg;

    $params['sign_type'] = 'MD5';
    $params['sign'] = watchpay_make_signature($params, $acct['payin_key']);

    $resp = watchpay_http_post($acct['payin_url'], $params);
    watchpay_log('PAYIN RESPONSE ' . $orderNo, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data)) {
        return array('ok' => false, 'msg' => 'Invalid gateway response' . ($resp['error'] ? ': ' . $resp['error'] : ''), 'raw' => $resp['body']);
    }
    if (strtoupper($data['respCode'] ?? '') !== 'SUCCESS') {
        return array('ok' => false, 'msg' => $data['tradeMsg'] ?? ($data['errorMsg'] ?? 'Gateway refused order'), 'raw' => $data);
    }
    /* verify synchronous response signature (camelCase keys per docs) */
    if (!watchpay_verify_signature($data, $acct['payin_key'])) {
        return array('ok' => false, 'msg' => 'Gateway response signature verification failed', 'raw' => $data);
    }
    return array('ok' => ($data['tradeResult'] ?? '') === '1', 'payInfo' => $data['payInfo'] ?? '', 'orderNo' => $data['orderNo'] ?? '', 'msg' => $data['tradeMsg'] ?? '', 'raw' => $data);
}

/**
 * Create payout (代付). $extra carries country specific fields (remark etc.)
 */
function watchpay_create_payout($acct, $mchTransferId, $amount, $receiveName, $receiveAccount, $bankCode, $backUrl, $extra = array()) {
    $params = array(
        'mch_id'           => $acct['mch_id'],
        'mch_transferId'   => $mchTransferId,
        'transfer_amount'  => (string)intval(round((float)$amount)),
        'apply_date'       => date('Y-m-d H:i:s'),
        'bank_code'        => $bankCode !== '' ? $bankCode : $acct['bank_code_payout'],
        'receive_name'     => $receiveName,
        'receive_account'  => $receiveAccount,
    );
    foreach ($extra as $k => $v) { if ($v !== null && $v !== '') $params[$k] = $v; }
    if (!empty($backUrl)) $params['back_url'] = $backUrl;

    $params['sign_type'] = 'MD5';
    $params['sign'] = watchpay_make_signature($params, $acct['payout_key']);

    $resp = watchpay_http_post($acct['payout_url'], $params);
    watchpay_log('PAYOUT RESPONSE ' . $mchTransferId, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data)) {
        return array('ok' => false, 'msg' => 'Invalid gateway response' . ($resp['error'] ? ': ' . $resp['error'] : ''), 'raw' => $resp['body']);
    }
    if (strtoupper($data['respCode'] ?? '') !== 'SUCCESS') {
        return array('ok' => false, 'msg' => $data['errorMsg'] ?? 'Gateway refused payout', 'raw' => $data);
    }
    if (!watchpay_verify_signature($data, $acct['payout_key'])) {
        return array('ok' => false, 'msg' => 'Gateway response signature verification failed', 'raw' => $data);
    }
    /* respCode SUCCESS only means order accepted; tradeResult: 0 applied 1 success 2 fail 3 rejected 4 processing */
    return array('ok' => true, 'tradeNo' => $data['tradeNo'] ?? '', 'tradeResult' => (string)($data['tradeResult'] ?? ''), 'raw' => $data);
}

/**
 * Query payout status. Returns parsed array or null.
 */
function watchpay_query_transfer($acct, $mchTransferId) {
    $params = array(
        'mch_id'         => $acct['mch_id'],
        'mch_transferId' => $mchTransferId,
    );
    $params['sign_type'] = 'MD5';
    $params['sign'] = watchpay_make_signature($params, $acct['payout_key']);

    $resp = watchpay_http_post($acct['payout_query_url'], $params);
    watchpay_log('PAYOUT QUERY ' . $mchTransferId, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data) || strtoupper($data['respCode'] ?? '') !== 'SUCCESS') return null;
    if (!watchpay_verify_signature($data, $acct['payout_key'])) return null;
    return $data;
}

/**
 * Query merchant balance. Returns array|null.
 */
function watchpay_query_balance($acct) {
    $params = array('mch_id' => $acct['mch_id']);
    $params['sign_type'] = 'MD5';
    $params['sign'] = watchpay_make_signature($params, $acct['payout_key']);

    $resp = watchpay_http_post($acct['balance_query_url'], $params);
    watchpay_log('BALANCE QUERY ' . $acct['mch_id'], $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data) || strtoupper($data['respCode'] ?? '') !== 'SUCCESS') {
        return array('ok' => false, 'msg' => $data['errorMsg'] ?? ($resp['error'] ?: 'Balance query failed'), 'raw' => $resp['body']);
    }
    if (!watchpay_verify_signature($data, $acct['payout_key'])) {
        return array('ok' => false, 'msg' => 'Balance response signature verification failed', 'raw' => $data);
    }
    return array('ok' => true,
        'amount' => $data['amount'] ?? 0,
        'frozenAmount' => $data['frozenAmount'] ?? 0,
        'availableAmount' => $data['availableAmount'] ?? 0,
        'raw' => $data);
}

/* ---------------------------------------------------------------
 * Site URL + logging
 * --------------------------------------------------------------- */

function watchpay_get_base_url() {
    if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO'])) $proto = $_SERVER['HTTP_X_FORWARDED_PROTO'];
    elseif (isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] === 'on' || $_SERVER['HTTPS'] === 1)) $proto = 'https';
    else $proto = 'http';
    $host = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : parse_url((getenv('SITE_URL') ?: 'http://127.0.0.1:3000'), PHP_URL_HOST);
    return $proto . '://' . $host;
}

function watchpay_log($message, $data = null) {
    $logFile = __DIR__ . '/watchpays.log';
    $ts = date('Y-m-d H:i:s');
    $content = "[$ts] $message";
    if ($data !== null) {
        $content .= "\n" . (is_array($data) || is_object($data)
            ? json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE)
            : $data);
    }
    @file_put_contents($logFile, $content . "\n----------------------------------------\n", FILE_APPEND);
}

/**
 * Audit log helper for admin actions.
 */
function admin_audit_log($conn, $adminUser, $action, $details = '') {
    $stmt = mysqli_prepare($conn, "INSERT INTO admin_audit_log (admin_user, action, details, ip) VALUES (?, ?, ?, ?)");
    if (!$stmt) return;
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? ($_SERVER['REMOTE_ADDR'] ?? '');
    mysqli_stmt_bind_param($stmt, 'ssss', $adminUser, $action, $details, $ip);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
}
