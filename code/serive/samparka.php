<?php
        $conn = mysqli_connect('127.0.0.1', 'bhar42501_SQL', 'BharatG7_Kx9mQ2vL', 'bhar42501_SQL');
        
        if (!$conn) {
                echo "Error: " . mysqli_connect_error();
                exit();
        }
        
        date_default_timezone_set("Asia/Kolkata"); 
?>