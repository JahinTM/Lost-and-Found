<%@ page import="java.sql.*" %>
<%
    String item = request.getParameter("item");
    String reporter_id = request.getParameter("reporter_id");
    String floor_no = request.getParameter("floor_no");
    String specific_place = request.getParameter("specific_place");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Load Oracle driver and connect
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:xe", "c##sujana", "sujana123");

        // Insert report into single table
        String sql = "INSERT INTO Report (item, reporter_id, floor_no, specific_place) VALUES (?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, item);
        ps.setString(2, reporter_id);
        ps.setString(3, floor_no);
        ps.setString(4, specific_place);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            out.println("<h2>Lost item report submitted successfully!</h2>");
            out.println("<a href='report.html'>Submit Another Report</a>");
        } else {
            out.println("<h2>Failed to submit the report. Please try again.</h2>");
        }

        ps.close();
        conn.close();

    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }
%>
