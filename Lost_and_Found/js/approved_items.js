// Simple fade-in animation for table rows
document.addEventListener("DOMContentLoaded", () => {
    const rows = document.querySelectorAll(".approved-table .table-row");
    rows.forEach((row, index) => {
        row.style.opacity = 0;
        setTimeout(() => {
            row.style.transition = "0.5s";
            row.style.opacity = 1;
        }, index * 100);
    });
});
