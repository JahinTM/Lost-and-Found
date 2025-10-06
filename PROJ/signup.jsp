<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String stdid = request.getParameter("stdid");
    String password = request.getParameter("password");
    String usertype = request.getParameter("usertype");

    Connection conn = null;
    PreparedStatement ps = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

        ps = conn.prepareStatement(
            "INSERT INTO Users (user_name, std_id, user_type) VALUES (?, ?, ?)"
        );

        ps.setString(1, username);
        ps.setString(2, password);   
        ps.setString(3, usertype);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            out.println("<h2>Account created successfully!</h2>");
            out.println("<a href='login.html'>Go to Login</a>");
        } else {
            out.println("<h2>Signup failed. Try again.</h2>");
        }

        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
