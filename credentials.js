const formContainer = document.getElementById("form-container");
const showSignupBtn = document.getElementById("show-signup");
const showLoginBtn = document.getElementById("show-login");
const loginForm = document.getElementById("loginForm");
const signupForm = document.getElementById("signupForm");
const emailField = document.getElementById("email");
const signupEmailField = document.getElementById("signupEmail");
const signupError = document.getElementById("signupError"); 
const loginError = document.getElementById("loginError");

// Show Signup Form
showSignupBtn.addEventListener("click", () => {
    formContainer.classList.add("show-signup");
    formContainer.classList.remove("show-login");
});

// Show Login Form
showLoginBtn.addEventListener("click", () => {
    formContainer.classList.add("show-login");
    formContainer.classList.remove("show-signup");
});



// Event listener to check email availability on keyup (every time the user types)
emailField.addEventListener("keyup", () => {
    const email = emailField.value;

    if (email.length > 0) {
        // Prepare data to send to the server
        const formData = new FormData();
        formData.append('email', email);
        formData.append('check_email', 'true');  // Flag to check email availability

        // Send AJAX request to check email availability
        fetch('credentials.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(responseData => {
            if (responseData.status === 'error') {
                // Display error message if email is already taken
                emailError.textContent = responseData.message;
                emailError.style.color = 'green';
            } else {
                // Clear error message if email is available
                emailError.textContent = '';
            }
        })
        .catch(error => {
            console.error('Error during fetch:', error);
        });
    } else {
        // Clear error message if email input is empty
        emailError.textContent = '';
    }
});

// Event listener to check email availability on keyup
signupEmailField.addEventListener("keyup", () => {
    const email = signupEmailField.value;

    if (email.length > 0) {
        const formData = new FormData();
        formData.append("email", email);
        formData.append("check_email", "true");

        fetch("credentials.php", {
            method: "POST",
            body: formData,
        })
            .then((response) => response.json())
            .then((responseData) => {
                if (responseData.status === "error") {
                    signupError.textContent = responseData.message; // Show error for already signed-up email
                    signupError.style.color = "red";
                } else {
                    signupError.textContent = ""; // Clear error if email is available
                }
            })
            .catch((error) => {
                console.error("Error during fetch:", error);
            });
    } else {
        signupError.textContent = ""; // Clear error when email input is empty
    }
});

// Handle Login Form Submission
loginForm.addEventListener("submit", (event) => {
    event.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.querySelector('input[name="password"]').value.trim();

    if (email === "admin@123" && password === "admin") {
        // addSessionToCookies(email); // Add admin session to cookies
        window.location.href = "admin.php"; // Redirect to admin page
        return;
    }

    const formData = new FormData();
    formData.append("email", email);
    formData.append("password", password);
    formData.append("login", "true");

    fetch("credentials.php", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.json())
        .then((responseData) => {
            if (responseData.status === "success") {
                addSessionToCookies(email); // Add session to cookies
                window.location.href = "homee.html"; // Redirect to home page
            } else if (responseData.status === "password_error") {
                alert("Password is incorrect! Please try again."); // Show alert for incorrect password
            } else {
                alert("Don't have account signup");
                loginError.textContent = responseData.message; // General error message
                loginError.style.color = "red";
            }
            // Clear fields after the attempt
            document.getElementById("email").value = "";
            document.querySelector('input[name="password"]').value = "";
        })
        .catch((error) => {
            console.error("Error during fetch:", error);
        });
});

// Function to add a session to cookies
function addSessionToCookies(email) {
    const loginTime = new Date().toISOString(); // Current login time
    const sessionId = 'session_' + Math.random().toString(36).substring(2); // Random session ID

    // Create a new session object
    const newSession = { email, loginTime, sessionId };

    // Retrieve existing sessions from cookies
    const sessions = JSON.parse(getCookie("sessions") || "[]");

    // Add the new session to the sessions array (limit to 5)
    sessions.push(newSession);
    if (sessions.length > 5) {
        sessions.shift(); // Remove the oldest session
    }

    // Save updated sessions array to cookies
    document.cookie = `sessions=${JSON.stringify(sessions)}; path=/`;

    console.log("Stored sessions:", sessions);
}

// Helper function to get a cookie value by name
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(";").shift();
    return null;
}

// Handle Sign Up Form Submission
signupForm.addEventListener("submit", (event) => {
    event.preventDefault();

    const username = document.getElementById("username").value.trim();
    const email = signupEmailField.value.trim();
    const password = document.getElementById("signupPassword").value.trim();

    const formData = new FormData();
    formData.append("username", username);
    formData.append("email", email);
    formData.append("password", password);
    formData.append("signup", "true");

    fetch("credentials.php", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.json())
        .then((responseData) => {
            if (responseData.status === "error") {
                signupError.textContent = responseData.message; // Show signup error message
                signupError.style.color = "red";
            } else {
                alert("Successfully accout signuped");
            }
            // Clear fields after the attempt
            document.getElementById("username").value = "";
            signupEmailField.value = "";
            document.getElementById("signupPassword").value = "";
        })
        .catch((error) => {
            console.error("Error during fetch:", error);
        });
});
