<?php
/**
 * Support Chat API (user side)
 * Actions:
 *   send   - send message (POST message=)
 *   history- get conversation (GET/POST)
 *   unread - unread count for user
 * Auth: JWT bearer (same as other webapi endpoints)
 */
include "../../conn.php";
include "../../functions2.php";

header('Content-Type: application/json; charset=utf-8');
header('Strict-Transport-Security: max-age=31536000');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
header('Access-Control-Allow-Credentials: true');
$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
header('Access-Control-Allow-Origin: ' . $origin);
header('Vary: Origin');

date_default_timezone_set("Asia/Kolkata");
$now = date("Y-m-d H:i:s");

function chat_out($arr) {
    echo json_encode($arr);
    exit;
}

/* ---- auth ---- */
$bearer = explode(" ", $_SERVER['HTTP_AUTHORIZATION'] ?? '');
$author = $bearer[1] ?? '';
$is_jwt_valid = is_jwt_valid($author);
$data_auth = json_decode($is_jwt_valid, 1);
if (($data_auth['status'] ?? '') !== 'Success') {
    chat_out(array('code' => 4, 'msg' => 'Not logged in', 'msgCode' => 2));
}
$uid = intval($data_auth['payload']['id'] ?? 0);
if ($uid <= 0) chat_out(array('code' => 4, 'msg' => 'Invalid user', 'msgCode' => 2));

$body = json_decode(file_get_contents("php://input"), true);
if (!is_array($body)) $body = $_POST + $_GET;
$action = $body['action'] ?? 'history';

/* ---- send ---- */
if ($action === 'send') {
    $message = trim($body['message'] ?? '');
    if ($message === '') chat_out(array('code' => 5, 'msg' => 'Empty message', 'msgCode' => 3));
    if (mb_strlen($message) > 2000) $message = mb_substr($message, 0, 2000);
    $stmt = mysqli_prepare($conn, "INSERT INTO support_chat_messages (user_id, sender, message) VALUES (?, 'user', ?)");
    mysqli_stmt_bind_param($stmt, 'is', $uid, $message);
    mysqli_stmt_execute($stmt);

    /* notify admin panel (unread badge) */
    $stmt2 = mysqli_prepare($conn, "INSERT INTO user_notifications (`state`, `title`, `user_id`, `created_at`) VALUES (0, ?, ?, ?)");
    $t = 'Support Chat';
    mysqli_stmt_bind_param($stmt2, 'sis', $t, $uid, $now);
    mysqli_stmt_execute($stmt2);

    chat_out(array('code' => 0, 'msg' => 'Succeed', 'msgCode' => 0, 'serviceNowTime' => $now));
}

/* ---- history ---- */
if ($action === 'history') {
    $limit = min(200, max(10, intval($body['limit'] ?? 100)));
    mysqli_query($conn, "UPDATE support_chat_messages SET read_by_user = 1 WHERE user_id = $uid AND sender = 'admin' AND read_by_user = 0");
    $stmt = mysqli_prepare($conn, "SELECT id, sender, message, is_deleted, created_at FROM support_chat_messages WHERE user_id = ? ORDER BY id DESC LIMIT ?");
    mysqli_stmt_bind_param($stmt, 'ii', $uid, $limit);
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
    chat_out(array('code' => 0, 'msg' => 'Succeed', 'msgCode' => 0, 'data' => $rows, 'serviceNowTime' => $now));
}

/* ---- unread ---- */
if ($action === 'unread') {
    $res = mysqli_query($conn, "SELECT COUNT(*) AS c FROM support_chat_messages WHERE user_id = $uid AND sender = 'admin' AND read_by_user = 0 AND is_deleted = 0");
    $c = intval(mysqli_fetch_assoc($res)['c'] ?? 0);
    chat_out(array('code' => 0, 'msg' => 'Succeed', 'msgCode' => 0, 'unread' => $c, 'serviceNowTime' => $now));
}

chat_out(array('code' => 11, 'msg' => 'Unknown action', 'msgCode' => 12));
