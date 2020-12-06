<%-- 
    Document   : SearchQuestion
    Created on : May 24, 2020, 7:03:49 PM
    Author     : TNM
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Question</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">
                <div class="welcome">Check the question carefully, ${sessionScope.USER.name}!</div>
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
            <section class="search-main">
                <div class="info">
                    <h1 style="font-size: 20px; margin-bottom: 20px">Search Question</h1>
                    <div class="info-search">
                        <form action="SearchController" method="POST">
                            <c:if test="${requestScope.METHOD eq 'content'}">
                                <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                                <input type="text" name="txtSearch" placeholder="Search..." value="${requestScope.txtSearch}"/>
                                <input type="submit" name="action" value="Search by Content"/>
                            </c:if>
                            <c:if test="${requestScope.METHOD eq 'subject'}">
                                <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                                <select class="comboBox" name="txtSearch" style="width: 200px">
                                    <c:forEach items="${requestScope.SUBJECT}" var="dto" varStatus="counter">
                                        <option value="${dto.id}" ${dto.id eq requestScope.txtSearch ? 'selected="selected"' :''}>${dto.id} - ${dto.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="submit" name="action" value="Search by Subject"/>
                            </c:if>
                            <c:if test="${requestScope.METHOD eq 'status'}">
                                <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                                <select class="comboBox" name="txtSearch">
                                    <option value="1" ${1 == requestScope.STATUS ? 'selected="selected"' :''}>In-use</option>
                                    <option value="3"${3 == requestScope.STATUS ? 'selected="selected"' :''}>Deactivated</option>
                                </select>
                                <input type="submit" name="action" value="Search by Status"/>
                            </c:if>
                        </form>
                    </div>
                    <c:if test="${requestScope.QUESTIONLIST != null}">
                        <c:if test="${not empty requestScope.QUESTIONLIST}" var="checkList">
                            <h2 style="font-size: 15px; margin-top: -40px"> Page 
                                <b style="font-size: 20px">${requestScope.PAGE}</b> 
                                of <b style="font-size: 20px">${sessionScope.TOTAL}</b> Page(s)</h2>
                            <table border="2" cellpadding="5">
                                <thead>
                                    <tr>
                                        <th style="width: 70px">Subject's ID</th>
                                        <th style="width: 200px">Question's Content</th>
                                        <th style="width: 200px">Correct Answer</th>
                                        <th style="width: 200px">Additional Answers</th>
                                        <th style="width: 200px">Created Date</th>
                                        <th style="width: 50px">Status</th>
                                        <th style="width: 50px">Update Link</th>
                                        <th style="width: 50px">Delete Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.QUESTIONLIST}" var="dto" varStatus="counter">
                                        <tr>
                                            <td>${dto.id}</td>
                                            <td>${dto.questionContent}</td>
                                            <td>${dto.answerCorrect}</td>
                                            <td>
                                                <b style="font-size: 20px">-</b> ${dto.answerWrong1}</br>
                                                <b style="font-size: 20px">-</b> ${dto.answerWrong2}</br>
                                                <b style="font-size: 20px">-</b> ${dto.answerWrong3}
                                            </td>
                                            <td>${dto.createdDate}</td>
                                            <td>
                                                <c:if test="${dto.status == 1}" var="statusCheck">
                                                    In-use
                                                </c:if>
                                                <c:if test="${!statusCheck}">
                                                    Deactivated
                                                </c:if>
                                            </td>
                                            <td style="width: 50px">
                                                <c:url var="updateLink" value="QuestionController">
                                                    <c:param name="action" value="SetForUpdate"/>
                                                    <c:param name="ID" value="${dto.id}"/>
                                                    <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                    <c:param name="METHOD" value="${requestScope.METHOD}"/>
                                                    <c:param name="PAGE" value="${requestScope.PAGE}"/>
                                                </c:url>
                                                <a href="${updateLink}">Update</a>
                                            </td>
                                            <c:if test="${dto.status==1}">
                                                <td style="width: 50px">
                                                    <c:url var="deleteLink" value="QuestionController">
                                                        <c:param name="action" value="Delete"/>
                                                        <c:param name="ID" value="${dto.id}"/>
                                                        <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                        <c:param name="METHOD" value="${requestScope.METHOD}"/>
                                                        <c:param name="PAGE" value="${requestScope.PAGE}"/>
                                                    </c:url>
                                                    <a href="${deleteLink}">Delete</a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                    <c:if test="${requestScope.PAGE !=null}">
                        <form action="SearchController" method="POST">
                            <div class="info-left">
                                <c:if test="${(requestScope.PAGE != 1)}">
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                    <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                                    <input type="hidden" name="PAGE" value="${requestScope.PAGE}"/>
                                    <input style="width: 200px" type="submit" name="action" value="Previous Page">
                                </c:if>
                            </div>
                            <div class="info-right">
                                <c:if test="${(requestScope.PAGE != sessionScope.TOTAL)}">
                                    <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                    <input type="hidden" name="METHOD" value="${requestScope.METHOD}"/>
                                    <input type="hidden" name="PAGE" value="${requestScope.PAGE}"/>
                                    <input style="width: 200px"  type="submit" name="action" value="Next Page">
                                </c:if>
                            </div>
                        </form>
                    </c:if>
                        </c:if>
                        <c:if test="${!checkList}">
                            <h2 style="font-size: 20px; margin-top: -40px">
                                No Question Found!
                            </h2>
                        </c:if>
                    </c:if>
                </div>
            </section>
        </div>
    </body>
</html>
