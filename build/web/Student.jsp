<%-- 
    Document   : Student
    Created on : May 24, 2020, 7:02:56 PM
    Author     : TNM
--%>

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
                <div class="welcome">Hello, ${sessionScope.USER.name}!</div>
                <div class="logout">
                    <form action="AccountController" method="POST">
                        <input type="submit" name="action" value="Logout">
                    </form>
                </div>
            </div>
            <div class="head">
                <img src="img/Studentlogo.jpg" width="414" height="110">
            </div>
            <nav>
                <ul>
                    <li>
                        <c:url var="reloadLink" value="Student.jsp">
                            <c:param name="action" value="Reload"/>
                        </c:url>
                        <a href="${reloadLink}" class="active">Dashboard</a>
                    </li>
                    <li><a href="RecordController?action=ViewQuizzesUntaken">View Available Quizzes</a></li>
                    <li><a href="RecordController?action=ViewQuizzesTaken">View Taken Quizzes</a></li>
                </ul>
            </nav>
        </header>
    </body>
</html>

