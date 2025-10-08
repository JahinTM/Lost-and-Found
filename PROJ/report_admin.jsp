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
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

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

</head>
<body>
<center>
    <h2>Admin - Lost Item Reports</h2>
    <table border="1px solid black">
        <tr>
            <th>ID</th>
            <th>Item</th>
            <th>Student ID</th>
            <th>Floor</th>
            <th>Place</th>
            <th>Report Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

<%
        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("report_id") %></td>
            <td><%= rs.getString("item") %></td>
            <td><%= rs.getString("reporter_id") %></td>
            <td><%= rs.getString("floor_no") %></td>
            <td><%= rs.getString("specific_place") %></td>
            <td><%= rs.getDate("report_date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
                <a class="button approve" href="report_admin.jsp?action=Approved&report_id=<%= rs.getInt("report_id") %>">Approve</a>
                <a class="button reject" href="report_admin.jsp?action=Rejected&report_id=<%= rs.getInt("report_id") %>">Reject</a>
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
    <a href="dashboard1.jsp">Back to Dashboard</a>
    </center>
</body>
</html>
