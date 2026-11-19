<?php
/* Site notice bar (marquee) API - DB-driven (admin/manage_notices.php).
   Same JSON shape as the original hardcoded version.
   Only notices with status=1 are served; empty list = no message shown. */
if (file_exists(__DIR__ . "/../../conn.php")) {
    include __DIR__ . "/../../conn.php";
} else {
    $conn = null;
}
date_default_timezone_set("Asia/Kolkata");

header('Content-Type: application/json; charset=utf-8');
header('Strict-Transport-Security: max-age=31536000');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
header('Access-Control-Allow-Credentials: true');
$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '';
header('Access-Control-Allow-Origin: ' . $origin);
header('Vary: Origin');

$data = array();
if ($conn) {
    $res = mysqli_query($conn, "SELECT * FROM site_notices WHERE status = 1 ORDER BY sort_order ASC, id ASC");
    if ($res && mysqli_num_rows($res) > 0) {
        $i = 0;
        while ($p = mysqli_fetch_assoc($res)) {
            $data[$i]['title'] = $p['title'];
            $data[$i]['siteMessage'] = $p['content'];
            $data[$i]['sort'] = (int)$p['sort_order'];
            $data[$i]['addtime'] = $p['created_at'];
            $i++;
        }
    }
}

echo json_encode(array(
    'data' => $data,
    'code' => 0,
    'msg' => 'Succeed',
    'msgCode' => 0,
    'serviceNowTime' => date("Y-m-d H:i:s"),
));
