<?php
/**
 * WatchPay Admin AJAX API
 * Actions: balance | payout | query | sync
 * Session-protected (admin panel session unohs).
 */
session_start();
require_once(__DIR__ . "/watchpay_lib.php");
require_once(__DIR__ . "/watchpay_actions.php");

if (file_exists(__DIR__ . "/../serive/samparka.php")) {
    include_once(__DIR__ . "/../serive/samparka.php");
} elseif (file_exists(__DIR__ . "/../conn.php")) {
    include_once(__DIR__ . "/../conn.php");
}
if (!isset($conn) || !$conn) { header('Content-Type: application/json'); echo json_encode(array('ok' => false, 'msg' => 'DB error')); exit; }

header('Content-Type: application/json; charset=utf-8');

if (empty($_SESSION['unohs'])) {
    echo json_encode(array('ok' => false, 'msg' => 'Unauthorized'));
    exit;
}

$action = $_POST['action'] ?? $_GET['action'] ?? '';
$accountId = intval($_POST['account_id'] ?? $_GET['account_id'] ?? 0);
$adminName = $_SESSION['nirvahaka_hesaru'] ?? 'admin';

/* ---------- Balance check ---------- */
if ($action === 'balance') {
    $acct = watchpay_get_account($conn, $accountId);
    if (!$acct) { echo json_encode(array('ok' => false, 'msg' => 'Account not found')); exit; }
    $res = watchpay_query_balance($acct);
    admin_audit_log($conn, $adminName, 'watchpay_balance_check', "account={$acct['id']} mch={$acct['mch_id']} ok=" . ($res['ok'] ? 1 : 0));
    echo json_encode($res);
    exit;
}

/* ---------- Query single payout order ---------- */
if ($action === 'query') {
    $payoutId = intval($_POST['payout_id'] ?? 0);
    $res = watchpay_action_query($conn, $payoutId);
    admin_audit_log($conn, $adminName, 'watchpay_payout_query', "payout=$payoutId status=" . ($res['status'] ?? ($res['msg'] ?? '')));
    echo json_encode($res);
    exit;
}

/* ---------- Create payout for a withdrawal ---------- */
if ($action === 'payout') {
    $withdrawId = intval($_POST['withdraw_id'] ?? 0);
    $ifsc = trim($_POST['ifsc'] ?? '');
    $res = watchpay_action_payout($conn, $withdrawId, $accountId, $ifsc);
    admin_audit_log($conn, $adminName, 'watchpay_payout_create', "withdraw=$withdrawId acct=$accountId result=" . json_encode(array_slice($res, 0, 4)));
    echo json_encode($res);
    exit;
}

/* ---------- Sync all processing payouts ---------- */
if ($action === 'sync') {
    $res = watchpay_action_sync($conn);
    admin_audit_log($conn, $adminName, 'watchpay_payout_sync', json_encode($res));
    echo json_encode($res);
    exit;
}

echo json_encode(array('ok' => false, 'msg' => 'Unknown action'));
