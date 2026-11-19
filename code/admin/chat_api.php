<?php
/**
 * Support Chat API (admin side, called from admin/chat.php)
 * Actions: users | history | send | delete | unreadcount
 * Auth: admin session (unohs)
 */
session_start();
if (empty($_SESSION['unohs'])) {
    header('Content-Type: application/json');
    echo json_encode(array('code' => 4, 'msg' => 'Unauthorized', 'msgCode' => 2));
    exit;
}
include("conn.php");
require_once(__DIR__ . "/../pay/watchpay_lib.php"); /* admin_audit_log */

header('Content-Type: application/json; charset=utf-8');
date_default_timezone_set("Asia/Kolkata");
$now = date("Y-m-d H:i:s");
$adminName = $_SESSION['nirvahaka_hesaru'] ?? 'admin';

function out($arr) { echo json_encode($arr); exit; }

$action = $_POST['action'] ?? $_GET['action'] ?? 'users';

/* ---- list conversations ---- */
if ($action === 'users') {
    $res = mysqli_query($conn, "SELECT u.id, u.mobile, MAX(m.created_at) AS last_time,
        SUM(CASE WHEN m.sender='user' AND m.read_by_admin=0 AND m.is_deleted=0 THEN 1 ELSE 0 END) AS unread
        FROM support_chat_messages m
        INNER JOIN users u ON u.id = m.user_id
        GROUP BY u.id, u.mobile
        ORDER BY last_time DESC
        LIMIT 200");
    $rows = array();
    while ($r = mysqli_fetch_assoc($res)) {
        $rows[] = array(
            'id' => (int)$r['id'],
            'mobile' => $r['mobile'],
            'lastTime' => $r['last_time'],
            'unread' => intval($r['unread']),
        );
    }
    out(array('code' => 0, 'data' => $rows, 'msg' => 'Succeed'));
}

/* ---- conversation ---- */
if ($action === 'history') {
    $uid = intval($_POST['user_id'] ?? 0);
    mysqli_query($conn, "UPDATE support_chat_messages SET read_by_admin = 1 WHERE user_id = $uid AND sender = 'user' AND read_by_admin = 0");
    $stmt = mysqli_prepare($conn, "SELECT id, sender, message, is_deleted, created_at FROM support_chat_messages WHERE user_id = ? ORDER BY id DESC LIMIT 300");
    mysqli_stmt_bind_param($stmt, 'i', $uid);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $rows = array();
    while ($r = mysqli_fetch_assoc($res)) {
        $rows[] = array(
            'id' => (int)$r['id'],
            'sender' => $r['sender'],
            'message' => intval($r['is_deleted']) === 1 ? '' : $r['message'],
            'deleted' => intval($r['is_deleted']),
            'createdAt' => $r['created_at'],
        );
    }
    $rows = array_reverse($rows);
    out(array('code' => 0, 'data' => $rows, 'msg' => 'Succeed'));
}

/* ---- admin sends ---- */
if ($action === 'send') {
    $uid = intval($_POST['user_id'] ?? 0);
    $message = trim($_POST['message'] ?? '');
    if ($uid <= 0 || $message === '') out(array('code' => 5, 'msg' => 'Missing params'));
    if (mb_strlen($message) > 2000) $message = mb_substr($message, 0, 2000);
    $stmt = mysqli_prepare($conn, "INSERT INTO support_chat_messages (user_id, sender, message) VALUES (?, 'admin', ?)");
    mysqli_stmt_bind_param($stmt, 'is', $uid, $message);
    mysqli_stmt_execute($stmt);
    out(array('code' => 0, 'msg' => 'Succeed'));
}

/* ---- admin deletes a message (soft delete) ---- */
if ($action === 'delete') {
    $msgId = intval($_POST['message_id'] ?? 0);
    $stmt = mysqli_prepare($conn, "UPDATE support_chat_messages SET is_deleted = 1 WHERE id = ?");
    mysqli_stmt_bind_param($stmt, 'i', $msgId);
    mysqli_stmt_execute($stmt);
    admin_audit_log($conn, $adminName, 'chat_message_delete', "message_id=$msgId");
    out(array('code' => 0, 'msg' => 'Deleted'));
}

/* ---- total unread (badge) ---- */
if ($action === 'unreadcount') {
    $res = mysqli_query($conn, "SELECT COUNT(*) AS c FROM support_chat_messages WHERE sender='user' AND read_by_admin=0 AND is_deleted=0");
    out(array('code' => 0, 'unread' => intval(mysqli_fetch_assoc($res)['c'] ?? 0)));
}

out(array('code' => 11, 'msg' => 'Unknown action'));
