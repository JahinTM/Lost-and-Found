<%@ page import="java.sql.*" %>
<%
    String item = request.getParameter("item");
    String reporter_id = request.getParameter("reporter_id");
    String floor_no = request.getParameter("floor_no");
    String specific_place = request.getParameter("specific_place");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##lostfound", "lostfound");

        // 🔥 Step 1: Check reporter_id exists in USERS table
        String checkSQL = "SELECT COUNT(*) FROM USERS WHERE std_id = ?";
        ps = conn.prepareStatement(checkSQL);
        ps.setString(1, reporter_id);
        rs = ps.executeQuery();

        int exists = 0;
        if (rs.next()) exists = rs.getInt(1);

        rs.close();
        ps.close();

        if (exists == 0) {
%>
<!DOCTYPE html>
<html>
<head><title>Error</title></head>
<body>
<h2 style="color:red; text-align:center;">❌ Invalid Student ID! User does not exist.</h2>
<center><a href="report.html">Try Again</a></center>
</body>
</html>
<%
            return;  // Stop execution
        }

        // 🔥 Step 2: Insert report if valid user
        String sql = "INSERT INTO Report (item, reporter_id, floor_no, specific_place) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, item);
        ps.setString(2, reporter_id);
        ps.setString(3, floor_no);
        ps.setString(4, specific_place);

        int rows = ps.executeUpdate();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Submission</title>
    <link rel="stylesheet" href="css/report.css">
</head>
<body>
<div class="container">
<%
        if (rows > 0) {
%>
    <h2 class="success-message">Lost item report submitted successfully!</h2>
    <a href="report.html" class="back-btn">Submit Another Report</a>
<%
        } else {
%>
    <h2 class="error-message">Failed to submit the report. Please try again.</h2>
    <a href="report.html" class="back-btn">Go Back</a>
<%
        }

        ps.close();
        conn.close();

    } catch (Exception e) {
%>
    <h3 class="error-message">Error: <%= e.getMessage() %></h3>
    <a href="report.html" class="back-btn">Go Back</a>
<%
    }
%>
</div>
</body>
</html>
