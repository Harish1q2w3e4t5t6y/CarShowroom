<?php
// Include your database connection
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $feedback = $_POST['feedback'];
    $customerName = $_POST['customerName'];

    // Save feedback to database
    if ($conn->connect_error) {
        echo json_encode(["status" => "error", "message" => "Database connection failed."]);
        exit;
    }

    // Prepare the SQL statement
    $stmt = $conn->prepare("INSERT INTO feedback (customer_name, feedback) VALUES (?, ?)");
    $stmt->bind_param("ss", $customerName, $feedback);

    // Execute and check success
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Feedback submitted successfully."]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to submit feedback."]);
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>
