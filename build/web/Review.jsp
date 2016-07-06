<%@page import="JavaFile.Jconnect" %>
<%@page import="java.sql.*" %>
<%-- 
    Document   : Review
    Created on : 7 Jun, 2016, 5:10:16 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Your Test</title>
    </head>
    <body>
        
        <h1 align = "center" style="font-family: cursive; background-color: slategray; color: blanchedalmond">Learn from your mistakes, it will make you stronger.</h1>
        <div style="font-family: sans-serif">
<%
try{
    int correct=0, wrong =0, all=0;
Connection con = Jconnect.connect();

PreparedStatement ps = con.prepareStatement("select * from quant");
ResultSet rs = ps.executeQuery();

PreparedStatement ps1 = con.prepareStatement("select * from student_answer");
ResultSet rs1 = ps1.executeQuery();

for(int i =1; i<21; i++)
{
    out.print("<br><hr><br>");
    if(rs.next()&&rs1.next())
    {
  
out.println(rs.getString("qno")+". "+rs.getString("question")+"\n");
%>
<br><br>
1.<% out.print(rs.getString("option1"));  %><br>
2.<% out.print(rs.getString("option2"));  %><br>
3.<% out.print(rs.getString("option3"));  %><br>
4.<% out.print(rs.getString("option4"));  %><br><br>

<b>Correct Answer is <%  out.println(rs.getString("answer"));  %></b><br>
<%
if(Integer.parseInt(rs1.getString("marks"))==0)
{
out.print("<b><div style=\"color: gold\">");    
out.print("You did not attempt this Question</div></b>");
}
else if(Integer.parseInt(rs1.getString("marks"))==3){
out.print("<b><div style=\"color: lawngreen\">"); 
out.print("You chose correct option "+rs1.getString("s_answer")+"</div></b>");
}
else if(Integer.parseInt(rs1.getString("marks"))==-1)
{
out.print("<b><div style=\"color: red\">"); 
out.print("You chose incorrect option "+rs1.getString("s_answer")+"</div></b>");

}

%>
<br><b><u>Solution: </u></b>
<%
out.print(rs.getString("solution"));
out.print("<br>");
    }


}
}catch(Exception e)
{
out.print(e);
}
%>
        </div> </body>
</html>
