document.addEventListener("DOMContentLoaded", function() {
  // Clear the mini-bill data from localStorage when the accessories page is loaded
  localStorage.removeItem("miniBillDetails");
  localStorage.removeItem("miniBillTotal");

  // You can add other page-specific operations here if needed
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

  // Get the 'model' parameter from the URL
  const urlParams = new URLSearchParams(window.location.search);
  const modelName = urlParams.get('model');
  const price = urlParams.get('price');

  // Display or store the model name
  if (modelName) {
      console.log("Selected model:", modelName);
      document.getElementById("selectedCarModel").textContent = `Selected Car: ${modelName}`;
  } else {
      console.log("No car model selected");
  }
});

$(document).ready(function() {
  $('#images, #seats, #cover').kwicks({ max: 600, spacing: 2 });
});

let totalAmount = 0;
let selectedItems = []; // Array to store selected items

// Function to add an item to the mini-bill
function addToMiniBill(button) {
  const name = button.getAttribute("data-name");
  const price = parseInt(button.getAttribute("data-price"));

  // Add the item to the array
  selectedItems.push({ name, price });

  // Update the total
  totalAmount += price;

  // Trigger the animation
  triggerDotAnimation(button);
}

// Function to view the mini-bill
function viewMiniBill() {
  if (selectedItems.length === 0) {
      alert("No items selected in the mini-bill.");
      
      // Get the model name from the URL (if available)
      const urlParams = new URLSearchParams(window.location.search);
      const modelName = urlParams.get('model');
      const price = urlParams.get('price');

      // Redirect to the bill page with the model name
      window.location.href = `billing.html?model=${encodeURIComponent(modelName)}&price=${encodeURIComponent(price)}`;
      return;
  }

  // Get the model name from the URL (if available)
  const urlParams = new URLSearchParams(window.location.search);
  const modelName = urlParams.get('model');
  const price = urlParams.get('price');

  // Redirect to the bill page with the model name
  window.location.href = `billing.html?model=${encodeURIComponent(modelName)}&price=${encodeURIComponent(price)}`;

  // Generate the mini-bill details
  let billDetails = "Mini Bill:\n";
  selectedItems.forEach((item, index) => {
      billDetails += `${index + 1}. ${item.name} - ${item.price}\n`;
  });
  billDetails += `\nTotal: ${totalAmount}`;

  // Display the mini-bill in a message box
  alert(billDetails);

  // Save the mini-bill details to localStorage
  localStorage.setItem("miniBillDetails", JSON.stringify(selectedItems));
  localStorage.setItem("miniBillTotal", totalAmount);
}

// Function to trigger the dot animation
function triggerDotAnimation(element) {
  const dot = document.createElement("div");
  dot.classList.add("dot");

  // Get the clicked element's position
  const rect = element.getBoundingClientRect();

  // Set the initial position of the dot
  dot.style.left = `${rect.left + rect.width / 2}px`;
  dot.style.top = `${rect.top + rect.height / 2}px`;

  document.body.appendChild(dot);

  // Get the position of the "viewminibill" image
  const target = document.getElementById("viewminibill");
  const targetRect = target.getBoundingClientRect();

  // Animate the dot to the target position
  const animation = dot.animate(
      [
          { transform: "scale(1)", left: `${rect.left + rect.width / 2}px`, top: `${rect.top + rect.height / 2}px` },
          { transform: "scale(1.5)", opacity: 0.8 },
          { transform: "scale(0)", left: `${targetRect.left + targetRect.width / 2}px`, top: `${targetRect.top + targetRect.height / 2}px`, opacity: 0 }
      ],
      {
          duration: 800,
          easing: "ease-in-out",
      }
  );

  // Remove the dot after the animation ends
  animation.onfinish = () => {
      dot.remove();
  };
}
