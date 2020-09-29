<%-- 
    Document   : delete
    Created on : 28/09/2020, 16:53:31
    Author     : douglas
--%>
<%@page import="java.sql.*" %>

<%
        String id = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");        
        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_student", "root", "");
        pst = con.prepareStatement("DELETE FROM records WHERE id = ?");
        
        pst.setString(1, id);
        
        pst.executeUpdate();
        
%>
        
        <script>
            alert("Record Deleted")
            window.location.href = "index.jsp";
        </script>
        