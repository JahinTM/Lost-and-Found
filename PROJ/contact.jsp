<%@ page import="java.sql.*" %>
<%
    String report_id = request.getParameter("report_id");
    String student_id = request.getParameter("student_id");
    String contact_number = request.getParameter("contact_number");
    String details = request.getParameter("details");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

        String sql = "INSERT INTO ContactMessages (report_id, student_id, contact_number, details) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(report_id));
        ps.setString(2, student_id);
        ps.setString(3, contact_number);
        ps.setString(4, details);

        int rows = ps.executeUpdate();

        if(rows > 0) {
            out.println("<h3>Message sent successfully!</h3>");
            out.println("<a href='contact.html'>Send Another Message</a>");
        } else {
            out.println("<h3>Failed to send message. Please try again.</h3>");
        }

        ps.close();
        conn.close();
    } catch(Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
