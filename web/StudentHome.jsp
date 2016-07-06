<%-- 
    Document   : StudentHome
    Created on : 1 May, 2016, 6:55:32 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student's Home</title>
    </head>
    <body style="font-family: Arial">
        
        <%
            String name = (String)session.getAttribute("name");
        
        %>
        <div style = "background-color: slategray"><h3 align = "left" style=" padding: 15px; color: blanchedalmond">Welcome <%=name%>,</h3></div>
       <h3 id="div1" align = "center" style=" padding: 7px; background-color: slategray; color: blanchedalmond">Please Select the section for which you want to give test</h3>

    <br><br>
    
    <h3 align = "center" style="  color: darkslategrey">
        <div id = "instr">
            
        <input type="radio" id = "q" name = "test" value="quants">Quants<br><br>
        <input type="radio" id = "v" name = "test" value="quants">Verbal<br><br>
        <input type="radio" id = "d" name = "test" value="quants">DI/LR<br><br>   
        <div id="message" style="color: red"></div><br>
        <button type = "button"  style="  color: darkslategrey; font-size: medium" onClick="test()" >Let's Begin</button>
        </div>
    </h3>
    
    <div id = "startTest" ></div>
    
    <script>
        var tvar;
        function test()
        {
            
                if(document.getElementById("q").checked)
                tvar = 'q';
            
                else if(document.getElementById("v").checked)
                tvar = 'v';
                    
                else if(document.getElementById("d").checked)
                tvar = 'd';
            
                else
                {
                    document.getElementById("message").innerHTML = "Please Select a Section to Begin the Test";
                    return false;
                }

            
            document.getElementById("instr").setAttribute("align","left");
            document.getElementById("div1").innerHTML = "Here's a Heads Up";
                var instructions = "1. There are 20 questions in the Test.<br>2. You will get 3 Marks for each correct answer."+
                                       "<br>3. 1 mark will be <b>DEDUCTED</b> for each wrong answer."+
                                       "<br>4. Do not press back key or Refresh Key."+
                                       '<br><br>"All The Best"';
            document.getElementById("instr").innerHTML = instructions;
            document.getElementById("startTest").innerHTML = '<button type="button" style="  color: darkslategrey" onClick="fetchTest(tvar)">Got it Dude</button>';
        }
    
        function fetchTest(tvar1)
        {
            
            
                if(tvar1 == "q")
                window.location.href = "QuantTest.jsp";
            
                if(tvar1 == "v")
                window.location.href = "VerbalTest.jsp";
                    
                if(tvar1 == "d")
                window.location.href = "DILRTest.jsp";
            
                
        }
    </script>
    </body>
</html>
