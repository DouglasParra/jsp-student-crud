<%-- 
    Document   : update
    Created on : 28/09/2020, 16:51:17
    Author     : douglas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit") != null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        // ?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
        // SET GLOBAL time_zone = '+3:00';
        
        Class.forName("com.mysql.jdbc.Driver");        
        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_student", "root", "");
        pst = con.prepareStatement("UPDATE records SET stname = ?, course = ?, fee = ? WHERE id = ?");
        
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        
        pst.executeUpdate();
        
        %>
        
        <script>
            alert("Record Updated")
            window.location.href = "index.jsp";
        </script>
        
    <%
        
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 class="ml-5 mt-5">Update Student Data</h1>
        
        <div class="row">
            <div class="col-sm-4 ml-5 mt-2">
                <form method="POST" action="#">
                    
                    <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");        
                        con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_student", "root", "");

                        String id = request.getParameter("id");
                        
                        pst = con.prepareStatement("SELECT * FROM records WHERE id = ?");
                        pst.setString(1, id);
                        
                        rs = pst.executeQuery();
                        
                        while(rs.next()){
                    %>
                    
                    <div align="left">
                        <label class="form-label">Student Name </label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("stname") %>" name="sname" id="sname" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Course </label>
                        <input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course") %>" name="course" id="course" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%= rs.getString("fee") %>" name="fee" id="fee" required>
                    </div>
                    
                    <%
                        }
                    %>
                    
                    <br />
                    
                    <div align="left">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                    
                    <div align="right">
                        <p><a href="index.jsp">Back</a></p>
                    </div>
                    
                </form>
            </div>
        
    </body>
</html>
