<?php
require_once __DIR__ . '/../config.php';
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
        
        if (!$conn) {
                echo "Error: " . mysqli_connect_error();
                exit();
        }
        
        date_default_timezone_set("Asia/Kolkata"); 
?>