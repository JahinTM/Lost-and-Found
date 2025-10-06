<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    String userType = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");


        PreparedStatement ps = conn.prepareStatement(
            "SELECT user_type FROM USERS WHERE user_name = ? AND user_password = ?");

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            userType = rs.getString("user_type");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (userType != null) {
        session.setAttribute("username", username);
        session.setAttribute("userType", userType);

        if (userType.equalsIgnoreCase("Admin")) {
            response.sendRedirect("dashboard1.jsp");
        } else {
            response.sendRedirect("dashboard2.jsp");
        }
    } else {
        out.println("<h2>Login Failed!</h2>");
        out.println("<p>Invalid username or password.</p>");
        out.println("<a href='login.html'>Try Again</a>");
    }
%>
