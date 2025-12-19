<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/student_dashboard.css">
</head>
<body>
<div class="container">
    <div class="content">
        <h2>Welcome to Student Dashboard</h2>
        <p>Submit and view your reports and claims here.</p>
    </div>

    <div class="navbar">
        <a class="nav-link" href="report.html">Report</a>
        <a class="nav-link" href="view.jsp">View</a>
        <a class="nav-link" href="claims.jsp">Claims</a>
        <a class="nav-link" href="contact.html">Found</a>

        <form action="logout.jsp" method="post" class="logout-form">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</div>

<script src="js/student_dashboard.js"></script>
</body>
</html>
