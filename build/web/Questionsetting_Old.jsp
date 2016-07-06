<%@page import="JavaFile.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Setting</title>
    </head>
    <body style="font-family: Arial">

        <h2  align = "center" style=" background: slategray ; color: blanchedalmond"><p id = "response"></p></h2>
        <h2 id="header" align = "center" style=" background: slategray; color: blanchedalmond">Enter Question number <p id="qno"></p  ></h2>
        
                <%
                if(CheckUser.qcount==30)
                {%>
                
                This is the last Question of the Quants Section
                <%
                }
                %>
                <h3 align = "center" style="  color: blanchedalmond">

                <textarea id="quest" required style="font-family: cursive" rows="8" cols="100" name="question" placeholder="Type the Question"></textarea><br><br>
                
                Enter options <br><br>
                Option 1&nbsp;<textarea required style="font-family: cursive" rows="1" cols="50" name="option1" id="option1" placeholder="First Option"></textarea><br><br>
                Option 2&nbsp;<textarea required style="font-family: cursive" rows="1" cols="50" name="option2" id="option2" placeholder="Second Option"></textarea><br><br>
                Option 3&nbsp;<textarea required style="font-family: cursive" rows="1" cols="50" name="option3" id="option3" placeholder="Third Option"></textarea><br><br>
                Option 4&nbsp;<textarea required style="font-family: cursive" rows="1" cols="50" name="option4" id="option4" placeholder="Fourth Option"></textarea><br><br>                
                
                Correct Option &nbsp; &nbsp; <input type="radio"  id="answer1"  name="answer" value="1">1
                &nbsp; &nbsp;<input type="radio" name="answer" id="answer2" value="2">2
                &nbsp; &nbsp;<input type="radio" name="answer" id="answer3" value="3">3
                &nbsp; &nbsp;<input type="radio" name="answer" id="answer4" value="4">4
                <br><br>
                 Enter Solution&nbsp; &nbsp;<br><br><textarea id="solution" required style="font-family: cursive" rows="8" cols="100" name="solution" placeholder="Enter Solution"></textarea><br><br>

                
                
                <input type="button" style=" " onClick="submitQuestion()" value="Submit Question">
             
                </h3>
        
    <script> 
        var qno =1;
        function submitQuestion()
        {
            
            var answer = "";
                if(document.getElementById("answer1").checked)
                {   answer = document.getElementById("answer1").value;  }
                if(document.getElementById("answer2").checked)
                {   answer = document.getElementById("answer2").value;  }
                if(document.getElementById("answer3").checked)
                {   answer = document.getElementById("answer3").value;  }
                if(document.getElementById("answer4").checked)
                {   answer = document.getElementById("answer4").value; 
                   }
                
                
                
                var xhttp = new XMLHttpRequest();
                /*var url = "SavePaper?question="+document.getElementById("quest").value
                            +"&option1="+document.getElementById("option1").value
                            +"&option2="+document.getElementById("option2").value
                            +"&option3="+document.getElementById("option3").value
                            +"&option4="+document.getElementById("option4").value
                            +"&answer="+answer;
                */
               var param =  "question="+document.getElementById("quest").value
                            +"&option1="+document.getElementById("option1").value
                            +"&option2="+document.getElementById("option2").value
                            +"&option3="+document.getElementById("option3").value
                            +"&option4="+document.getElementById("option4").value
                            +"&answer="+answer
                            +"&solution="+document.getElementById("solution").value;
                    
                xhttp.onreadystatechange = function ()
                {
                    
                    if(xhttp.readyState == 4 && xhttp.status == 200)
                    {
                        //document.write(x);
                       // document.getElementById("response").innerHTML = "Previous Question Submitted Successfully";
                        if(xhttp.responseText.trim() === "yes")
                        {
                            document.getElementById("response").innerHTML = "Question uploaded!";
                            document.getElementById("quest").value="";
                            document.getElementById("option1").value="";
                            document.getElementById("option2").value="";
                            document.getElementById("option3").value="";
                            document.getElementById("option4").value="";
                            document.getElementById("solution").value="";
                            document.getElementsByName("answer").checked = false;
                            qno++;
                            document.getElementById("header").innerHTML = "Enter Question Number "+qno;
                        }
                        else
                        {
                            
                            document.getElementById("response").innerHTML = "Question Couldn't be uploaded !! Try again..";
                            
                        }
                                                   
                    }
    
                };
                
                xhttp.open("POST","SavePaper",true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send(param); 
        
                /*   xhttp.open("GET",url,true);
                   xhttp.send();*/
        }
    </script>
                
    </body>
</html>
