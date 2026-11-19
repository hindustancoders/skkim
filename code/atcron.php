<?php
include("serive/samparka.php");

// Get the current timestamp
$currentDate = date('Y-m-d H:i:s');

// Fetch all users from agents
$query = mysqli_query($conn, "
    SELECT `userid`, `type`, `salary` 
    FROM `agents` 
    WHERE `status` = 1
");

while ($row = mysqli_fetch_assoc($query)) {
    $userid = $row['userid'];
    $type = $row['type'];
    $salary = $row['salary'];
    
    // Determine the start and end date based on type
    $startDate = '';
    $endDate = $currentDate;

    if ($type == 'day') {
        $startDate = date('Y-m-d 00:00:00');
    } elseif ($type == 'week') {
        $startDate = date('Y-m-d 00:00:00', strtotime('last Monday'));
    } elseif ($type == 'month') {
        $startDate = date('Y-m-01 00:00:00');
    }

    // Check if a record already exists for the current period
    $checkQuery = mysqli_query($conn, "
        SELECT * 
        FROM `agent_salary_records` 
        WHERE `userid` = '$userid' 
          AND `createdate` BETWEEN '$startDate' AND '$endDate'
    ");

    if (mysqli_num_rows($checkQuery) == 0) {
        // Insert record into agent_salary_records
        $insertQuery = mysqli_query($conn, "
            INSERT INTO `agent_salary_records` 
            (`userid`, `salary`, `status`, `createdate`) 
            VALUES 
            ('$userid', '$salary', 0, '$currentDate')
        ");

        if ($insertQuery) {
            echo "Inserted record for userid: $userid\n";
        } else {
            echo "Failed to insert record for userid: $userid. Error: " . mysqli_error($conn) . "\n";
        }
    }
}
?>

