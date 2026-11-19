<?php
        // Global DB connection (used by files including ../conn.php from /gyrox and /gyrox/DKH)
        define('DB_SERVER', '127.0.0.1');
        define('DB_USERNAME', 'bhar42501_SQL');
        define('DB_PASSWORD', 'BharatG7_Kx9mQ2vL');
        define('DB_NAME', 'bhar42501_SQL');

        $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
        if (!$conn) { echo 'Error: ' . mysqli_connect_error(); exit(); }
        mysqli_set_charset($conn, 'utf8mb4');
        date_default_timezone_set('Asia/Kolkata');
