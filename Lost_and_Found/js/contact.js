// Get report_id from URL and populate hidden input
function getQueryParam(name) {
    const url = new URL(window.location.href);
    return url.searchParams.get(name);
}

const rid = getQueryParam('report_id');
const errorDiv = document.getElementById('error');
const form = document.getElementById('contactForm');

if (!rid) {
    errorDiv.textContent = 'Missing report_id in URL. Open this page from the Reports list.';
    errorDiv.style.display = 'block';
    form.querySelector('input[type=submit]').disabled = true;
} else {
    document.getElementById('report_id').value = rid;
}
