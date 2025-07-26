<?php
// Include your database connection
include 'db_connection.php';

// Get the brand from the URL parameter
$brand = isset($_GET['brand']) ? $_GET['brand'] : '';

// Initialize an empty array for models
$models = [];

// Fetch car models based on the brand
if ($brand) {
    $sql = "SELECT vehicles.vehicle_modelname, vehicles.vehicle_price, vehicles.vehicle_year, images.image_path
            FROM vehicles
            LEFT JOIN images ON vehicles.vehicle_id = images.vehicle_id
            WHERE vehicles.vehicle_brandname = ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $brand);
    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        $models[] = $row;
    }
}

// Return the data as JSON
echo json_encode($models);

// Close the connection
$conn->close();
?>
