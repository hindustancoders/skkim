<?php
require_once __DIR__ . '/../config.php';
// Database connection info
$dbDetails = array(
		'host' => DB_SERVER,
		'user' => DB_USERNAME,
		'pass' => DB_PASSWORD,
		'db'   => DB_NAME
	);

// Start session and get the current user
session_start();
$agent_user = $_SESSION['nirvahaka_hesaru'] ?? '';

// Establish database connection
$conn = mysqli_connect($dbDetails['host'], $dbDetails['user'], $dbDetails['pass'], $dbDetails['db']);
if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

// Get the current user's owncode
$sql2 = "SELECT owncode FROM users WHERE id = '$agent_user'";
$result = mysqli_query($conn, $sql2);
if (!$result) {
    die("Error fetching owncode: " . mysqli_error($conn));
}
$row = mysqli_fetch_assoc($result);
$current_owncode = $row['owncode'] ?? null;

// Debug: Check if owncode is fetched
if (empty($current_owncode)) {
    die("Owncode not found for the current user.");
}

// DB table query with filtering based on owncode and determining levels
$table = <<<EOT
(
    SELECT
        users.mobile,
        users.owncode,
        users.code,
        users.code1,
        users.code2,
        users.code3,
        users.code4,
        users.code5,
        users.id,
        users.createdate,
        users.status,
        users.pwd,
        user_wallets.motta,
        (SELECT SUM(motta) FROM deposits WHERE balakedara = users.id AND `status`='1') AS total_deposit,
        (SELECT motta FROM deposits WHERE balakedara = users.id AND `status`='1' ORDER BY motta ASC LIMIT 1) AS deposit_motta,
        (SELECT kod FROM user_withdraw_accounts WHERE byabaharkarta = users.id AND `sthiti`='1' ORDER BY shonu ASC LIMIT 1) AS ifsc,
        (SELECT khatesankhye FROM user_withdraw_accounts WHERE byabaharkarta = users.id AND `sthiti`='1' ORDER BY shonu ASC LIMIT 1) AS account,
        CASE
            WHEN users.code = '$current_owncode' THEN 'Level 1'
            WHEN users.code1 = '$current_owncode' THEN 'Level 2'
            WHEN users.code2 = '$current_owncode' THEN 'Level 3'
            WHEN users.code3 = '$current_owncode' THEN 'Level 4'
            WHEN users.code4 = '$current_owncode' THEN 'Level 5'
            WHEN users.code5 = '$current_owncode' THEN 'Level 6'
            ELSE 'No Level'
        END AS level
    FROM users
    JOIN user_wallets ON users.id = user_wallets.balakedara
) temp
EOT;

// Table's primary key
$primaryKey = 'id';

// Array of database columns to be read and sent back to DataTables
$columns = array(
    array('db' => 'mobile', 'dt' => 0),
    array('db' => 'owncode', 'dt' => 1),
    array('db' => 'code', 'dt' => 2),
    array('db' => 'id', 'dt' => 3),
    array(
        'db' => 'motta', 'dt' => 4,
        'formatter' => function ($d, $row) {
            $aid = $row['id'];
            $mobile = $row['mobile'];
            $motta = $row['motta'];
            return number_format($d, 2) . '&nbsp;<a href="javascript:void(0);" onClick="edit(' . $aid . ',' . $mobile . ',' . $motta . ')" class="text-aqua" title="Delete"><i class="fa fa-edit"></i></a>';
        }
    ),
    array(
        'db' => 'total_deposit', 'dt' => 5,
        'formatter' => function ($d, $row) {
            return ($d == null) ? '0.00' : number_format($d, 2);
        }
    ),
    array(
        'db' => 'deposit_motta', 'dt' => 6,
        'formatter' => function ($d, $row) {
            return ($d == null) ? '0.00' : number_format($d, 2);
        }
    ),
    array(
        'db' => 'createdate', 'dt' => 7,
        'formatter' => function ($d, $row) {
            return date('jS M Y', strtotime($d));
        }
    ),
    array(
        'db' => 'status', 'dt' => 8,
        'formatter' => function ($d, $row) {
            $id = $row['id'];
            return ($d == 1) ? 
                '<a href="javascript:void(0);" onClick="delete_row(' . $id . ')" class="update-person" style="color:#f56954; font-size:16px;" title="Delete"><i class="fa fa-trash"></i></a>
                &nbsp;
                <a href="javascript:void(0);" onClick="Respond(' . $id . ')" class="update-person" style="color:#090; font-size:16px;" data-toggle="tooltip" title="Publish"><i class="fa fa-check-square-o"></i></a>
                <a href="user-details.php?user=' . $id . '"  class="update-person" style="color:#0E0E44; font-size:16px;" data-toggle="tooltip" title="User Detail"><i class="fa fa-info"></i></a>' :
                '<a href="javascript:void(0);" onClick="delete_row(' . $id . ')" class="update-person" style="color:#f56954; font-size:16px;" title="Delete"><i class="fa fa-trash"></i></a>
                &nbsp;
                <a href="javascript:void(0);" onClick="UnRespond(' . $id . ')" class="update-person" style="color:#f00; font-size:16px;" data-toggle="tooltip" title="Unpublish"><i class="fa fa-square-o"></i></a>
                <a href="user-details.php?user=' . $id . '"  class="update-person" style="color:#0E0E44; font-size:16px;" data-toggle="tooltip" title="User Detail"><i class="fa fa-info"></i></a>';
        }
    ),
    array('db' => 'pwd', 'dt' => 9),
    array('db' => 'ifsc', 'dt' => 10),
    array('db' => 'account', 'dt' => 11),
    array('db' => 'level', 'dt' => 12) // Adding level as a column
);

// Include SQL query processing class
require 'ssp_without_quote_table.php';

// Output data as JSON format
echo json_encode(
    SSP::simple($_GET, $dbDetails, $table, $primaryKey, $columns)
);
