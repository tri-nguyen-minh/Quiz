<%-- 
    Document   : PageError.jsp
    Created on : May 26, 2020, 7:59:45 PM
    Author     : Nat
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Error Page</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">
            </div>
            <div class="head">
                <img src="img/Errorlogo.jpg" width="414" height="110">
            </div>
        </header>

        <div class="main">
            <section class="user-main">
                <div class="info">
                    <h1 style="font-size: 20px">An Error has occurred while accessing web page!</h1><br>
                    <b style="font-size: 17px">Possible causes include: </b>
                    <ul>
                        <li style="font-size: 17px">The page  you are requesting do not exist.</li>
                        <li style="font-size: 17px">You do not have access to the page you are requesting.</li>
                    </ul>
                    <c:if test="${sessionScope.USER == null}" var="checkUser">
                        <a href="Login.jsp" style="font-size: 17px">Return to Login page.</a>
                    </c:if>
                    <c:if test="${!checkUser}">
                    <c:if test="${sessionScope.USER.role eq 'admin'}">
                        <a href="Admin.jsp" style="font-size: 17px">Return to Admin's Dashboard.</a>
                    </c:if>
                    <c:if test="${!(sessionScope.USER.role eq 'admin')}">
                        <a href="Student.jsp" style="font-size: 17px">Return to Student's Dashboard.</a>
                    </c:if>
                    </c:if>
                </div>
            </section>
        </div>
    </body>
</html>
