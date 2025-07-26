document.addEventListener("DOMContentLoaded", () => {
    const chatIcon = document.getElementById("chat-icon");
    const chatBox = document.getElementById("chat-box");
    const closeChat = document.getElementById("close-chat");
    const sendButton = document.getElementById("send-button");
    const userQueryInput = document.getElementById("user-query");
    const messagesContainer = document.getElementById("messages");

    chatIcon.addEventListener("click", () => {
        chatBox.classList.add("visible");
    });
    
    closeChat.addEventListener("click", () => {
        chatBox.classList.remove("visible");
    });
    
    // Send message function
    function sendMessage(message, isUser = true) {
        const messageElement = document.createElement("div");
        messageElement.classList.add(isUser ? "user-message" : "bot-message");
        messageElement.innerText = message;
        messagesContainer.appendChild(messageElement);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // Handle sending user query and getting response
    sendButton.addEventListener("click", () => {
        const userMessage = userQueryInput.value.trim();
        if (userMessage) {
            sendMessage(userMessage); // Show user message immediately
            userQueryInput.value = "";

            // Send the user message to the server via AJAX
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "chatbot_server.php", true); // Make sure the path is correct
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            // Handle the response from the server
            xhr.onload = function() {
                if (xhr.status === 200) {
                    const botMessage = xhr.responseText; // Bot's response from server
                    sendTypingEffect(botMessage);  // Show the bot's response with typing effect
                } else {
                    sendMessage("Sorry, I couldn't process your request. Please try again.", false);
                }
            };

            // Send the data to the server
            xhr.send("user_query=" + encodeURIComponent(userMessage));
        }
    });

    // Function to show bot response with word-by-word typing effect
    function sendTypingEffect(message) {
        const messageElement = document.createElement("div");
        messageElement.classList.add("bot-message");
        messagesContainer.appendChild(messageElement);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;

        const words = message.split(' '); // Split message into words
        let index = 0;
        const typingInterval = setInterval(() => {
            messageElement.innerText += words[index] + ' ';  // Add one word at a time
            index++;
            if (index === words.length) {
                clearInterval(typingInterval); // Stop when all words are typed
            }
        }, 300);  // 300ms delay between words
    }
});
