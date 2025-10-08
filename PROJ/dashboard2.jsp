<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>

</head>
<body>
<center>
    

    <div class="content">
        <h2>Welcome to Student Dashboard</h2>
        <p>Submit and view your reports and claims here.</p>
    </div>
    <div class="navbar">
        <div>
            <a href="report.html">Report</a><br><br>
            <a href="view.jsp">View</a><br><br>
            <a href="claims.html">Claims</a><br><br>
            <a href="contact.html">Found</a><br><br>
        </div>
        <form action="logout.jsp" method="post" style="margin:0;">
            <button class="logout-btn">Logout</button>
        </form>
    </div>
</center>
</body>
</html>
