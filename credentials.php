<?php
include 'db_connection.php'; // Include your database connection file

$response = array();

if (isset($_POST['check_email']) && $_POST['check_email'] == 'true' && isset($_POST['email'])) {
    $email = trim($_POST['email']); // Sanitize email input

    // Check if email exists in the database
    $sql = "SELECT * FROM customers WHERE customer_email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Email exists
        $response['status'] = 'error';
        $response['message'] = 'Email already registered.';
    } else {
        // Email is available
        $response['status'] = 'success';
        $response['message'] = 'Email is available!';
    }

    echo json_encode($response);
    exit();
}

if (isset($_POST['login'])) {
    $email = trim($_POST['email']);  
    $password = $_POST['password'];

    $sql = "SELECT customer_password FROM customers WHERE customer_email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if ($user['customer_password'] === $password) {
            // Login successful
            echo json_encode(["status" => "success", "message" => "Login successful!"]);
        } else {
            // Password incorrect
            echo json_encode(["status" => "password_error", "message" => "Password is incorrect"]);
        }
    } else {
        // Email not found
        echo json_encode(["status" => "error", "message" => "Invalid email or password."]);
    }
    exit();
}



// Check if it's a signup request
if (isset($_POST['signup'])) {
    $username = trim($_POST['username']);  // Trim to avoid leading/trailing spaces
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    // Check if the email is already taken
    $sql = "SELECT * FROM customers WHERE customer_email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows == 0) {
        // Insert the new user into the database
        $sql = "INSERT INTO customers (customer_name, customer_email, customer_password) VALUES (?, ?, ?)";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sss", $username, $email, $password);

        if ($stmt->execute()) {
            // Send a success response for AJAX
            $response['status'] = 'success';
            $response['message'] = 'Sign up successful!';
        } else {
            // Send an error response for AJAX in case of failure
            $response['status'] = 'error';
            $response['message'] = 'Error occurred during signup.';
        }
    } else {
        // Send error response if the email is already taken
        $response['status'] = 'error';
        $response['message'] = 'Email is already registered.';
    }
    
    echo json_encode($response);
    exit();
}
?>
