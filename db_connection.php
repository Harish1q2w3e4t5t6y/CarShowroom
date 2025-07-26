<?php
// db_connection.php
$servername = "localhost";  // your database server, typically localhost
$username = "root";         // your database username
$password = "";             // your database password
$dbname = "cs";   // your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
