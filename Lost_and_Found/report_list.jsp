<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Report List</title>
</head>
<body>
<h2>Reports List</h2>
<table border="1">
<tr>
    <th>Report ID</th>
    <th>Item</th>
    <th>Action</th>
</tr>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe",
            "c##lostfound",
            "lostfound"
        );

        ps = conn.prepareStatement("SELECT report_id, item FROM report");
        rs = ps.executeQuery();
        while(rs.next()){
%>
<tr>
    <td><%= rs.getInt("report_id") %></td>
    <td><%= rs.getString("item") %></td>
    <td><a href="contact.html?report_id=<%= rs.getInt("report_id") %>">Contact</a></td>
</tr>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e){}
        try { if(ps != null) ps.close(); } catch(Exception e){}
        try { if(conn != null) conn.close(); } catch(Exception e){}
    }
%>
</table>
</body>
</html>
