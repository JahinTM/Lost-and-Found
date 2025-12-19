// Simple fade-in animation for dashboard links
document.addEventListener("DOMContentLoaded", () => {
    const links = document.querySelectorAll(".navbar .nav-link");
    links.forEach((link, index) => {
        link.style.opacity = 0;
        setTimeout(() => {
            link.style.transition = "0.5s";
            link.style.opacity = 1;
        }, index * 150);
    });

    // Fade in logout button
    const logoutBtn = document.querySelector(".logout-btn");
    logoutBtn.style.opacity = 0;
    setTimeout(() => {
        logoutBtn.style.transition = "0.5s";
        logoutBtn.style.opacity = 1;
    }, links.length * 150);
});
