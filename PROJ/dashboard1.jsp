<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

</head>
<body>
<center>
<div class="content">
        <h2>Welcome to Admin Dashboard</h2>
        <p>Manage reports, claims, and statuses here.</p>
    </div>
    <div class="navbar">
        <div>
            <a href="report_admin.jsp">Report</a> <br><br>
            <a href="view.jsp">View</a><br><br>
            <a href="claims.html">Claims</a><br><br>
            <a href="contact_admin.jsp">Message</a><br><br>
        </div>
        <form action="logout.jsp" method="post" style="margin:0;">
            <button class="logout-btn">Logout</button>
        </form><br><br>
    </div>

    </center>
</body>
</html>
