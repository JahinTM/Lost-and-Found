<%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");
    String report_id = request.getParameter("report_id");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##lostfound", "lostfound");

        // Handle approve/reject action
        if (action != null && report_id != null) {
            String sqlUpdate = "UPDATE Report SET status=? WHERE report_id=?";
            ps = conn.prepareStatement(sqlUpdate);
            ps.setString(1, action);
            ps.setInt(2, Integer.parseInt(report_id));
            ps.executeUpdate();
            ps.close();
        }

        // Fetch all reports
        String sql = "SELECT report_id, item, reporter_id, floor_no, specific_place, report_date, status FROM Report ORDER BY report_date DESC";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Report Dashboard</title>
    <link rel="stylesheet" href="css/report_admin.css">
</head>
<body>
<center>
<h2 class="page-title">Admin - Lost Item Reports</h2>
     <table class="report-table">
        <tr class="table-header">
            <th class="col-id">ID</th>
            <th class="col-item">Item</th>
            <th class="col-student">Student ID</th>
            <th class="col-floor">Floor</th>
            <th class="col-place">Place</th>
            <th class="col-date">Report Date</th>
            <th class="col-status">Status</th>
            <th class="col-action">Action</th>
        </tr>

<%
        while (rs.next()) {
%>
        <tr>
            <td class="cell-id"><%= rs.getInt("report_id") %></td>
            <td class="cell-item"><%= rs.getString("item") %></td>
            <td class="cell-student"><%= rs.getString("reporter_id") %></td>
            <td class="cell-floor"><%= rs.getString("floor_no") %></td>
            <td class="cell-place"><%= rs.getString("specific_place") %></td>
            <td class="cell-date"><%= rs.getDate("report_date") %></td>
            <td class="cell-status"><%= rs.getString("status") %></td>
            <td class="cell-action">
                <a class="button approve-btn" href="report_admin.jsp?action=Approved&report_id=<%= rs.getInt("report_id") %>">Approve</a>
                 <a class="button reject-btn" href="report_admin.jsp?action=Rejected&report_id=<%= rs.getInt("report_id") %>">Reject</a>
            </td>
        </tr>
<%
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>

    </table><br>
    <a href="admin_dashboard.jsp" class="back-link">Back to Dashboard</a>    </center>
    <script src="js/report_admin.js"></script>
</body>
</html>
