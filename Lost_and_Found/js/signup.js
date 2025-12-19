// Signup form validation
document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form");

    form.addEventListener("submit", (e) => {
        const username = form.username.value.trim();
        const stdid = form.stdid.value.trim();
        const password = form.password.value.trim();
        const usertype = form.usertype.value;

        if (!username || !stdid || !password || !usertype) {
            alert("Please fill in all fields!");
            e.preventDefault();
            return;
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters long.");
            e.preventDefault();
            return;
        }

        // Optional: Confirm user type
        if (!["Student", "Admin"].includes(usertype)) {
            alert("Invalid user type selected!");
            e.preventDefault();
        }
    });
});
document.querySelector("form").addEventListener("submit", function(e) {
    let id = document.querySelector("input[name='stdid']").value;

    if (!/^\d{9}$/.test(id)) {
        alert("Student ID must be exactly 9 digits.");
        e.preventDefault();
    }
});

