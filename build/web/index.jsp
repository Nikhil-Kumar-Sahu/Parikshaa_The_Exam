<%-- 
    Document   : newjsp
    Created on : 29 Apr, 2016, 12:56:26 AM
    Author     : hp
--%>
<%@page import="javax.servlet.*" %>
<%@page import="JavaFile.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Online Exam</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="font-family: arial" >
        <style>
            #page{
                
                border: 5px solid slategray;
                margin: 25px;
                padding: 50px;  
                width: 300px;
                
            }    

            
        </style>
        
        <h1 align = "center" style="  background: slategray; color: blanchedalmond">Welcome to Online Exam portal</h1>
        <br><br><br><br><br><br><br>

        <div align="center">
        <h3 id = "page" style="color: slategray">
            
            <% 
            //CheckUser ob = new CheckUser();

            if(CheckUser.login==0)
            {
            %>
            
            Wrong Credentials !!! Please Login Again <br><br>
            <%}%>
            <form  align="center" action="CheckUser" method="post">
                Login ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" placeholder="User Name" required  name="id" ><br><br>
                Password&nbsp;&nbsp;<input type="password" placeholder ="Password" required  name="pwd" ><br><br>
                Login As <select name="role">
                    <option value="admin">Admin</option>
                    <option value="student" >Student</option>
                    </select><br><br>
                    <input type="submit" value="Login" >
            
            </form>
        </h3>
        </div>
    </body>
</html>
