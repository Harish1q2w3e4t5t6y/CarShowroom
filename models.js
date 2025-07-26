document.addEventListener("DOMContentLoaded", function () {
    // Load the navbar HTML
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

    // Get the 'brand' parameter from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const brand = urlParams.get('brand');

    // Update the hero section's brand title and background image
    const brandTitle = document.getElementById('brand-name');
    const heroSection = document.querySelector('.hero');

    if (brand) {
        brandTitle.textContent = brand;

        // Change the background image based on the selected brand
        const brandImages = {
            audi: 'audi.jpg',
            bmw: 'bmw.jpg',
            ferrari: 'ferrari.jpg',
            'mercedes-benz': 'benz.jpg',
            ford: 'ford.jpg',
            hyundai: 'hyundai.jpg',
            lexus: 'lexus.jpg',
            porsche: 'porsche.jpg',
            tesla: 'tesla.jpg',
            toyota: 'toyota.jpg'
        };

        heroSection.style.backgroundImage = `url('image/brand/${brandImages[brand.toLowerCase()] || 'default.jpg'}')`;
    } else {
        brandTitle.textContent = 'No brand selected :(';
        heroSection.style.backgroundImage = "url('image/brand/default.jpg')";

        const message = document.createElement('div');
        message.classList.add('message-box');
        message.textContent = "No brand selected. Redirecting to brands page...";
        document.body.appendChild(message);

        setTimeout(() => {
            window.location.href = "brands.html"; // Redirect to the brands page
        }, 4000);
    }

    // Fetch the models for the selected brand (if any)
    if (brand) {
        fetch(`models.php?brand=${brand}`)
            .then(response => response.json())
            .then(data => {
                const modelGallery = document.getElementById('model-gallery');
                if (data.length === 0) {
                    modelGallery.innerHTML = "<p>No models available for this brand.</p>";
                    return;
                }
                data.forEach(model => {
                    const modelCard = document.createElement('div');
                    modelCard.classList.add('model-card');
                    modelCard.innerHTML = `
                        <img 
                            src="image/${model.image_path}" 
                            alt="${model.vehicle_modelname}" 
                            onclick="viewCarDetails('${model.image_path}', '${model.vehicle_modelname}', '${model.vehicle_price}', '${model.vehicle_year}')">
                        <h3>${model.vehicle_modelname}</h3>
                        <p>Price: ${model.vehicle_price}</p>
                        <p>Year: ${model.vehicle_year}</p>
                        <button onclick="buyCar('${model.vehicle_modelname}', '${model.vehicle_price}')">Buy</button>
                    `;
                    modelGallery.appendChild(modelCard);
                });
            })
            .catch(error => {
                console.error("Error fetching car models:", error);
            });
    }

    // View car details in modal
    window.viewCarDetails = function (imagePath, modelName, price, year) {
        const url = `specific_car.php?image=${imagePath}&model=${encodeURIComponent(modelName)}&price=${price}&year=${year}`;
        const iframe = document.getElementById("carDetailsIframe");
        iframe.src = url;

        const modal = document.getElementById("carDetailsModal");
        modal.style.display = "block";
    };

    // Close modal functionality
    document.getElementById("closeModal").addEventListener("click", function () {
        const modal = document.getElementById("carDetailsModal");
        const iframe = document.getElementById("carDetailsIframe");
        modal.style.display = "none";
        iframe.src = ""; // Reset the iframe content
    });

    // Close modal if clicked outside of it
    window.onclick = function (event) {
        const modal = document.getElementById("carDetailsModal");
        if (event.target === modal) {
            modal.style.display = "none";
            document.getElementById("carDetailsIframe").src = "";
        }
    };

    // Hide loader once the page is fully loaded
    window.onload = () => {
        const loader = document.querySelector('.loader');
        if (loader) loader.style.display = 'none';
    };

    // Handle Buy button click
    window.buyCar = function (modelName,price) {
        // Show a confirmation alert to the user
        const userResponse = confirm("Would you like to buy accessories for this car?");
    
        // If the user clicks "Yes", redirect to the accessories page
        if (userResponse) {
           window.location.href = `accessories.html?model=${encodeURIComponent(modelName)}&price=${encodeURIComponent(price)}`;
            
        }
        // If the user clicks "No", do nothing
    };
    
    
});
