<%-- 
    Document   : RecordPage
    Created on : May 25, 2020, 8:28:50 PM
    Author     : TNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Record Page</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">
                <div class="welcome">Aim for good grades, ${sessionScope.USER.name}!</div>
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
        <div class="main">
            <c:if test="${requestScope.CONTENT eq 'ViewQuizzesUntaken'}">
                <section class="user-main">
                    <div class="info">
                        <c:if test="${requestScope.RECORD != null}">
                            <h1 style="font-size: 20px; margin-bottom: 20px">Quiz List</h1>
                            <c:if test="${not empty requestScope.RECORD}" var="checkList">
                                <table border="2" cellpadding="5">
                                    <thead>
                                        <tr>
                                            <th style="width: 50px">No.</th>
                                            <th style="width: 100px">Subject's ID</th>
                                            <th style="width: 250px">Subject's Name</th>
                                            <th style="width: 150px">Number of Question</th>
                                            <th style="width: 90px">Time</th>
                                            <th style="width: 160px">Remaining Attempt(s)</th>
                                            <th style="width: 120px">Quiz Link</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.RECORD}" var="dto" varStatus="count">
                                            <tr>
                                                <td style="text-align: center">${count.count}</td>
                                                <td style="text-align: center">${dto.id}</td>
                                                <td>${dto.name}</td>
                                                <td style="text-align: center">${dto.questionCount}</td>
                                                <td style="text-align: center">${dto.quizTime} minutes</td>
                                                <td style="text-align: center">${dto.attempt}</td>
                                                <td style="width: 50px;text-align: center">
                                                    <c:url var="quizLink" value="QuizController">
                                                        <c:param name="action" value="Start"/>
                                                        <c:param name="test" value="${param.test}"/>
                                                        <c:param name="DTO" value="${dto.id}"/>
                                                    </c:url>
                                                    <a href="${quizLink}">Start Quiz</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${!checkList}">
                                <h2 style="font-size: 20px; margin-top: -40px">
                                    There's no available quiz for you.
                                </h2>
                            </c:if>
                        </c:if>
                    </div>
                </section>
            </c:if>
            <section class="user-main">
                <div class="info">
                    <c:if test="${requestScope.CONTENT eq 'ViewQuizzesTaken'}">
                        <h1 style="font-size: 20px; margin-bottom: 20px">Search Subject</h1>
                        <div class="info-search">
                            <form action="RecordController" method="POST">
                                <select class="comboBox" name="txtSearch" style="width: 200px">
                                    <c:forEach items="${requestScope.SUBJECT}" var="dto" varStatus="counter">
                                        <option value="${dto.id}" ${dto.id eq requestScope.txtSearch ? 'selected="selected"' :''}>${dto.id} - ${dto.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="submit" name="action" value="Search by Subject"/>
                            </form>
                        </div>
                        <c:if test="${requestScope.RECORD != null}">
                            <c:if test="${not empty requestScope.RECORD}" var="checkList">
                                <h1 style="font-size: 20px; margin-bottom: 20px">Taken Quizzes</h1>
                                <table border="2" cellpadding="5">
                                    <thead>
                                        <tr>
                                            <th style="width: 70px">Attempt(s)</th>
                                            <th style="width: 100px">Subject's ID</th>
                                            <th style="width: 200px">Submitted Time</th>
                                            <th style="width: 130px">Correct answers</th>
                                            <th style="width: 70px">Time</th>
                                            <th style="width: 70px">Score</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.RECORD}" var="dto" varStatus="count">
                                            <tr>
                                                <td style="text-align: center">${count.count}</td>
                                                <td style="text-align: center">${dto.subjectId}</td>
                                                <td style="text-align: center">${dto.timeSubmit}</td>
                                                <td style="text-align: center">${dto.questionRatio}</td>
                                                <td style="text-align: center">${dto.timeMin}:${dto.timeSec}</td>
                                                <td style="text-align: center">${dto.point}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${!checkList}">
                                <h2 style="font-size: 20px; margin-top: -40px">
                                    You haven't taken any quiz.
                                </h2>
                            </c:if>
                        </c:if>
                    </c:if>

                    <c:if test="${requestScope.PAGE !=null}">
                        <form action="SearchController" method="POST">
                            <div class="info-left">
                                <c:if test="${(requestScope.PAGE != 1)}">
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                    <input type="hidden" name="PAGE" value="${requestScope.PAGE}"/>
                                    <input style="width: 200px" type="submit" name="action" value="Previous Page">
                                </c:if>
                            </div>
                            <div class="info-right">
                                <c:if test="${(requestScope.PAGE != requestScope.TOTAL)}">
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                    <input type="hidden" name="PAGE" value="${requestScope.PAGE}"/>
                                    <input style="width: 200px"  type="submit" name="action" value="Next Page">
                                </c:if>
                            </div>
                        </form>
                    </c:if>
                </div>
            </section>
        </div>
    </body>
</html>
