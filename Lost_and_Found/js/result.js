// Optional: Fade animation
document.addEventListener("DOMContentLoaded", () => {
    const box = document.querySelector(".result-box");
    box.style.opacity = 0;

    setTimeout(() => {
        box.style.transition = "0.8s";
        box.style.opacity = 1;
    }, 100);
});
