// Confirmation before approve/reject
document.addEventListener("DOMContentLoaded", () => {

    const approveButtons = document.querySelectorAll(".approve-btn");
    const rejectButtons = document.querySelectorAll(".reject-btn");

    approveButtons.forEach(btn => {
        btn.addEventListener("click", function (e) {
            if (!confirm("Are you sure you want to APPROVE this report?")) {
                e.preventDefault();
            }
        });
    });

    rejectButtons.forEach(btn => {
        btn.addEventListener("click", function (e) {
            if (!confirm("Are you sure you want to REJECT this report?")) {
                e.preventDefault();
            }
        });
    });

});
