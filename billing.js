let totalAmount = 0;  // Declare totalAmount as a global variable
let customerName = "";  // Declare customerName as a global variable

document.addEventListener("DOMContentLoaded", function () {
    // Helper function to get a cookie's value by its name
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
        return null;
    }

    // Fetch and load navbar
    fetch("include/navbar.html")
        .then(response => response.text())
        .then(data => {
            document.getElementById("navbar").innerHTML = data;
        })
        .catch(error => console.error("Error loading navbar:", error));

    // Retrieve sessions from cookies
    const sessions = JSON.parse(getCookie("sessions") || "[]");
    if (sessions.length > 0) {
        const lastSession = sessions[sessions.length - 1];
        const email = lastSession.email;

        // Fetch customer name from the server
        fetch("billing.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: `email=${encodeURIComponent(email)}`,
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    customerName = data.customerName;  // Set global customerName variable

                    // Get the 'model' and 'price' parameters from the URL
                    const urlParams = new URLSearchParams(window.location.search);
                    const modelName = urlParams.get('model');
                    const carPrice = parseFloat(urlParams.get('price')) || 0;

                    // Retrieve the mini-bill details from localStorage
                    const miniBillDetails = JSON.parse(localStorage.getItem("miniBillDetails")) || [];
                    const miniBillTotal = parseFloat(localStorage.getItem("miniBillTotal")) || 0;

                    totalAmount = carPrice + miniBillTotal;  // Set global totalAmount variable

                    // Generate the bill HTML with customer name
                    let billHTML = `
                        <h2>${customerName.toUpperCase()}'s Bill</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>S.No</th>
                                    <th>Item Name</th>
                                    <th>Actual Amt</th>
                                    <th>Tax (%)</th>
                                    <th>Price (₹)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>${modelName || "Car Model"}</td>
                                    <td>${carPrice}</td>
                                    <td>18</td>
                                    <td>${(carPrice * 1.18).toFixed(2)}</td>
                                </tr>`;
                    miniBillDetails.forEach((item, index) => {
                        const taxedPrice = item.price * 1.18;
                        billHTML += `
                            <tr>
                                <td>${index + 2}</td>
                                <td>${item.name}</td>
                                <td>${(taxedPrice/1.18).toFixed(1)}</td>
                                <td>18</td>
                                <td>${(taxedPrice).toFixed(2)}</td>
                            </tr>`;
                    });

                    billHTML += `
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4"><strong>Total Amount</strong></td>
                                    <td><strong>₹${(totalAmount * 1.18).toFixed(2)}</strong></td>
                                </tr>
                            </tfoot>
                        </table>`;

                    // Insert the bill HTML into the page
                    document.getElementById("billDetails").innerHTML = billHTML;

                    // Add the Pay button
                    const paymentSection = document.getElementById("paymentSection");
                    const payButton = document.createElement("button");
                    payButton.textContent = "Pay Now";
                    payButton.onclick = function () {
                        showPaymentOptions(totalAmount * 1.18);
                    };
                    paymentSection.appendChild(payButton);
                } else {
                    console.error("Error fetching customer name:", data.message);
                }
            })
            .catch(error => {
                console.error("Error fetching customer name:", error);
            });
    } else {
        alert("No sessions found in cookies.");
    }

    document.getElementById("trackingid").addEventListener("click", function () {
        // Get the session ID from the input text box
        const inputSessionID = document.getElementById("inputTextBox").value;
    
        // Get all payment tracking data from the cookie
        const paytrackingData = JSON.parse(getCookie("paytracking") || "[]");
    
        if (paytrackingData.length === 0) {
            alert("No payment tracking data found.");
            return;
        }
    
        // Find the data that matches the input session ID
        const userData = paytrackingData.find(data => data.trackingID === inputSessionID);
    
        if (!userData) {
            alert("No user found with the given session ID.");
        } else {
            // Display the specific user's data
            alert(`Specific User Details:\n\nTracking ID: ${userData.trackingID}\nCustomer Name: ${userData.customerName}\nTotal Amount: ₹${userData.totalAmount}`);
        }
    });
    
    // Helper function to get the cookie value by name
    function getCookie(name) {
        const value = `; ${document.cookie}`;
        const parts = value.split(`; ${name}=`);
        if (parts.length === 2) return parts.pop().split(';').shift();
    }
    
   
    
});

 // Helper function to get a cookie by its name
 function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(";").shift();
    return null;
}

// Function to fetch and display payment tracking data for all users
function displayPaytrackingData() {
    const paytrackingData = JSON.parse(getCookie("paytracking") || "[]");
    if (paytrackingData.length === 0) {
        alert("No payment tracking data found.");
        return;
    }

    // Display the payment tracking data for all users
    let displayMessage = "Payment Tracking Data:\n\n";
    paytrackingData.forEach((data, index) => {
        displayMessage += `User ${index + 1}:\nTracking ID: ${data.trackingID}\nCustomer Name: ${data.customerName}\nTotal Amount: ₹${data.totalAmount}\n\n`;
    });

    alert(displayMessage);
}

// Function to show payment options
function showPaymentOptions(totalAmount) {
    const paymentOptionsHTML = `
        <h3>Select Payment Method</h3>
        <button onclick="processGPay(${totalAmount})">Pay via GPay</button>
        <button onclick="processUPI(${totalAmount})">Pay via UPI ID</button>
    `;
    document.getElementById("paymentSection").innerHTML = paymentOptionsHTML;
}

// Function to process GPay
function processGPay(totalAmount) {
    const paymentData = `Amount: ₹${totalAmount.toFixed(2)}`;
    QRCode.toDataURL(paymentData, function (err, qrCodeURL) {
        if (err) {
            console.error("Error generating QR code:", err);
            return;
        }

        const qrCodeSection = `
            <h3>Scan this QR Code to Pay via GPay</h3>
            <img src="${qrCodeURL}" alt="GPay QR Code" />
            <p>After scanning, enter the confirmation code to verify payment.</p>
            <button onclick="verifyPayment()">Verify Payment</button>
        `;
        document.getElementById("paymentSection").innerHTML = qrCodeSection;
    });
}

// Function to process UPI payment
function processUPI(totalAmount) {
    const upiID = prompt("Enter your UPI ID to proceed with the payment:");
    if (upiID) {
        const confirmationCode = prompt("Enter the confirmation code to verify payment:");
        if (confirmationCode) {
            verifyPayment(confirmationCode);
        }
    }
}

// Function to verify payment
function verifyPayment() {
    const confirmationCode = prompt("Enter your confirmation code:");
    if (confirmationCode === "12345") {
        alert("Payment successful! Thank you for your purchase.");
        
        // Set the paytracking cookie to indicate successful payment
        const paytrackingID = `PTID-${Math.random().toString(36).substr(2, 9)}`;
        
        // Prepare the user payment tracking data
        const paymentDetails = {
            trackingID: paytrackingID,
            customerName: customerName,
            totalAmount: (totalAmount * 1.18).toFixed(2),
        };
        
    
        // Retrieve existing payment tracking data from the cookie
        const existingPaytrackingData = JSON.parse(getCookie("paytracking") || "[]");
    
        // Append the new payment details to the existing data
        existingPaytrackingData.push(paymentDetails);
    
        // Store the updated payment tracking data in the cookie
        document.cookie = "paytracking=" + JSON.stringify(existingPaytrackingData) + "; path=/; expires=" + new Date(new Date().getTime() + 24 * 60 * 60 * 1000).toUTCString(); // Cookie expires in 1 day
    
        // Display the current user's payment details
        alert(`Customer: ${customerName}\nTotal Amount: ₹${paymentDetails.totalAmount}\nTracking ID: ${paytrackingID}`);
    
        // Confirmation message for successful cookie storage
        const paytrackingCookie = getCookie("paytracking");
        if (paytrackingCookie) {
            alert("Payment tracking data saved successfully.");
        } else {
            alert("Failed to save the payment tracking data.");
        }
        // Display the thank you message below the "Verify Payment" button
        // Display the thank-you message below the "Verify Payment" button
        const paymentSection = document.getElementById("paymentSection");

         paymentSection.innerHTML = `
            <h3>Payment Successful!</h3>
            <p>Thank you for your purchase! Your payment was successful. Your Tracking ID: <strong>${paytrackingID}</strong></p>
            <button onclick="printBill()">Print Bill</button>
            <div id="feedbackSection" style="margin-top: 20px;">
                <h4>We value your feedback</h4>
                <form id="feedbackForm">
                    <textarea id="feedbackInput" rows="4" cols="50" placeholder="Write your feedback here..."></textarea>
                    <br />
                    <button type="button" onclick="submitFeedback()">Submit Feedback</button>
                </form>
            </div>
        `;
    }  else {
        alert("Invalid confirmation code. Please try again.");
    }
}

function printBill() {
    const billContent = document.getElementById("billDetails").innerHTML;
    const printWindow = window.open("", "_blank", "width=800,height=600");
    printWindow.document.write(`
        <html>
            <head>
                <title>${customerName.toUpperCase()}'s Bill</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    h2 { text-align: center; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid #000; padding: 8px; text-align: center; }
                    th { background-color: #f2f2f2; }
                    tfoot td { font-weight: bold; }
                </style>
            </head>
            <body>
                ${billContent}
                <p style="text-align: center; margin-top: 20px;">Thank you for your purchase!</p>
            </body>
        </html>
    `);
    printWindow.document.close();
    printWindow.focus();
    printWindow.print();
    printWindow.close();
}

// Function to submit feedback
function submitFeedback() {
    const feedback = document.getElementById("feedbackInput").value.trim();
    if (!feedback) {
        alert("Please enter your feedback before submitting.");
        return;
    }

    fetch("submitFeedback.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `feedback=${encodeURIComponent(feedback)}&customerName=${encodeURIComponent(customerName)}`,
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                alert("Thank you for your feedback!");
                document.getElementById("feedbackForm").reset(); // Reset the form
            } else {
                alert("Failed to submit feedback. Please try again later.");
            }
        })
        .catch(error => {
            console.error("Error submitting feedback:", error);
            alert("An error occurred. Please try again later.");
        });
}
