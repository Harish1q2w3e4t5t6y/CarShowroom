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
// Highlight the active section based on scroll position
function highlightCurrentSection() {
    const sections = document.querySelectorAll('.parallax');
    const scrollPos = window.scrollY + window.innerHeight / 2;

    sections.forEach(section => {
        if (section.offsetTop <= scrollPos && section.offsetTop + section.offsetHeight > scrollPos) {
            const id = section.getAttribute('id');
            document.querySelectorAll('.navbar a').forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${id}`) {
                    link.classList.add('active');
                }
            });
        }
    });
}

// Event listener for scroll to highlight the active section
window.addEventListener('scroll', highlightCurrentSection);

// Redirect to model.html with brand name when a brand section is clicked
document.querySelectorAll('.parallax').forEach(section => {
    section.addEventListener('click', function() {
        const brandName = this.getAttribute('id'); // Use the section's id as the brand name
        window.location.href = `models.html?brand=${encodeURIComponent(brandName)}`;
    });
});
