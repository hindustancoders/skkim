<?php
/**
 * QwackPay Gateway Library (qwackpay.com)
 * Docs: https://6ue86z5lbf.apifox.cn (password 4RoZQsGi)
 *
 * Signature algorithm (official docs):
 *  1. Params must include merchant_id; exclude `sign` and empty/null values
 *  2. Sort by key ASCII ascending (ksort)
 *  3. Build "k=v&k=v&..." query string (urlencoded then urldecoded)
 *  4. Append "&key=" + merchant API key
 *  5. MD5 -> UPPERCASE signature
 *
 * All requests: Content-Type application/json + header X-API-Key: {api key}
 * Endpoints (derived from base_url, default https://qwackpay.com/api/v1):
 *  - Payin:    POST {base}/order/create  -> data.payment_url
 *  - Pay query:POST {base}/order/query
 *  - Balance:  POST {base}/balance
 *  - Payout:   POST {base}/payout/create (IP whitelist required)
 *  - Callback: gateway POSTs notify_url; server MUST reply plain text "success"
 *
 * Multi-account: qwackpay_accounts table (admin-configurable key + URLs).
 */

if (defined('QWACKPAY_LIB_LOADED')) return;
define('QWACKPAY_LIB_LOADED', true);

date_default_timezone_set('Asia/Kolkata');

/* ---------------------------------------------------------------
 * Account loading (multi-account support)
 * --------------------------------------------------------------- */

function qwackpay_get_account($conn, $id = null) {
    if ($id !== null && $id > 0) {
        $stmt = mysqli_prepare($conn, "SELECT * FROM qwackpay_accounts WHERE id = ? LIMIT 1");
        mysqli_stmt_bind_param($stmt, 'i', $id);
        mysqli_stmt_execute($stmt);
        $res = mysqli_stmt_get_result($stmt);
        $acct = mysqli_fetch_assoc($res);
        if ($acct) return $acct;
    }
    $res = mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE status = 1 AND is_default = 1 LIMIT 1");
    if ($res && mysqli_num_rows($res) > 0) return mysqli_fetch_assoc($res);
    $res = mysqli_query($conn, "SELECT * FROM qwackpay_accounts WHERE status = 1 ORDER BY id ASC LIMIT 1");
    if ($res && mysqli_num_rows($res) > 0) return mysqli_fetch_assoc($res);
    return null;
}

/** Find account by merchant id (callback verification fallback). */
function qwackpay_get_account_by_mch($conn, $mchId) {
    $stmt = mysqli_prepare($conn, "SELECT * FROM qwackpay_accounts WHERE merchant_id = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $mchId);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    return mysqli_fetch_assoc($res);
}

/** Find account by X-API-Key header (callback identification). */
function qwackpay_get_account_by_key($conn, $apiKey) {
    if ($apiKey === '') return null;
    $stmt = mysqli_prepare($conn, "SELECT * FROM qwackpay_accounts WHERE api_key = ? LIMIT 1");
    mysqli_stmt_bind_param($stmt, 's', $apiKey);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    return mysqli_fetch_assoc($res);
}

/** Derive endpoint URL from account base url. */
function qwackpay_endpoint($acct, $path) {
    $base = rtrim($acct['base_url'], '/');
    return $base . '/' . ltrim($path, '/');
}

/* ---------------------------------------------------------------
 * Signature helpers (MD5 uppercase, official spec)
 * --------------------------------------------------------------- */

function qwackpay_make_signature($params, $apiKey) {
    unset($params['sign']);
    $filtered = array();
    foreach ($params as $k => $v) {
        if ($v === null || $v === '') continue;
        $filtered[$k] = $v;
    }
    ksort($filtered, SORT_STRING);
    $signStr = urldecode(http_build_query($filtered));
    $signStr .= '&key=' . $apiKey;
    qwackpay_log('SIGN', $signStr);
    return strtoupper(md5($signStr));
}

function qwackpay_verify_signature($data, $apiKey) {
    if (empty($data['sign'])) return false;
    $expected = qwackpay_make_signature($data, $apiKey);
    return strtoupper($expected) === strtoupper($data['sign']);
}

/* ---------------------------------------------------------------
 * HTTP helper (JSON POST + X-API-Key header)
 * --------------------------------------------------------------- */

function qwackpay_http_post($url, $apiKey, $params) {
    $ch = curl_init($url);
    curl_setopt_array($ch, array(
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'X-API-Key: ' . $apiKey,
        ),
        CURLOPT_POSTFIELDS => json_encode($params, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE),
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
 * Create payin order. Returns:
 * ok(bool), paymentUrl, qwackOrderId, merchantOrderId, fee, msg, raw
 */
function qwackpay_create_payin($acct, $orderNo, $amount, $notifyUrl, $returnUrl, $customerName = '', $customerPhone = '', $customerEmail = '') {
    $params = array(
        'merchant_id'     => $acct['merchant_id'],
        'amount'          => round((float)$amount, 2),
        'order_id'        => $orderNo,
        'customer_phone'  => $customerPhone !== '' ? $customerPhone : '9876543210',
        'customer_email'  => $customerEmail !== '' ? $customerEmail : 'pay@' . ($_SERVER['HTTP_HOST'] ?? 'localhost'),
        'notify_url'      => $notifyUrl,
        'return_url'      => $returnUrl,
    );
    if ($customerName !== '') $params['customer_name'] = $customerName;

    $params['sign'] = qwackpay_make_signature($params, $acct['api_key']);

    $resp = qwackpay_http_post(qwackpay_endpoint($acct, '/order/create'), $acct['api_key'], $params);
    qwackpay_log('PAYIN RESPONSE ' . $orderNo, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data)) {
        return array('ok' => false, 'msg' => 'Invalid gateway response' . ($resp['error'] ? ': ' . $resp['error'] : ''), 'raw' => $resp['body']);
    }
    $code = intval($data['code'] ?? 0);
    if ($code !== 200) {
        return array('ok' => false, 'msg' => $data['message'] ?? 'Gateway refused order', 'raw' => $data);
    }
    $payUrl = $data['data']['payment_url'] ?? '';
    if ($payUrl === '') {
        return array('ok' => false, 'msg' => 'Gateway did not return payment_url', 'raw' => $data);
    }
    return array(
        'ok' => true,
        'paymentUrl' => $payUrl,
        'qwackOrderId' => $data['data']['qwack_order_id'] ?? '',
        'merchantOrderId' => $data['data']['merchant_order_id'] ?? $orderNo,
        'fee' => $data['data']['fee'] ?? 0,
        'msg' => $data['message'] ?? 'success',
        'raw' => $data,
    );
}

/**
 * Query payin order status. Returns parsed array or null on failure.
 */
function qwackpay_query_order($acct, $orderNo) {
    $params = array(
        'merchant_id' => $acct['merchant_id'],
        'order_id'    => $orderNo,
    );
    $params['sign'] = qwackpay_make_signature($params, $acct['api_key']);

    $resp = qwackpay_http_post(qwackpay_endpoint($acct, '/order/query'), $acct['api_key'], $params);
    qwackpay_log('ORDER QUERY ' . $orderNo, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data) || intval($data['code'] ?? 0) !== 200) return null;
    return $data;
}

/**
 * Query merchant balance. Returns ok(bool) + amount fields.
 */
function qwackpay_query_balance($acct) {
    $params = array('merchant_id' => $acct['merchant_id']);
    $params['sign'] = qwackpay_make_signature($params, $acct['api_key']);

    $resp = qwackpay_http_post(qwackpay_endpoint($acct, '/balance'), $acct['api_key'], $params);
    qwackpay_log('BALANCE QUERY ' . $acct['merchant_id'], $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data) || intval($data['code'] ?? 0) !== 200) {
        return array('ok' => false, 'msg' => $data['message'] ?? ($resp['error'] ?: 'Balance query failed'), 'raw' => $resp['body']);
    }
    $d = is_array($data['data'] ?? null) ? $data['data'] : $data;
    return array('ok' => true,
        'amount' => $d['amount'] ?? ($d['balance'] ?? 0),
        'availableAmount' => $d['available_amount'] ?? ($d['availableAmount'] ?? ($d['balance'] ?? 0)),
        'frozenAmount' => $d['frozen_amount'] ?? ($d['frozenAmount'] ?? 0),
        'raw' => $data);
}

/**
 * Create payout order. Returns ok(bool), qwackOrderId, status, fee, msg, raw
 */
function qwackpay_create_payout($acct, $orderNo, $amount, $accountNo, $ifsc, $userName, $phone, $email, $notifyUrl = '') {
    $params = array(
        'merchant_id' => $acct['merchant_id'],
        'amount'      => round((float)$amount, 2),
        'order_id'    => $orderNo,
        'account_no'  => $accountNo,
        'ifsc'        => $ifsc,
        'user_name'   => $userName,
        'phone'       => $phone,
        'email'       => $email,
    );
    if ($notifyUrl !== '') $params['notify_url'] = $notifyUrl;

    $params['sign'] = qwackpay_make_signature($params, $acct['api_key']);

    $resp = qwackpay_http_post(qwackpay_endpoint($acct, '/payout/create'), $acct['api_key'], $params);
    qwackpay_log('PAYOUT RESPONSE ' . $orderNo, $resp);

    $data = json_decode($resp['body'], true);
    if (!is_array($data)) {
        return array('ok' => false, 'msg' => 'Invalid gateway response' . ($resp['error'] ? ': ' . $resp['error'] : ''), 'raw' => $resp['body']);
    }
    if (intval($data['code'] ?? 0) !== 200) {
        return array('ok' => false, 'msg' => $data['message'] ?? 'Gateway refused payout', 'raw' => $data);
    }
    $status = $data['data']['status'] ?? 'processing';
    return array(
        'ok' => true,
        'qwackOrderId' => $data['data']['qwack_order_id'] ?? '',
        'merchantOrderId' => $data['data']['merchant_order_id'] ?? $orderNo,
        'amount' => $data['data']['amount'] ?? $amount,
        'fee' => $data['data']['fee'] ?? 0,
        'status' => $status,
        'raw' => $data,
    );
}

/* ---------------------------------------------------------------
 * Site URL + logging
 * --------------------------------------------------------------- */

function qwackpay_get_base_url() {
    if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO'])) $proto = $_SERVER['HTTP_X_FORWARDED_PROTO'];
    elseif (isset($_SERVER['HTTPS']) && ($_SERVER['HTTPS'] === 'on' || $_SERVER['HTTPS'] === 1)) $proto = 'https';
    else $proto = 'http';
    $host = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : parse_url((getenv('SITE_URL') ?: 'http://127.0.0.1:3000'), PHP_URL_HOST);
    return $proto . '://' . $host;
}

function qwackpay_log($message, $data = null) {
    $logFile = __DIR__ . '/qwackpay.log';
    $ts = date('Y-m-d H:i:s');
    $content = "[$ts] $message";
    if ($data !== null) {
        $content .= "\n" . (is_array($data) || is_object($data)
            ? json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE)
            : $data);
    }
    @file_put_contents($logFile, $content . "\n----------------------------------------\n", FILE_APPEND);
}

if (!function_exists('admin_audit_log')) {
    function admin_audit_log($conn, $adminUser, $action, $details = '') {
        $stmt = mysqli_prepare($conn, "INSERT INTO admin_audit_log (admin_user, action, details, ip) VALUES (?, ?, ?, ?)");
        if (!$stmt) return;
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? ($_SERVER['REMOTE_ADDR'] ?? '');
        mysqli_stmt_bind_param($stmt, 'ssss', $adminUser, $action, $details, $ip);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
}
