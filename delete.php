<?php
include 'db_connection.php'; // Include your database connection file

$message = ''; // Variable to store success/error messages

// Handle update request
if (isset($_POST['update_vehicle'])) {
    // Get vehicle details from the form
    $vehicle_id = $_POST['vehicle_id'];
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

    // Handle image upload (if new image is provided)
    if ($_FILES['vehicle_image']['name']) {
        $image_name = $_FILES['vehicle_image']['name'];
        $image_tmp_name = $_FILES['vehicle_image']['tmp_name'];
        $upload_dir = "image/"; // Image upload directory (changed to 'image/')
        $image_path = $upload_dir . basename($image_name);

        // Check and create the upload directory if it doesn't exist
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        if (move_uploaded_file($image_tmp_name, $image_path)) {
            // Update the image in the images table using prepared statement
            $stmt_image = $conn->prepare("UPDATE images SET image_name=?, image_path=? WHERE vehicle_id=?");
            $stmt_image->bind_param("ssi", $image_name, $image_path, $vehicle_id);
            $stmt_image->execute();
        } else {
            echo "Failed to upload image.";
        }
    }

    // Update vehicle data in the vehicles table
    $stmt_vehicle = $conn->prepare("UPDATE vehicles 
    SET vehicle_brandname=?, vehicle_modelname=?, vehicle_price=?, vehicle_year=?, 
        vehicle_enginetype=?, vehicle_enginecapacity=?, vehicle_fueltype=?, 
        vehicle_transmission=?, vehicle_seatingcapacity=?, vehicle_mileage=?, 
        vehicle_bodytype=?, vehicle_topspeed=?, vehicle_acceleration=?, 
        vehicle_torque=?, vehicle_drivetrain=?, vehicle_fuelcapacity=?, 
        vehicle_safetyrating=?, vehicle_warranty=?, vehicle_description=? 
    WHERE vehicle_id=?");

    $stmt_vehicle->bind_param(
    "ssdisdssdsdssssdsis", 
    $brand, $model, $price, $year, 
    $engine, $engine_capacity, $fuel, 
    $transmission, $seating, $mileage, 
    $body_type, $top_speed, $acceleration, 
    $torque, $drivetrain, $fuel_capacity, 
    $safety_rating, $warranty, $description, 
    $vehicle_id
    );

    if ($stmt_vehicle->execute()) {
        echo "Vehicle updated successfully!";
    } else {
        echo "Error updating vehicle data: " . $stmt_vehicle->error;
    }
}

// Handle delete request
if (isset($_GET['delete_vehicle_id'])) {
    $vehicle_id = $_GET['delete_vehicle_id'];

    // First, retrieve image path for deletion
    $stmt_get_image = $conn->prepare("SELECT image_path FROM images WHERE vehicle_id=?");
    $stmt_get_image->bind_param("i", $vehicle_id);
    $stmt_get_image->execute();
    $result = $stmt_get_image->get_result();
    $row = $result->fetch_assoc();
    $image_path = $row['image_path']; // This will be something like 'audi/a4.jpeg'

    // Delete image data from the images table
    $stmt_delete_image = $conn->prepare("DELETE FROM images WHERE vehicle_id=?");
    $stmt_delete_image->bind_param("i", $vehicle_id);
    $stmt_delete_image->execute();

    // Delete vehicle data from the vehicles table
    $stmt_delete_vehicle = $conn->prepare("DELETE FROM vehicles WHERE vehicle_id=?");
    $stmt_delete_vehicle->bind_param("i", $vehicle_id);
    if ($stmt_delete_vehicle->execute()) {
        $message = "Vehicle and associated image deleted successfully!";
    } else {
        $message = "Error deleting vehicle: " . $stmt_delete_vehicle->error;
    }
}

// Fetch all vehicle data along with image data
$sql_vehicles = "SELECT vehicles.*, images.image_path FROM vehicles 
                 LEFT JOIN images ON vehicles.vehicle_id = images.vehicle_id order by vehicles.vehicle_brandname";
$vehicles_result = $conn->query($sql_vehicles);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vehicles</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        img {
            width: 100px;
            height: 100px;
        }
        /* Style for the message box */
        .message-box {
            padding: 15px;
            background-color: #4CAF50;
            color: white;
            margin: 10px 0;
            border-radius: 5px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Manage Vehicles</h1>

    <?php if ($message): ?>
        <div class="message-box"><?= $message ?></div>
    <?php endif; ?>

    <!-- Display vehicles in table format -->
    <table>
        <thead>
            <tr>
                <th>Vehicle ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Price</th>
                <th>Year</th>
                <th>Engine</th>
                <th>Engine Capacity</th>
                <th>Fuel Type</th>
                <th>Transmission</th>
                <th>Seating Capacity</th>
                <th>Mileage</th>
                <th>Body Type</th>
                <th>Top Speed</th>
                <th>Acceleration</th>
                <th>Torque</th>
                <th>Drivetrain</th>
                 <!--<th>Fuel Capacity</th>
                <th>Safety Rating</th>
                <th>Warranty</th>-->
                <th>Description</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($vehicle = $vehicles_result->fetch_assoc()): ?>
                <tr>
                    <td><?= $vehicle['vehicle_id'] ?></td>
                    <td><?= $vehicle['vehicle_brandname'] ?></td>
                    <td><?= $vehicle['vehicle_modelname'] ?></td>
                    <td><?= $vehicle['vehicle_price'] ?></td>
                    <td><?= $vehicle['vehicle_year'] ?></td>
                    <td><?= $vehicle['vehicle_enginetype'] ?></td>
                    <td><?= $vehicle['vehicle_enginecapacity'] ?></td>
                    <td><?= $vehicle['vehicle_fueltype'] ?></td>
                    <td><?= $vehicle['vehicle_transmission'] ?></td>
                    <td><?= $vehicle['vehicle_seatingcapacity'] ?></td>
                    <td><?= $vehicle['vehicle_mileage'] ?></td>
                    <td><?= $vehicle['vehicle_bodytype'] ?></td>
                    <td><?= $vehicle['vehicle_topspeed'] ?></td>
                    <td><?= $vehicle['vehicle_acceleration'] ?></td>
                    <td><?= $vehicle['vehicle_torque'] ?></td>
                    <td><?= $vehicle['vehicle_drivetrain'] ?></td>
                    <!-- <td><?= $vehicle['vehicle_fuelcapacity'] ?></td>
                    <td><?= $vehicle['vehicle_safetyrating'] ?></td>
                    <td><?= $vehicle['vehicle_warranty'] ?></td> -->
                    <td><?= $vehicle['vehicle_description'] ?></td>
                    <td>
                        <?php if ($vehicle['image_path']): ?>
                            <img src="image/<?= $vehicle['image_path'] ?>" alt="Vehicle Image">
                        <?php else: ?>
                            No Image Available
                        <?php endif; ?>
                    </td>
                    <td>
                        <a href="update_vehicle.php?edit_vehicle_id=<?= $vehicle['vehicle_id'] ?>">Update</a> | 
                        <a href="?delete_vehicle_id=<?= $vehicle['vehicle_id'] ?>" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
</body>
</html>
