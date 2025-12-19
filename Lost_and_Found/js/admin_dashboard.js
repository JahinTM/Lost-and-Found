// Fade-in animation
document.addEventListener("DOMContentLoaded", () => {
    const cards = document.querySelectorAll(".card");
    cards.forEach((card, index) => {
        card.style.opacity = 0;
        setTimeout(() => {
            card.style.transition = "0.6s";
            card.style.opacity = 1;
        }, 200 * index);
    });
});
