<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##lostfound", "lostfound");

        String sql = "SELECT report_id, item, floor_no, specific_place FROM Report WHERE status='Approved' ORDER BY report_date DESC";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Approved Lost Items</title>
    <link rel="stylesheet" href="css/approved_items.css">
</head>
<body>
<div class="container">
    <h2 class="page-title">Approved Lost Items</h2>
    <table class="approved-table">
        <tr class="table-header">
            <th>Report ID</th>
            <th>Item</th>
            <th>Place</th>
        </tr>
<%
        while(rs.next()) {
%>
        <tr class="table-row">
            <td><%= rs.getInt("report_id") %></td>
            <td><%= rs.getString("item") %></td>
            <td><%= rs.getString("floor_no") %> - <%= rs.getString("specific_place") %></td>
        </tr>
<%
        }

        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
    </table>

    <a href="dashboard2.jsp" class="back-btn"> Back To Dashboard</a>
</div>

<script src="js/approved_items.js"></script>
</body>
</html>
