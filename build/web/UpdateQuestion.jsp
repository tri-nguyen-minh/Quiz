<%-- 
    Document   : UpdateQuestion
    Created on : May 24, 2020, 7:04:22 PM
    Author     : TNM
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Question</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">
                <div class="welcome">Remember to fill all of the contents, ${sessionScope.USER.name}!</div>
                <div class="logout">
                    <form action="AccountController" method="POST">
                        <input type="submit" name="action" value="Logout">
                    </form>
                </div>

            </div>
            <div class="head">
                <img src="img/Adminlogo.jpg" width="414" height="110">
            </div>
            <nav>
                <ul>
                    <li>
                        <c:url var="reloadLink" value="Admin.jsp">
                            <c:param name="action" value="Reload"/>
                        </c:url>
                        <a href="${reloadLink}" class="active">Dashboard</a>
                    </li>
                    <li>
                        <c:url var="createLink" value="CreateQuestion.jsp">
                            <c:param name="action" value="Create"/>
                        </c:url>
                        <a href="${createLink}">Create a Question</a>
                    </li>
                    <li><a href="QuestionController?action=Search&SearchMethod=content">Search Questions by Content</a></li>
                    <li><a href="QuestionController?action=Search&SearchMethod=subject">Search Questions by Subject</a></li>
                    <li><a href="QuestionController?action=Search&SearchMethod=status">Search Questions by Status</a></li>
                </ul>
            </nav>
        </header>
        <div class="main">
            <section class="user-main">
                <div class="info">
                    <h1 style="font-size: 20px; margin-bottom: 60px; margin-top: -15px">Update the Question!</h1>
                    <form action="QuestionController" method="POST">
                        <div class="info-left">
                            <h1 class='label'>Subject</h1><input type="text" name="txtSubject" placeholder="Subject's ID" value="${requestScope.DTO.subjectId}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorSubjectId}
                            </font></br>
                            <h1 class='label'>Question</h1><input type="text" name="txtQuestion" placeholder="Question's Content" value="${requestScope.DTO.questionContent}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorContent}
                            </font></br>
                            <h1 class='label'>Correct Answer</h1><input type="text" name="txtCorrect" placeholder="Correct Answer" value="${requestScope.DTO.answerCorrect}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorCorrectAnswer}
                            </font></br>
                        </div>
                        <div class="info-right">
                            <h1 style="margin-top: -35px; font-size: 17px">Additional Answers</h1>
                            <h1 class='label'>Answers 1</h1><input type="text" name="txtWrong1" placeholder="Answer" value="${requestScope.DTO.answerWrong1}"/></br>
                            </br>
                            <h1 class='label'>Answers 2</h1><input type="text" name="txtWrong2" placeholder="Answer" value="${requestScope.DTO.answerWrong2}"/></br>
                            </br>
                            <h1 class='label'>Answers 3</h1><input type="text" name="txtWrong3" placeholder="Answer" value="${requestScope.DTO.answerWrong3}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorAnswers}
                            </font></br></br>
                            <
                            <input type="hidden" name="ID" value="${requestScope.DTO.id}"/>
                            <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                            <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                            <input type="hidden" name="PAGE" value="${requestScope.PAGE}"/>
                            <input type="submit" name="action" value="Update"/></br>
                        </div>
                    </form>
                    <font color='red' font-size='15'>
                    ${requestScope.ERROR}
                    </font></br>
                </div>
            </section>
        </div>
    </body>
</html>

