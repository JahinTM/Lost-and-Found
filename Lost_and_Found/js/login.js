document.addEventListener("DOMContentLoaded", () => {
    
    const form = document.getElementById("loginForm");

    form.addEventListener("submit", (e) => {
        const username = form.username.value.trim();
        const password = form.password.value.trim();

        if (username === "" || password === "") {
            alert("Please fill in all fields!");
            e.preventDefault();
            return;
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters!");
            e.preventDefault();
            return;
        }
    });
});
