<%-- 
    Document   : CreateQuestion
    Created on : May 24, 2020, 7:00:28 PM
    Author     : TNM
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Create a Question</title>
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
                    <h1 style="font-size: 20px; margin-bottom: 60px; margin-top: -15px">Create a new Question!</h1>
                    <form action="QuestionController" method="POST">
                        <div class="info-left">
                            <h1 class='label'>Subject</h1><input type="text" name="txtSubject" placeholder="Subject's ID" value="${param.txtSubject}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorSubjectId}
                            </font></br>
                            <h1 class='label'>Question</h1><input type="text" name="txtQuestion" placeholder="Question's Content" value="${param.txtQuestion}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorContent}
                            </font></br>
                            <h1 class='label'>Correct Answer</h1><input type="text" name="txtCorrect" placeholder="Correct Answer" value="${param.txtCorrect}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorCorrectAnswer}
                            </font></br>
                        </div>
                        <div class="info-right">
                            <h1 style="margin-top: -35px; font-size: 17px">Additional Answers</h1>
                            <h1 class='label'>Answers 1</h1><input type="text" name="txtWrong1" placeholder="Answer" value="${param.txtWrong1}"/></br>
                            </br>
                            <h1 class='label'>Answers 2</h1><input type="text" name="txtWrong2" placeholder="Answer" value="${param.txtWrong2}"/></br>
                            </br>
                            <h1 class='label'>Answers 3</h1><input type="text" name="txtWrong3" placeholder="Answer" value="${param.txtWrong3}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorAnswers}
                            </font></br></br>
                            <input type="submit" name="action" value="Create"/></br>
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
