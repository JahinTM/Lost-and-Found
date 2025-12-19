// Fade-in animation for form inputs
document.addEventListener("DOMContentLoaded", () => {
    const inputs = document.querySelectorAll(".report-form input[type='text']");
    inputs.forEach((input, index) => {
        input.style.opacity = 0;
        setTimeout(() => {
            input.style.transition = "0.5s";
            input.style.opacity = 1;
        }, index * 100);
    });

    const submitBtn = document.querySelector(".submit-btn");
    submitBtn.style.opacity = 0;
    setTimeout(() => {
        submitBtn.style.transition = "0.5s";
        submitBtn.style.opacity = 1;
    }, inputs.length * 100);
});
