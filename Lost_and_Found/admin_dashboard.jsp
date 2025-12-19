<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/admin_dashboard.css">
</head>
<body>

<div class="sidebar">
    <h2 class="logo">Admin Panel</h2>

    <a href="report_admin.jsp" class="menu-item">Report</a>
    <a href="view.jsp" class="menu-item">View</a>
    <a href="claims.jsp" class="menu-item">Claims</a>
    <a href="contact_admin.jsp" class="menu-item">Messages</a>

    <form action="logout.jsp" method="post">
        <button class="logout-btn">Logout</button>
    </form>
</div>

<div class="main-content">
    <h1>Welcome to Admin Dashboard</h1>
    <p>Manage reports, claims, and statuses here.</p>

    <div class="cards-container">
        <div class="card">
            <h3>Reports</h3>
            <p>View and manage lost item reports.</p>
        </div>

        <div class="card">
            <h3>User Claims</h3>
            <p>Approve or reject user item claims.</p>
        </div>

        <div class="card">
            <h3>Messages</h3>
            <p>Check and reply to user queries.</p>
        </div>

        <div class="card">
            <h3>All Items</h3>
            <p>Browse all submitted items.</p>
        </div>
    </div>
</div>

<script src="js/admin_dashboard.js"></script>
</body>
</html>
