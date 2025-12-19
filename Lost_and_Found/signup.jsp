<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Result</title>
    <link rel="stylesheet" href="css/result.css">
</head>
<body>

<div class="result-box">
<%
    String username = request.getParameter("username");
    String stdid = request.getParameter("stdid");
    String password = request.getParameter("password");
    String usertype = request.getParameter("usertype");

    if(username != null && stdid != null && password != null && usertype != null) {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");

            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe",
                "c##lostfound",
                "lostfound"
            );

            String sql = "INSERT INTO USERS (USER_ID, USER_NAME, STD_ID, USER_TYPE, USER_PASSWORD) VALUES (user_seq.NEXTVAL, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, stdid);
            ps.setString(3, usertype);
            ps.setString(4, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
%>
                <h2 class="success">Account created successfully!</h2>
                <a href="login.html" class="btn">Go to Login</a>
<%
            } else {
%>
                <h2 class="error">Signup failed. Try again.</h2>
                <a href="signup.html" class="btn">Back to Signup</a>
<%
            }

            ps.close();
            conn.close();

        } catch (ClassNotFoundException e) {
%>
            <h2 class="error">Oracle JDBC Driver not found!</h2>
            <pre><%= e.getMessage() %></pre>
<%
        } catch (SQLException e) {
%>
            <h2 class="error">Database Error!</h2>
            <pre><%= e.getMessage() %></pre>
<%
        } catch (Exception e) {
%>
            <h2 class="error">Unexpected Error!</h2>
            <pre><%= e.getMessage() %></pre>
<%
        }
    } else {
%>
        <h2 class="error">Please fill all fields!</h2>
        <a href="signup.html" class="btn">Go Back</a>
<%
    }
%>
</div>

<script src="js/result.js"></script>
</body>
</html>
