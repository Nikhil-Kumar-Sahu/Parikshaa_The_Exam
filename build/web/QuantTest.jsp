<%-- 
    Document   : QunatTest
    Created on : 8 May, 2016, 1:06:17 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Aptitude Test</title>
        <style>
            #page{
                float: left ;
                border: 5px solid slategray;
                margin: 25px;
                padding: 50px;  
                width: 1000px;
                
            }    
            
            #pallete{
             
            margin-top: 20px;
            line-height:10px;
            background-color:#eeeeee;
            height:350px;
            width:100px;
            float:left;
            padding:5px;	      
            }
            
            #bottomleft{
            
            float: end;
            padding:5px;
            float: left;
            
            }

            
            #bottomend{
            
            float: end;
            padding:5px;
            float: right;
            
            }
            
        </style>
        
    </head>
    <body>
        <br>
        <div id = "Head" align = "center" style="background: slategray; padding: 8px; color: blanchedalmond"><b>Quant Mock Test Paper</b></div>
        
        <p align = "right" id ="timer"></p>
        <div id = "pallete">
            <br>
            Jump To <br><br> Question <br><br>
            <button type ="button" id = "1" name="nquestion" onClick = "navigateQuestion(this.id)">01</button>
            <button type ="button" id = "2" name="nquestion" onClick = "navigateQuestion(this.id)">02</button>
            <button type ="button" id = "3" name="nquestion" onClick = "navigateQuestion(this.id)">03</button><br><br>
            <button type ="button" id = "4" name="nquestion" onClick = "navigateQuestion(this.id)">04</button>
            <button type ="button" id = "5" name="nquestion" onClick = "navigateQuestion(this.id)">05</button>
            <button type ="button" id = "6" name="nquestion" onClick = "navigateQuestion(this.id)">06</button><br><br>
            <button type ="button" id = "7" name="nquestion" onClick = "navigateQuestion(this.id)">07</button>
            <button type ="button" id = "8" name="nquestion" onClick = "navigateQuestion(this.id)">08</button>
            <button type ="button" id = "9" name="nquestion" onClick = "navigateQuestion(this.id)">09</button><br><br>
            <button type ="button" id = "10" name="nquestion" onClick = "navigateQuestion(this.id)">10</button>
            <button type ="button" id = "11" name="nquestion" onClick = "navigateQuestion(this.id)">11</button>
            <button type ="button" id = "12" name="nquestion" onClick = "navigateQuestion(this.id)">12</button><br><br>
            <button type ="button" id = "13" name="nquestion" onClick = "navigateQuestion(this.id)">13</button>
            <button type ="button" id = "14" name="nquestion" onClick = "navigateQuestion(this.id)">14</button>
            <button type ="button" id = "15" name="nquestion" onClick = "navigateQuestion(this.id)">15</button><br><br>
            <button type ="button" id = "16" name="nquestion" onClick = "navigateQuestion(this.id)">16</button>
            <button type ="button" id = "17" name="nquestion" onClick = "navigateQuestion(this.id)">17</button>
            <button type ="button" id = "18" name="nquestion" onClick = "navigateQuestion(this.id)">18</button><br><br>
            <button type ="button" id = "19" name="nquestion" onClick = "navigateQuestion(this.id)">19</button>
            <button type ="button" id = "20" name="nquestion" onClick = "navigateQuestion(this.id)">20</button>
            <!--<button type ="button" id = "21" name="nquestion" onClick = "navigateQuestion(this.id)">21</button><br><br>
            <button type ="button" id = "22" name="nquestion" onClick = "navigateQuestion(this.id)">22</button>
            <button type ="button" id = "23" name="nquestion" onClick = "navigateQuestion(this.id)">23</button>
            <button type ="button" id = "24" name="nquestion" onClick = "navigateQuestion(this.id)">24</button><br><br>
            <button type ="button" id = "25" name="nquestion" onClick = "navigateQuestion(this.id)">25</button>
            <button type ="button" id = "26" name="nquestion" onClick = "navigateQuestion(this.id)">26</button>
            <button type ="button" id = "27" name="nquestion" onClick = "navigateQuestion(this.id)">27</button><br><br>
            <button type ="button" id = "28" name="nquestion" onClick = "navigateQuestion(this.id)">28</button>
            <button type ="button" id = "29" name="nquestion" onClick = "navigateQuestion(this.id)">29</button>
            <button type ="button" id = "30" name="nquestion" onClick = "navigateQuestion(this.id)">30</button><br><br>-->


            
        </div>
        
        
        <div id = "page">
            <div id = "question"></div><br><br>
            <div id = "option1"></div><br>
            <div id = "option2"></div><br>
            <div id = "option3"></div><br>
            <div id = "option4"></div><br>
            <br>
            <div id = "msg" style="color: red"></div><br>
            <div id = "buttons"></div>
        </div>
        
        <div id = "submittest"></div>

        
        
        <h3 id ="bottomend" align = "center"> Click here to End the Quiz <br><br>
            <button type = "button" onClick = "endQuiz()">End Quiz</button> </h3>
        
            <div id = "bottomleft"><b><I>Colors of Question in Navigation Pane will change as below-
                <br><br><button type="button" style="background-color: chartreuse">Submitted</button>&nbsp;
                <button type="button" style="background-color: yellow">Skipped</button>&nbsp;
                <button type="button" style="background-color: turquoise">Review Later</button>
                </div>
        
        <script>

            // First Question
            var response = "";
            var sec = 60;
            var min = 29;
            var question = 0;
            var answer = -1;
            setInterval(timer,1000);

            function timer()
            {
                document.getElementById("timer").innerHTML = "<b>"+min+ " minutes : "+sec+" seconds</b>";
                sec--;
                if(sec<0)
                {
                    min--;
                    sec = 59;
                }
                
                if(sec==0&&min==0)
                {
                    window.location.href = "GetQresult.jsp";
                }
            }
  
  
  
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function (){
             if(xhttp.readyState == 4 && xhttp.status == 200)
             {
                 response = xhttp.responseText;
                 var data = response.split("|||");
              
                 
                 document.getElementById("question").innerHTML = question+1+". "+data[0];
                 document.getElementById("option1").innerHTML = '<input type = "radio" name = "option" value = "1">'+data[1];
                 document.getElementById("option2").innerHTML = '<input type = "radio" name = "option" value = "2">'+data[2];
                 document.getElementById("option3").innerHTML = '<input type = "radio" name = "option" value = "3">'+data[3];
                 document.getElementById("option4").innerHTML = '<input type = "radio" name = "option" value = "4">'+data[4];
                
                 question++;
                 
                 showButton();
                 
             }
             
             };
             var param = "qno="+question+"&answer="+answer;
             xhttp.open("POST","FetchQuestion",true);
             xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
             xhttp.send(param);
             
             // First Question code ends here
             
             
             //Showing the buttons when the Question is loaded
             function showButton()
             {
                 document.getElementById("buttons").innerHTML = '<button type="button" id = "submit" onClick = "submitAnswer()" >Submit</button> &nbsp;&nbsp;'+
                '<button type="button" id="skip" onClick="skipQuestion()">Skip</button>&nbsp;&nbsp;'+
                '<button type="button" id="skip" onClick="reviewLater()">Review Later</button>';
             }
             
             // Submitting the answer and fetching the next question
             function submitAnswer(){
                 var xmlhttp = new XMLHttpRequest();
                 var option = document.getElementsByName("option");
                 var i =0;
                 
                document.getElementById(question).setAttribute("style", "background-color: chartreuse");
                 
                 if((option[0].checked == true) || (option[1].checked == true) || (option[2].checked == true) || (option[3].checked == true))
                 {
                     document.getElementById("msg").innerHTML = "";
                     
                 }
                 else
                 {
                     document.getElementById("msg").innerHTML = "Please select an option before submitting or else press skip for next Quesion";
                     return false;
                 }
                 
                 for(;i<4;i++)
                 {
                    if(option[i].checked == true) 
                    {
                        i++;
                        break;
                    }
                 }

                 // If the end of quiz is reached (21st Question), redirect to question# 1
                 if(question==20)
                 {
                     navigateQuestion(1);
                     return false;
                 }
                 xmlhttp.onreadystatechange = function(){
                     if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
                     {
                        response = xmlhttp.responseText;
                        var data = response.split("|||");
              
                 
                        document.getElementById("question").innerHTML = question+1+". "+data[0];
                        document.getElementById("option1").innerHTML = '<input type = "radio" name = "option" value = "1">'+data[1];
                        document.getElementById("option2").innerHTML = '<input type = "radio" name = "option" value = "2">'+data[2];
                        document.getElementById("option3").innerHTML = '<input type = "radio" name = "option" value = "3">'+data[3];
                        document.getElementById("option4").innerHTML = '<input type = "radio" name = "option" value = "4">'+data[4];
                
                        if(data[5]==0)
                        {}
                        else
                        {
                            document.getElementsByName("option")[(data[5]-1)].checked = true;
                        }
                
                        
                
                        question++;
                        showButton();
                        
                            
                      }
                     
                 };
                 
                 var param = "qno="+question+"&answer="+i;
                 xmlhttp.open("POST","FetchQuestion",true);
                 xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                 xmlhttp.send(param);
                 
                 
                 
             }
             // Submit question ends here
             
             
             function skipQuestion(){
                 document.getElementById("msg").innerHTML = "";
                 answer = 0;
                 var param = "qno="+question+"&answer="+answer;
                 var xmhttp = new XMLHttpRequest();
                 
                 document.getElementById(question).setAttribute("style", "background-color: yellow");

                 // If the end of quiz is reached (21st Question), redirect to question# 1
                 if(question==20)
                 {
                     navigateQuestion(1);
                     return false;
                 }
                 
                 xmhttp.onreadystatechange = function()
                 {
                     
                     if(xmhttp.readyState == 4 && xmhttp.status == 200)
                     {
                     var text = xmhttp.responseText;
                     var data = text.split("|||");
                        document.getElementById("question").innerHTML = question+1+". "+data[0];
                        document.getElementById("option1").innerHTML = '<input type = "radio" name = "option" value = "1">'+data[1];
                        document.getElementById("option2").innerHTML = '<input type = "radio" name = "option" value = "2">'+data[2];
                        document.getElementById("option3").innerHTML = '<input type = "radio" name = "option" value = "3">'+data[3];
                        document.getElementById("option4").innerHTML = '<input type = "radio" name = "option" value = "4">'+data[4];
 
                        if(data[5]==0)
                        {}
                        else
                        {
                            document.getElementsByName("option")[(data[5]-1)].checked = true;
                        }


                        question++;  
                        showButton();
                        
                        

                        
                        }
        
                 };
                 
                 xmhttp.open("POST", "FetchQuestion", true);
                 xmhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                 xmhttp.send(param);

                 
             }
             
             function submitTest()
             {
                 document.getElementById("msg").innerHTML = "No more questions to show";
                 document.getElementById("page").innerHTML = "";
                 document.getElementById("bottomend").innerHTML = "";
                 document.getElementById("submittest").innerHTML = '<h3 id ="bottomend" align = "center"> Click here to End the Quiz <br><br>'+
                                                                '<button type = "button" onClick = "endQuiz()">End Quiz</button> </h3>';
             }
             
             function navigateQuestion(qr)
             {
                 document.getElementById("msg").innerHTML = "";
                 var q = Number(qr);
                 
                 var ans = 100;      // flag to identify at the servlet that a navigation is requested
                 var xmh = new XMLHttpRequest();
                 var param = "qno="+q+"&answer="+ans;
                 
                 xmh.onreadystatechange = function (){
                     
                     if(xmh.readyState == 4 && xmh.status == 200)
                     {
                         
                        
                        var text = xmh.responseText;
                        var data = text.split("|||");
                        
                        document.getElementById("question").innerHTML = q+". "+data[0];
                        document.getElementById("option1").innerHTML = '<input type = "radio" name = "option" value = "1">'+data[1];
                        document.getElementById("option2").innerHTML = '<input type = "radio" name = "option" value = "2">'+data[2];
                        document.getElementById("option3").innerHTML = '<input type = "radio" name = "option" value = "3">'+data[3];
                        document.getElementById("option4").innerHTML = '<input type = "radio" name = "option" value = "4">'+data[4];
                        
                        //document.write(data[5]);
                        if(data[5]==0)
                        {
                            
                        }
                        else{
                        document.getElementsByName("option")[(data[5]-1)].checked = true;
                            }
                        
                        question = Number(q);
                
                        showButton();                         
                         
                     }
                     
                 };
                 
                 xmh.open("POST","FetchQuestion",true);
                 xmh.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                 xmh.send(param);                
                 
             }
             
             
             function reviewLater()
             {
                 skipQuestion();
                 document.getElementById(question).setAttribute("style", "background-color: turquoise");
             }
             
             function endQuiz()
             {

                     window.location.href = "GetQresult.jsp";
             }
         
        </script>
        
        
    </body>
</html>
