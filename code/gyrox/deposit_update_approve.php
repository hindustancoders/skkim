<?php 
// Database connection info 
$dbDetails = array( 
    'host' => '127.0.0.1', 
    'user' => 'bhar42501_SQL', 
    'pass' => 'BharatG7_Kx9mQ2vL', 
    'db'   => 'bhar42501_SQL' 
); 

// DB table to use 
$table = <<<EOT
    (		 
    SELECT 
    shonu, 
    balakedara, 
    duravani, 
    ullekha, 
    motta, 
    dharavahi, 
    dinankavannuracisi 
    FROM `deposits` 
    WHERE `sthiti` = '1'
    ) temp
EOT;

// Database connection
$conn = new mysqli($dbDetails['host'], $dbDetails['user'], $dbDetails['pass'], $dbDetails['db']);

// Check for connection errors
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

// Insert Recharge Arrival Notification **ONLY for Approved Recharges**
if (isset($_POST['id']) && isset($_POST['type']) && $_POST['type'] == 'approve') {
    $id = $_POST['id'];
    $today = date('Y-m-d H:i:s');

    // Fetch user ID from the table
    $result = $conn->query("SELECT balakedara FROM deposits WHERE shonu = '$id' AND sthiti = '1'");
    if ($result && $row = $result->fetch_assoc()) {
        $userId = $row['balakedara'];

        // Insert notification
        $title = "Recharge Arrival";
        $insertNotificationQuery = "INSERT INTO user_notifications (state, title, user_id, created_at) 
                                    VALUES (0, '$title', '$userId', '$today')";

        if ($conn->query($insertNotificationQuery) === TRUE) {
            error_log("Notification inserted successfully for user ID: $userId"); // Log success
        } else {
            error_log("Error inserting notification: " . $conn->error); // Log error
        }
    } else {
        error_log("User ID not found for recharge ID: $id"); // Log if user ID is missing
    }
}

// Table's primary key 
$primaryKey = 'shonu'; 

// Array of database columns which should be read and sent back to DataTables. 
$columns = array( 
    array( 'db' => 'shonu', 'dt' => 0 ),
    array( 'db' => 'balakedara', 'dt' => 1 ),  
    array( 'db' => 'duravani', 'dt' => 2 ), 
    array( 'db' => 'ullekha', 'dt' => 3 ), 
    array( 'db' => 'motta', 'dt' => 4 ), 
    array( 'db' => 'dharavahi', 'dt' => 5 ), 
    array( 'db' => 'dinankavannuracisi', 'dt' => 6 )
); 

// Include SQL query processing class 
require 'ssp_without_quote_table_deposit.php'; 

// Output data as JSON format 
echo json_encode( 
    SSP::simple( $_GET, $dbDetails, $table, $primaryKey, $columns ) 
);

// Close database connection
$conn->close();
?>
