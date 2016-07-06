<%@page import="java.sql.*"%>
<%@page import="JavaFile.Jconnect" %>
<%-- 
    Document   : GetQresult
    Created on : 2 Jun, 2016, 5:21:24 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
<h2><div id = "Head" align = "center" style="background: slategray; padding: 8px; color: blanchedalmond"><b>Result</b></div></h2>

<%
try{
    int correct=0, wrong =0, all=0;
Connection con = Jconnect.connect();

PreparedStatement ps = con.prepareStatement("select sum(marks) from student_answer");
ResultSet rs = ps.executeQuery();

if(rs.next())
{
%>

<br><br>
<h2><div id = "Head" align = "center" style="color: slategrey">Your Total Score Out Of 60 is <b><%out.print(rs.getString(1));%></b></div></h2>

<%
}
ps = con.prepareStatement("select count(marks) from student_answer where marks<>0");
rs = ps.executeQuery();
%>

<ul>
<%
if(rs.next())
{
    all =Integer.parseInt(rs.getString(1));
%>

<br><br>
<h3><div style="color: slategrey"><li>Out of 20, Total Number of Questions Attempted are <b><%out.print(rs.getString(1));%></b></li></div></h3>

<%
}

ps = con.prepareStatement("select count(marks) from student_answer where marks=3");
rs = ps.executeQuery();

if(rs.next())
{
correct = Integer.parseInt(rs.getString(1));
%>

<h3><div style="color: slategrey"><li>Out of <%=all%>, Total Number of Questions Attempted Correctly are <b><%out.print(rs.getString(1));%></b></li></div></h3>

<%
}
ps = con.prepareStatement("select count(marks) from student_answer where marks=-1");
rs = ps.executeQuery();

if(rs.next())
{
wrong = Integer.parseInt(rs.getString(1));
%>

<h3><div style="color: slategrey"><li>Out of <%=all%>, Total Number of Incorrect Questions Attempted Incorrectly are <b><%out.print(rs.getString(1));%></b></li></div></h3>

<%
}


}catch(Exception e)
{
out.print(e);
}
%>
</ul>
<br><br>
<div align="center"><button type="button" onClick = "navigate()">Review Paper</button></div>


<script>
    function navigate()
    {
        window.location.href = "Review.jsp"
    }
</script>
    </body>
</html>
