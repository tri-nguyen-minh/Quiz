<%-- 
    Document   : Student
    Created on : May 24, 2020, 7:02:56 PM
    Author     : TNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <header class="header">
            <div class="top">
                <div class="welcome">Do your best, ${sessionScope.USER.name}!</div>
                
            </div>
            <div class="head">
                <img src="img/Studentlogo.jpg" width="414" height="110">
            </div>
            <nav>
                <ul>
                    <li><b class="disabled">These options are disabled when taking a quiz</b></li>
                </ul>
            </nav>
        </header>
        <div class="main">
            <section class="user-main">
                <form action="QuizController" method="POST" id="questionForm">
                    <input type="hidden" name="questionCount" value="${requestScope.QUESTIONCOUNT}"/>
                    <input type="hidden" name="minute" id="minute"/>
                    <input type="hidden" name="second" id="second"/>
                    <div class="info">
                        <div class="info-left" style="height: 550px;  border-right-style: solid; border-right-width: 2px">
                            <h1 style="font-size: 25px">Question ${requestScope.QUESTIONCOUNT}</h1></br>
                            <d style="font-size: 20px">${requestScope.QUESTION.questionContent}</d></br></br>
                            <input style="font-size: 17px" type="radio" name="answer" ${(sessionScope.QUESTIONLIST[requestScope.QUESTIONCOUNT-1].answerCorrect eq requestScope.QUESTION.answerCorrect) ? 'checked="true"' :''} value="${requestScope.QUESTION.answerCorrect}"/>${requestScope.QUESTION.answerCorrect}</br></br>
                            <input style="font-size: 17px" type="radio" name="answer" ${(sessionScope.QUESTIONLIST[requestScope.QUESTIONCOUNT-1].answerCorrect eq requestScope.QUESTION.answerWrong1) ? 'checked="true"' :''} value="${requestScope.QUESTION.answerWrong1}"/>${requestScope.QUESTION.answerWrong1}</br></br>
                            <input style="font-size: 17px" type="radio" name="answer" ${(sessionScope.QUESTIONLIST[requestScope.QUESTIONCOUNT-1].answerCorrect eq requestScope.QUESTION.answerWrong2) ? 'checked="true"' :''} value="${requestScope.QUESTION.answerWrong2}"/>${requestScope.QUESTION.answerWrong2}</br></br>
                            <input style="font-size: 17px" type="radio" name="answer" ${(sessionScope.QUESTIONLIST[requestScope.QUESTIONCOUNT-1].answerCorrect eq requestScope.QUESTION.answerWrong3) ? 'checked="true"' :''} value="${requestScope.QUESTION.answerWrong3}"/>${requestScope.QUESTION.answerWrong3}</br></br></br>
                        
                        <c:if test="${requestScope.QUESTIONCOUNT != 1}">
                            <!--<div class="info-left">-->
                                <input style="width: 150px" type="submit" name="action" value="Previous Page" onclick="scriptSubmit()">
                            <!--</div>-->
                        </c:if>
                        <c:if test="${(requestScope.QUESTIONCOUNT != sessionScope.SUBJECT.questionCount)}">
                            <!--<div class="info-right">-->
                                <input style="width: 150px"  type="submit" name="action" value="Next Page" onclick="scriptSubmit()">
                            <!--</div>-->
                        </c:if>
                        
                        </div>
                        <div class="info-right" style="height: 550px; width: 400px; margin-left: 30px;">
                            <h1 style="font-size: 25px">Subject: ${sessionScope.SUBJECT.name}</h1></br>
                            <div id="countdown" style="font-size: 20px"></div>
                            <p style="font-size: 20px">Number of questions: ${sessionScope.SUBJECT.questionCount}</p>
                            <p style="font-size: 20px">Question Navigator</p>
                            <div style="border-style: solid; border-width: 1px; font-size: 20px">
                                <c:forEach items="${sessionScope.QUESTIONLIST}" var="Question" varStatus="counter">
                                    <c:if test="${Question.id eq requestScope.QUESTION.id}" var="checkQuestion">
                                        ${counter.count}
                                    </c:if>
                                    <c:if test="${!checkQuestion}">
                                        <c:url value="QuizController" var="SwitchLink">
                                            <c:param name="action" value="Switch"/>
                                            <c:param name="id" value="${Question.id}"/>
                                        </c:url>
                                        <c:if test="${Question.answerCorrect eq ''}" var="checkAnswer">
                                            <a style="font-size: 18px" href="${SwitchLink}">${counter.count}</a>
                                        </c:if>
                                        <c:if test="${!checkAnswer}">
                                            <a style="font-size: 18px; color: blue" href="${SwitchLink}">${counter.count}</a>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </div></br>
                            <d style="font-size: 15px">Note: Changing question with <b>Question Navigator</b> doesn't record your answer.</d></br>
                            <input style="margin-top: 60px"  type="submit" name="action" value="Submit" onclick="scriptSubmit()">
                        </div>
                    </div>
                    <div class="info">
                    </div>
                </form>
            </section>
        </div>
    </body>
    <script>
        var endTime = ${sessionScope.ENDTIME};

        var x = setInterval(function () {
        
            var current = new Date().getTime();

            var countdown = endTime - current;
            var hours = Math.floor((countdown % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((countdown % (1000 * 60 * 60)) / (1000 * 60)) + (hours * 60);
            var seconds = Math.floor((countdown % (1000 * 60)) / 1000);

            document.getElementById("countdown").innerHTML = "Remaining Time: " + minutes + ":" + seconds;

            if (countdown < 0) {
                clearInterval(x);
                alert("Time's up!");
                document.getElementById("questionForm").submit();
            }
        }, 1000);
    </script>
</html>