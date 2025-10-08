<%@ page import="java.sql.*" %>
<%
    String action = request.getParameter("action");
    String message_id = request.getParameter("message_id");

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

        // Handle status update
        if(action != null && message_id != null) {
            String sqlUpdate = "UPDATE ContactMessages SET status='Reviewed' WHERE message_id=?";
            ps = conn.prepareStatement(sqlUpdate);
            ps.setInt(1, Integer.parseInt(message_id));
            ps.executeUpdate();
            ps.close();
        }

        // Fetch all messages
        String sql = "SELECT message_id, report_id, student_id, contact_number, details, message_date, status FROM ContactMessages ORDER BY message_date DESC";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Contact Messages</title>

</head>
<body>
<center>
    <h2>All Contact Messages</h2>
    <table border = "1px solid black">
        <tr>
            <th>ID</th>
            <th>Report ID</th>
            <th>Student ID</th>
            <th>Contact Number</th>
            <th>Details</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
<%
        while(rs.next()) {
%>
        <tr>
            <td><%= rs.getInt("message_id") %></td>
            <td><%= rs.getInt("report_id") %></td>
            <td><%= rs.getString("student_id") %></td>
            <td><%= rs.getString("contact_number") %></td>
            <td><%= rs.getString("details") %></td>
            <td><%= rs.getDate("message_date") %></td>
            <td><%= rs.getString("status") %></td>
            <td>
<%
            if(!"Reviewed".equals(rs.getString("status"))) {
%>
                <a class="button" href="contact_admin.jsp?action=Reviewed&message_id=<%= rs.getInt("message_id") %>">Mark Reviewed</a>
<%
            } else {
                out.print("-");
            }
%>
            </td>
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
    <br>
    <a href="dashboard1.jsp"> Back to Dashboard</a>
</center>

</body>
</html>
