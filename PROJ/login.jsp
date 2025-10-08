<%@ page import="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

boolean isValid = false;
String userType = "";

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

    PreparedStatement ps = conn.prepareStatement("SELECT user_type FROM Users WHERE user_name = ? AND user_password = ?");
    ps.setString(1, username);
    ps.setString(2, password);

    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        isValid = true;
        userType = rs.getString("user_type");
    }

    rs.close();
    ps.close();
    conn.close();
} catch (Exception e) {
    out.println("Database error: " + e.getMessage());
}

if (isValid) {
    session.setAttribute("username", username);
    if (userType.equalsIgnoreCase("Admin")) {
        response.sendRedirect("dashboard1.jsp");
    } else {
        response.sendRedirect("dashboard2.jsp");
    }
} else {
    out.println("<script>alert('Login Failed! Invalid username or password.'); window.location='login.html';</script>");
}
%>
