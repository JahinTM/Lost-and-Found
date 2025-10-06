<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
        }
        .navbar {
            background-color: #444;
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
            background-color: #c0392b;
            border: none;
            color: white;
            padding: 8px 15px;
            cursor: pointer;
            border-radius: 5px;
        }
        .logout-btn:hover {
            background-color: #922b21;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="report.html">Report</a>
            <a href="view.html">View</a>
            <a href="claims.html">Claims</a>
        </div>
        <form action="logout.jsp" method="post" style="margin:0;">
            <button class="logout-btn">Logout</button>
        </form>
    </div>

    <div class="content">
        <h2>Welcome to Student Dashboard</h2>
        <p>Submit and view your reports and claims here.</p>
    </div>
</body>
</html>
