<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
        }
        .navbar {
            background-color: #333;
            padding: 15px;
            color: white;
            display: flex;
            justify-content: space-between;
        }
        .navbar a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
        }
        .navbar a:hover {
            text-decoration: underline;
        }
        .content {
            padding: 40px;
            text-align: center;
        }
        .logout-btn {
            background-color: red;
            border: none;
            color: white;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="report.html">Report</a>
            <a href="view.html">View</a>
            <a href="claims.html">Claims</a>
            <a href="reportstatus.html">Report Status</a>
        </div>
        <form action="logout.jsp" method="post" style="margin:0;">
            <button class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="content">
        <h2>Welcome to Admin Dashboard</h2>
        <p>Manage reports, claims, and statuses here.</p>
    </div>
</body>
</html>
