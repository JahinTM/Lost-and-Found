<%@ page import="java.sql.*" %>
<%
    int totalReports = 0;
    int approvedReports = 0;
    int totalMessages = 0;
    int reviewedMessages = 0;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##lostfound", "lostfound");

        // Total reports
        ps = conn.prepareStatement("SELECT COUNT(*) FROM Report");
        rs = ps.executeQuery();
        if (rs.next()) totalReports = rs.getInt(1);
        rs.close();
        ps.close();

        // Approved reports
        ps = conn.prepareStatement("SELECT COUNT(*) FROM Report WHERE status='Approved'");
        rs = ps.executeQuery();
        if (rs.next()) approvedReports = rs.getInt(1);
        rs.close();
        ps.close();

        // Total contact messages
        ps = conn.prepareStatement("SELECT COUNT(*) FROM ContactMessages");
        rs = ps.executeQuery();
        if (rs.next()) totalMessages = rs.getInt(1);
        rs.close();
        ps.close();

        // Reviewed messages
        ps = conn.prepareStatement("SELECT COUNT(*) FROM ContactMessages WHERE status='Reviewed'");
        rs = ps.executeQuery();
        if (rs.next()) reviewedMessages = rs.getInt(1);
        rs.close();
        ps.close();

        conn.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Our Achievements</title>
    <link rel="stylesheet" href="css/claims.css">
</head>
<body>

<div class="claims-container">
    <h1>Our Achievements</h1>
    <p class="subtitle">Real success powered by honesty</p>

    <div class="claims-grid">

        <div class="claim-card">
            <h2><%= totalReports %></h2>
            <p>Total Lost Items Reported</p>
        </div>

        <div class="claim-card">
            <h2><%= approvedReports %></h2>
            <p>Items Successfully Returned</p>
        </div>

        <div class="claim-card">
            <h2><%= totalMessages %></h2>
            <p>Total Claims Submitted</p>
        </div>

        <div class="claim-card">
            <h2><%= reviewedMessages %></h2>
            <p>Claims Verified by Admin</p>
        </div>

    </div>

    <a href="dashboard2.jsp" class="back-home"> Back to Dashboard</a>
</div>

<script src="js/claims.js"></script>
</body>
</html>
