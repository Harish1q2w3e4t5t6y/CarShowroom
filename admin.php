<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="include/navbar.css">
    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
                body {
            font-family: Arial, sans-serif;
            background: url('image/admin.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }


         

        .container {
            width: 50%;
            margin: 290px auto;
            padding: 30px;
            background: #157cc0;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .actions {
            text-align: center;
            margin-top: 20px;
        }

        .actions button {
            padding: 10px 20px;
            background-color: #a0743e;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 5px;
        }

        .actions button:hover {
            background-color: #000;
        }

    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <!-- Navbar Placeholder -->
    <nav class="navbar">
    <div class="logo">
        <img src="image/logo.png" alt="Logo">
    </div>
    <div class="nav-links">
        <a href="credentials.html" class="topic">Logout</a>
    </div>
</nav>


    <!-- Admin Dashboard -->
    <div class="container">
        <h1>Admin Dashboard</h1>

        <!-- Action Buttons -->
        <div class="actions">
            <button onclick="window.location.href='add.php'">Add Vehicle</button>
            <button onclick="window.location.href='delete.php'">Update/Delete Vehicle</button>
            <button onclick="showLastTwoSessions()">View Last Two Sessions</button> <!-- Button to view last two sessions -->
        </div>
    </div>

    <script>

        // scripts.js
document.addEventListener("DOMContentLoaded", function() {
    fetch("include/navbar.html")
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok " + response.statusText);
            }
            return response.text();
        })
        .then(data => {
            document.getElementById("navbar").innerHTML = data;
        })
        .catch(error => {
            console.error("Error loading navbar:", error);
        });
});
        // Helper function to get a cookie value by name
        function getCookie(name) {
            const value = `; ${document.cookie}`;
            const parts = value.split(`; ${name}=`);
            if (parts.length === 2) return parts.pop().split(";").shift();
            return null;
        }

        // Function to display the last two session details in a message box (alert)
        function showLastTwoSessions() {
            const sessions = JSON.parse(getCookie("sessions") || "[]");

            if (sessions.length === 0) {
                alert("No session details found.");
                return;
            }

// Get the last two sessions
const lastTwoSessions = sessions.slice(-2); // Fetch the last two sessions

// Prepare the message content for the last two sessions
let sessionMessage = "<h2>Session Tracking</h2>";
lastTwoSessions.forEach((session, index) => {
    const sessionLabel = index === 0 ? " (Previous)" : " (Current)";
    sessionMessage += `<p><strong> ${sessionLabel}:</strong><br>
                       Email: ${session.email}<br>
                       Login Time: ${new Date(session.loginTime).toLocaleString()}<br>
                       Session ID: ${session.sessionId}</p>`;
});

// Create a modal to display the session details
const modal = document.createElement("div");
modal.style.position = "fixed";
modal.style.top = "50%";
modal.style.left = "50%";
modal.style.transform = "translate(-50%, -50%)";
modal.style.padding = "20px";
modal.style.backgroundColor = "white";
modal.style.border = "1px solid #ddd";
modal.style.borderRadius = "10px";
modal.style.boxShadow = "0 4px 8px rgba(0, 0, 0, 0.1)";
modal.style.textAlign = "left";
modal.style.fontSize = "1.2rem"; // Increased font size
modal.style.zIndex = "1000";

// Insert the message into the modal
modal.innerHTML = sessionMessage;

// Add a close button to the modal
const closeButton = document.createElement("button");
closeButton.textContent = "Close";
closeButton.style.marginTop = "10px";
closeButton.style.padding = "10px";
closeButton.style.fontSize = "1rem";
closeButton.style.backgroundColor = "#4CAF50";
closeButton.style.color = "white";
closeButton.style.border = "none";
closeButton.style.borderRadius = "5px";
closeButton.style.cursor = "pointer";
closeButton.addEventListener("click", () => {
    document.body.removeChild(modal);
});

// Append the close button to the modal
modal.appendChild(closeButton);

// Append the modal to the body
document.body.appendChild(modal);
 
        }
    </script>
</body>
</html>
