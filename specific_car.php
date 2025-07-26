<?php
// Include your database connection
include 'db_connection.php';

// Get the vehicle model from the query string
$vehicle_model = isset($_GET['model']) ? $_GET['model'] : '';

// Fetch the car details from the database based on the vehicle model
$sql = "SELECT * FROM vehicles WHERE vehicle_modelname = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $vehicle_model);
$stmt->execute();
$result = $stmt->get_result();

// Check if the car is found
if ($result->num_rows > 0) {
    $car = $result->fetch_assoc();
    
    // Fetch the image path for the vehicle from the images table
    $image_sql = "SELECT image_path FROM images WHERE vehicle_id = ?";
    $image_stmt = $conn->prepare($image_sql);
    $image_stmt->bind_param("i", $car['vehicle_id']);
    $image_stmt->execute();
    $image_result = $image_stmt->get_result();
    
    // Check if an image is found
    if ($image_result->num_rows > 0) {
        $image = $image_result->fetch_assoc();
        $image_path = $image['image_path'];
    } else {
        $image_path = "default_image.jpg"; // Default image if none found
    }

    // Close the image query
    $image_stmt->close();
} else {
    echo "Car not found.";
    exit;
}

// Close the database connection
$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Specific Car Details</title>
    <style>
        /* Reset and basic styles */
        body {
            margin: 0;
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f3f3f3;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        #car-details {
            width: 260%;
            height: 280%;
            max-width: 1000px;
            max-height: 700px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            text-align: center;
            padding: 30px;
            transition: transform 0.3s ease-in-out;
        }

        #car-details img {
            max-width: 100%;
            height: auto;
            border-radius: 15px;
            margin-bottom: 20px;
        }

        h1 {
            margin: 20px 0;
            font-size: 32px;
            color: #333;
            font-weight: bold;
        }

        p {
            margin: 8px 0;
            color: #666;
            font-size: 18px;
        }

        .price {
            font-size: 24px;
            color: #e53935;
            font-weight: bold;
        }

        .highlight {
            color: #00796b;
        }

        button {
            margin-top: 30px;
            padding: 15px 30px;
            background-color: #00796b;
            border: none;
            border-radius: 50px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #004d40;
        }

        /* Styling for the description */
        .description {
            background-color: #f1f1f1;
            padding: 15px;
            border-radius: 8px;
            text-align: left;
            margin-top: 20px;
        }

        .description h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        /* Styling the container for car details */
        .details-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-top: 20px;
            gap: 20px;
        }

        .details-container div {
            flex: 1;
        }

    </style>
</head>
<body>
    <div id="car-details">
        <!-- Car image -->
        <img src="image/<?php echo $image_path; ?>" alt="Car Image">

        <h1><?php echo $car['vehicle_modelname']; ?></h1>

        <!-- Price Section -->
        <p class="price"><?php echo number_format($car['vehicle_price'], 2); ?></p>

        <div class="details-container">
            <div>
                <p><strong>Year:</strong> <?php echo $car['vehicle_year']; ?></p>
                <p><strong>Engine Type:</strong> <?php echo $car['vehicle_enginetype']; ?></p>
                <p><strong>Fuel Type:</strong> <?php echo $car['vehicle_fueltype']; ?></p>
                <p><strong>Transmission:</strong> <?php echo $car['vehicle_transmission']; ?></p>
                <p><strong>Seating Capacity:</strong> <?php echo $car['vehicle_seatingcapacity']; ?></p>
            </div>

            <div>
                <p><strong>Engine Capacity:</strong> <?php echo $car['vehicle_enginecapacity']; ?> L</p>
                <p><strong>Mileage:</strong> <?php echo $car['vehicle_mileage']; ?> km/l</p>
                <p><strong>Top Speed:</strong> <?php echo $car['vehicle_topspeed']; ?> km/h</p>
                <p><strong>Torque:</strong> <?php echo $car['vehicle_torque']; ?></p>
                <p><strong>Drivetrain:</strong> <?php echo $car['vehicle_drivetrain']; ?></p>
            </div>
        </div>

        <!-- Description Section -->
        <div class="description">
            <h2>Car Description</h2>
            <p><?php echo nl2br($car['vehicle_description']); ?></p>
        </div>

        
    </div>

 
</body>
</html>
