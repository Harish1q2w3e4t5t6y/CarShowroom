<?php
include 'db_connection.php'; // Include your database connection file

// Check if vehicle ID is passed in the URL
if (isset($_GET['edit_vehicle_id'])) {
    $vehicle_id = $_GET['edit_vehicle_id'];

    // Fetch the vehicle details from the database
    $stmt = $conn->prepare("SELECT * FROM vehicles WHERE vehicle_id = ?");
    $stmt->bind_param("i", $vehicle_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $vehicle = $result->fetch_assoc();

    // If vehicle not found
    if (!$vehicle) {
        echo "Vehicle not found!";
        exit;
    }
} else {
    echo "No vehicle ID provided!";
    exit;
}

// Handle form submission (update request)
if (isset($_POST['update_vehicle'])) {
    // Get updated vehicle details from the form
    $brand = $_POST['vehicle_brandname'];
    $model = $_POST['vehicle_modelname'];
    $price = $_POST['vehicle_price'];
    $year = $_POST['vehicle_year'];
    $description = $_POST['vehicle_description'];

    // Handle image upload (if new image is provided)
    $image_name = NULL;
    $image_path = NULL;
    if ($_FILES['vehicle_image']['name']) {
        $image_name = $_FILES['vehicle_image']['name'];
        $image_tmp_name = $_FILES['vehicle_image']['tmp_name'];
        $upload_dir = "images/"; // Image upload directory
        $image_path = $upload_dir . basename($image_name);

        // Check and create the upload directory if it doesn't exist
        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        if (move_uploaded_file($image_tmp_name, $image_path)) {
            // Image uploaded successfully
        } else {
            echo "Failed to upload image.";
        }
    }

    // Update vehicle data in the vehicles table
    $stmt_vehicle = $conn->prepare("UPDATE vehicles 
                                    SET vehicle_brandname=?, vehicle_modelname=?, vehicle_price=?, vehicle_year=?, vehicle_description=? 
                                    WHERE vehicle_id=?");

    // Bind parameters for vehicle update
    $stmt_vehicle->bind_param("ssdssi", $brand, $model, $price, $year, $description, $vehicle_id);

    // Execute the vehicle update query
    if ($stmt_vehicle->execute()) {
        echo "Vehicle updated successfully!";
    } else {
        echo "Error updating vehicle data: " . $stmt_vehicle->error;
    }

    // Update the image if a new one is uploaded
    if ($image_name && $image_path) {
        // Update the images table with the new image
        $stmt_image = $conn->prepare("UPDATE images SET image_name=?, image_path=? WHERE vehicle_id=?");
        $stmt_image->bind_param("ssi", $image_name, $image_path, $vehicle_id);

        if ($stmt_image->execute()) {
            echo "Image updated successfully!";
        } else {
            echo "Error updating image data: " . $stmt_image->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vehicle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 60%;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        textarea,
        input[type="file"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="file"] {
            padding: 5px;
        }

        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            margin: 15px 0;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            font-weight: bold;
            border-radius: 5px;
        }

        .message.error {
            background-color: #f44336;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Update Vehicle Details</h1>

        <?php if (isset($vehicle)): ?>
            <!-- Form to update vehicle details -->
            <form action="update_vehicle.php?edit_vehicle_id=<?= $vehicle['vehicle_id'] ?>" method="post" enctype="multipart/form-data">
                
                <label for="vehicle_brandname">Brand:</label>
                <input type="text" name="vehicle_brandname" value="<?= $vehicle['vehicle_brandname'] ?>" required>

                <label for="vehicle_modelname">Model:</label>
                <input type="text" name="vehicle_modelname" value="<?= $vehicle['vehicle_modelname'] ?>" required>

                <label for="vehicle_price">Price:</label>
                <input type="number" name="vehicle_price" value="<?= $vehicle['vehicle_price'] ?>" required>

                <label for="vehicle_year">Year:</label>
                <input type="number" name="vehicle_year" value="<?= $vehicle['vehicle_year'] ?>" required>

                <label for="vehicle_description">Description:</label>
                <textarea name="vehicle_description" required><?= $vehicle['vehicle_description'] ?></textarea>

                <label for="vehicle_image">Image:</label>
                <input type="file" name="vehicle_image">

                <button type="submit" name="update_vehicle">Update Vehicle</button>
            </form>
        <?php endif; ?>
    </div>

</body>
</html>
