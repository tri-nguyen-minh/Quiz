<%-- 
    Document   : Admin
    Created on : May 24, 2020, 7:02:25 PM
    Author     : TNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin</title>
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
        <div class="col-main">
            <div class="main-content" style="margin-bottom: 100px">
                <c:if test="${requestScope.NOTIFY != null}">
                    <h1 style="margin-left: 30px; font-size: 25px">${requestScope.NOTIFY}</h1>
                </c:if>
            </div>
        </div>
    </body>
    
    
</html>