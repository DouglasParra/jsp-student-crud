<%-- 
    Document   : index
    Created on : 28/09/2020, 14:52:20
    Author     : douglas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit") != null)
    {
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
        pst = con.prepareStatement("INSERT INTO records(stname, course, fee) VALUES (?,?,?)");
        
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        
        pst.executeUpdate();
        
        %>
        
        <script>
            alert("Record Added")
        </script>
        
    <%
        
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <h1 class="ml-5 mt-5">Student Registration System CRUD</h1>
        <br/>
        
        <div class="row">
            <div class="col-sm-4 ml-5 mr-5">
                <form method="POST" action="#">
                    <div align="left">
                        <label class="form-label">Student Name </label>
                        <input type="text" class="form-control" placeholder="Student Name" name="sname" id="sname" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required>
                    </div>
                    
                    <div align="left">
                        <label class="form-label">Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required>
                    </div>
                    
                    <br />
                    
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                </form>
            </div>
            
            <div class="col-sm-7 mt-2">
                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Course</th>
                                <th>Fee</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");        
                                con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_student", "root", "");
                                
                                String query = "SELECT * FROM records";
                                Statement st = con.createStatement();
                                
                                rs = st.executeQuery(query);
                                
                                while(rs.next()){
                                    String id = rs.getString("id");
                                    
                            %>
                            
                            <tr>
                                <td><%= rs.getString("stname") %></td>
                                <td><%= rs.getString("course") %></td>
                                <td><%= rs.getString("fee") %></td>
                                <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                            </tr>
                            
                            <%
                                }
                            %>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
        
    </body>
</html>
