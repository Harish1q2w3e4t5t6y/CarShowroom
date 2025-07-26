<?php
// getCustomerName.php
include 'db_connection.php'; // Adjust with your database connection file

if (isset($_POST['email'])) {
    $email = $_POST['email'];

    // Prepare the SQL query to prevent SQL injection
    $stmt = $conn->prepare("SELECT customer_name FROM customers WHERE customer_email = ?");
    $stmt->bind_param("s", $email);

    $stmt->execute();
    $stmt->bind_result($customerName);

    if ($stmt->fetch()) {
        echo json_encode(['status' => 'success', 'customerName' => $customerName]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Customer not found']);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['status' => 'error', 'message' => 'Email not provided']);
}



?>
