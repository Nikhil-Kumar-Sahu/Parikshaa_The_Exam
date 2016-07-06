<%-- 
    Document   : Home
    Created on : 28 Apr, 2016, 12:49:37 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
    </head>
    <body background = "web.png">
        <h1 align = "center" style="font-family: cursive; color: blanchedalmond">Set the Question Paper</h1>
        <br><br><br><br><br><br><br>

        <h3 align = "center" style="font-family: cursive; color: blanchedalmond">
            Select the section for which you want to set the paper <br><br><br>
            
            <select id = "section" name = "section">
                <option value="quants">Quants</option>
                <option value="verbal">Verbal</option>
                <option value="dilr">DI/LR</option>               
            </select>
            <br><br>
            <button type="button" onclick="func()">Go</button>
            
            <script>
                function func()
                {
                    var sec = document.getElementById("section").value;
                    
                    if(sec == "quants")
                    {
                    var jspcall = "Quants.jsp";
                    window.location.href = jspcall;  
                    }
                    if(sec == "verbal")
                    {
                    var jspcall = "Quants.jsp";
                    window.location.href = jspcall;  
                    }
                }
            </script>
            
        </h3>
   </body>
</html>
