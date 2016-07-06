
<%--

    Document   : test
    Created on : 3 May, 2016, 1:03:41 AM
    Author    : hp
--%>
<%@page import="JavaFile.Jconnect" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
        int str = Integer.parseInt(request.getParameter("id"));
        Jconnect j = new Jconnect();
        Connection con = j.connect();
        
        PreparedStatement ps = con.prepareStatement("select * from student where id = ?");
        ps.setInt(1, str);
        
        ResultSet rs = ps.executeQuery();
        String name = "";
        if(rs.next())
        name = rs.getString("name"); 
        
        %>
        <h1 align = "center" style="font-family: cursive">Well Hello <%=name%></h1>
        <%
            con.close();
            }catch(Exception e){
            out.print(e);
            }
        %>
        
        
    </body>
</html>
