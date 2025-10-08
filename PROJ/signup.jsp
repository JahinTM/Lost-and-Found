<%@ page import="java.sql.*" %>
<%
    // Get data from form fields
    String username = request.getParameter("username");
    String stdid = request.getParameter("stdid");
    String password = request.getParameter("password");
    String usertype = request.getParameter("usertype");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Load Oracle driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Connect to Oracle database
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

        // ✅ Insert into USERS table using your sequence
        String sql = "INSERT INTO USERS (USER_ID, USER_NAME, STD_ID, USER_TYPE, USER_PASSWORD) " +
                     "VALUES (user_seq.NEXTVAL, ?, ?, ?, ?)";

        ps = conn.prepareStatement(sql);

        // Set values from form
        ps.setString(1, username);
        ps.setString(2, stdid);
        ps.setString(3, usertype);
        ps.setString(4, password);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<h2>Account created successfully!</h2>");
            out.println("<a href='login.html'>Go to Login</a>");
        } else {
            out.println("<h2>Signup failed. Try again.</h2>");
        }

        ps.close();
        conn.close();

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
