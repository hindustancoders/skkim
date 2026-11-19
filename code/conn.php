<?php
        // Global DB connection (used by files including ../conn.php from /gyrox and /gyrox/DKH)
        require_once __DIR__ . '/config.php';

        $conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
        if (!$conn) { echo 'Error: ' . mysqli_connect_error(); exit(); }
        mysqli_set_charset($conn, 'utf8mb4');
        date_default_timezone_set('Asia/Kolkata');
