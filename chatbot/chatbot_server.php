<?php
// chatbot_server.php

// Database configuration
$servername = "localhost"; // Typically 'localhost' with XAMPP
$username = "root"; // Default XAMPP username
$password = ""; // Default XAMPP password is an empty string
$dbname = "cs";

// Create a database connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the user query from the AJAX request
$user_query = isset($_POST['user_query']) ? trim(strtolower($_POST['user_query'])) : '';

// Prepare the SQL query to fetch the answer
$stmt = $conn->prepare("SELECT answer FROM chatbot_responses WHERE LOWER(question) = ?");
$stmt->bind_param("s", $user_query);
$stmt->execute();
$result = $stmt->get_result();

// Check if an answer is found in the database
if ($result->num_rows > 0) {
    // Fetch the answer
    $row = $result->fetch_assoc();
    echo $row['answer'];
} else {
    // Default response if no match found
    echo "I'm sorry, I don't have an answer to that question right now.";
}

// Close the connection
$stmt->close();
$conn->close();
?>
