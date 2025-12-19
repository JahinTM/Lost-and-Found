<%@ page import="java.sql.*" %>

<%
    String student_id = request.getParameter("student_id");
    String contact_number = request.getParameter("contact_number");
    String details = request.getParameter("details");

    if(student_id != null && contact_number != null && details != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "c##lostfound", "lostfound");

            // 1. Validate student_id exists in Users table
            ps = conn.prepareStatement("SELECT user_id FROM Users WHERE std_id = ?");
            ps.setString(1, student_id);
            rs = ps.executeQuery();

            if(rs.next()) {
                int userId = rs.getInt("user_id");

                // 2. Insert into ContactMessages with auto report_id using sequence
                ps.close();
                String insertSQL = "INSERT INTO ContactMessages(report_id, student_id, contact_number, details) " +
                                   "VALUES (contact_seq.NEXTVAL, ?, ?, ?)";
                ps = conn.prepareStatement(insertSQL);
                ps.setString(1, student_id);
                ps.setString(2, contact_number);
                ps.setString(3, details);

                int i = ps.executeUpdate();
                if(i > 0){
                    out.println("<h3>Message sent successfully!</h3>");
                } else {
                    out.println("<h3>Error sending message.</h3>");
                }
            } else {
                out.println("<h3>Invalid Student ID. Please enter a valid one.</h3>");
            }

        } catch(Exception e){
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e){}
            try { if(ps != null) ps.close(); } catch(Exception e){}
            try { if(conn != null) conn.close(); } catch(Exception e){}
        }
    } else {
        out.println("<h3>All fields are required!</h3>");
    }
%>
<a href="contact.html">Back to Contact Form</a>
<link rel="stylesheet" href="css/contact.css">
