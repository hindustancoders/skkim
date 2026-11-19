<?php
define('DB_SERVER', '127.0.0.1');
define('DB_USERNAME', 'bhar42501_SQL');
define('DB_PASSWORD', 'BharatG7_Kx9mQ2vL');
define('DB_NAME', 'bhar42501_SQL');

function getDBConnection() {
    $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    return $conn;
}
?>
