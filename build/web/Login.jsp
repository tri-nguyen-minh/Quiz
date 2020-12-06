<%-- 
    Document   : Login
    Created on : May 24, 2020, 6:50:03 PM
    Author     : TNM
--%>


<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">
            </div>
            <div class="head">
                <img src="img/Loginlogo.jpg" width="414" height="110">
            </div>
        </header>

        <div class="main">
            <section class="user-main">
                <div class="info">
                    <h1>Log in to your account!</h1>
                    <form id="form" action="AccountController" method="POST">
                        <p class="login-field">
                            <input type="text" name="txtId" placeholder="Email" value="${param.txtId}">
                        </p>
                        <p class="login-field">
                            <input type="password" name="txtPassword" placeholder="Password">
                        </p>
                        <p>
                            <font color="red">
                            ${requestScope.FAILED}
                            </font>
                        </p>
                        <p>
                            <input type="submit" name="action" value="Login">
                        </p>
                    </form>
                </div>
            </section>
        </div>
    </body>
</html>