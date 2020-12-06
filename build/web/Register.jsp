<%-- 
    Document   : Register
    Created on : May 24, 2020, 6:52:00 PM
    Author     : TNM
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>Registration Page</title>
        <meta charset="utf-8">
        <link type="text/css" rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <header class="header">
            <div class="top">

                <div class="social">
                </div>
            </div>
            <div class="head">
                <img src="img/Registerlogo.jpg" width="414" height="110">
            </div>
        </header>
        <div class="main">
            <section class="user-main">
                <div class="info">
                    <h1>Register a new Account!</h1></br>
                    <form action="RegisterController" method="POST">
                        <div class="info-left">
                            <h1 class='label'>Email</h1><input type="text" name="txtEmail" placeholder="Email... ( ~ @fpt.edu.vn)" value="${param.txtEmail}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorEmail}
                            </font></br>
                            <h1 class='label'>Name</h1><input type="text" name="txtName" placeholder="Name..." value="${param.txtName}"/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorName}
                            </font></br>
                        </div>
                        <div class="info-right">
                            <h1 class='label'>Password</h1><input type="password" name="txtPassword" placeholder="Password..."/></br>
                            <font color='red' font-size='10'>
                            ${requestScope.INVALID.errorPassword}
                            </font></br>
                            <h1 class='label' style="width: 150px">Confirm Password</h1><input type="password" name="txtPasswordConfirm" placeholder="Confirm Password"/></br>
                            </br>
                            <input type="submit" name="action" value="Register"/></br>
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
