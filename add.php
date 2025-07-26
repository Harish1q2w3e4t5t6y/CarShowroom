<?php
include 'db_connection.php'; // Include your database connection file

$success_message = ""; // Variable to hold success message
$error_message = ""; // Variable to hold error message

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get vehicle details from the form
    $brand = $_POST['vehicle_brandname'];
    $model = $_POST['vehicle_modelname'];
    $price = $_POST['vehicle_price'];
    $year = $_POST['vehicle_year'];
    $engine = $_POST['vehicle_enginetype'];
    $engine_capacity = $_POST['vehicle_enginecapacity'];
    $fuel = $_POST['vehicle_fueltype'];
    $transmission = $_POST['vehicle_transmission'];
    $seating = $_POST['vehicle_seatingcapacity'];
    $mileage = $_POST['vehicle_mileage'];
    $body_type = $_POST['vehicle_bodytype'];
    $top_speed = $_POST['vehicle_topspeed'];
    $acceleration = $_POST['vehicle_acceleration'];
    $torque = $_POST['vehicle_torque'];
    $drivetrain = $_POST['vehicle_drivetrain'];
    $fuel_capacity = $_POST['vehicle_fuelcapacity'];
    $safety_rating = $_POST['vehicle_safetyrating'];
    $warranty = $_POST['vehicle_warranty'];
    $description = $_POST['vehicle_description'];

    // Handle image upload
    $image_name = $_FILES['vehicle_image']['name'];
    $image_tmp_name = $_FILES['vehicle_image']['tmp_name'];
    $upload_dir = "";  // Directory where images will be uploaded
    $image_path = $upload_dir . basename($image_name);

    // Check and create the upload directory if it doesn't exist
    if (!is_dir($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    if (move_uploaded_file($image_tmp_name, $image_path)) {
        // Insert vehicle data into the vehicles table
        $sql_vehicle = "INSERT INTO vehicles (vehicle_brandname, vehicle_modelname, vehicle_price, vehicle_year, 
                        vehicle_enginetype, vehicle_enginecapacity, vehicle_fueltype, vehicle_transmission, 
                        vehicle_seatingcapacity, vehicle_mileage, vehicle_bodytype, vehicle_topspeed, 
                        vehicle_acceleration, vehicle_torque, vehicle_drivetrain, vehicle_fuelcapacity, 
                        vehicle_safetyrating, vehicle_warranty, vehicle_description)
                        VALUES ('$brand', '$model', '$price', '$year', '$engine', '$engine_capacity', '$fuel', 
                                '$transmission', '$seating', '$mileage', '$body_type', '$top_speed', 
                                '$acceleration', '$torque', '$drivetrain', '$fuel_capacity', '$safety_rating', 
                                '$warranty', '$description')";

        if ($conn->query($sql_vehicle) === TRUE) {
            $vehicle_id = $conn->insert_id; // Get the last inserted vehicle ID

            // Insert image data into the images table
            $sql_image = "INSERT INTO images (image_name, vehicle_id, image_path) 
                          VALUES ('$image_name', '$vehicle_id', '$image_path')";

            if ($conn->query($sql_image) === TRUE) {
                $success_message = "Vehicle and image added successfully!";
            } else {
                $error_message = "Error inserting image data: " . $conn->error;
            }
        } else {
            $error_message = "Error inserting vehicle data: " . $conn->error;
        }
    } else {
        $error_message = "Failed to upload image.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Vehicle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input, .form-container textarea, .form-container button {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .form-container input[type="file"] {
            padding: 3px;
        }

        .form-container button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        .message-box {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-weight: bold;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }

        .form-container input, .form-container textarea {
            font-size: 14px;
        }

        .form-container textarea {
            resize: vertical;
            height: 100px;
        }
    </style>
</head>
<body>
    <h1>Add Vehicle</h1>
    
    <div class="form-container">
        <!-- Success or Error Message -->
        <?php if ($success_message): ?>
            <div class="message-box success"><?= $success_message ?></div>
        <?php elseif ($error_message): ?>
            <div class="message-box error"><?= $error_message ?></div>
        <?php endif; ?>

        <!-- Vehicle Form -->
        <form method="POST" enctype="multipart/form-data">
            <input type="text" name="vehicle_brandname" placeholder="Brand Name" required>
            <input type="text" name="vehicle_modelname" placeholder="Model Name" required>
            <input type="number" step="0.01" name="vehicle_price" placeholder="Price" required>
            <input type="number" name="vehicle_year" placeholder="Year" required>
            <input type="text" name="vehicle_enginetype" placeholder="Engine Type" required>
            <input type="text" name="vehicle_enginecapacity" placeholder="Engine Capacity" required>
            <input type="text" name="vehicle_fueltype" placeholder="Fuel Type" required>
            <input type="text" name="vehicle_transmission" placeholder="Transmission" required>
            <input type="number" name="vehicle_seatingcapacity" placeholder="Seating Capacity" required>
            <input type="text" name="vehicle_mileage" placeholder="Mileage" required>
            <input type="text" name="vehicle_bodytype" placeholder="Body Type" required>
            <input type="number" name="vehicle_topspeed" placeholder="Top Speed" required>
            <input type="number" step="0.1" name="vehicle_acceleration" placeholder="Acceleration" required>
            <input type="text" name="vehicle_torque" placeholder="Torque" required>
            <input type="text" name="vehicle_drivetrain" placeholder="Drivetrain" required>
            <input type="number" step="0.1" name="vehicle_fuelcapacity" placeholder="Fuel Capacity" required>
            <input type="text" name="vehicle_safetyrating" placeholder="Safety Rating" required>
            <input type="text" name="vehicle_warranty" placeholder="Warranty" required>
            <textarea name="vehicle_description" placeholder="Description"></textarea>
            <input type="file" name="vehicle_image" required>
            <button type="submit">Add Vehicle</button>
        </form>
    </div>
</body>
</html>
