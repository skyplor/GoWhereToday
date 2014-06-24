<%--
    Document   : loginUI
    Created on : Mar 3, 2010, 10:11:08 AM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="scripts/standard.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/jquery-latest.js">
        </script>
        <script type="text/javascript" src="scripts/thickbox2.js">
        </script>
        <link rel="stylesheet" href="scripts/thickbox.css" type="text/css" media="screen" />
        <style type="text/css"> #TOS {display:none;} </style>
        <script>
            //window.onload = open_TB;
            function open_TB() {
                tb_show("Register?", "?TB_inline=true&height=550&width=800&inlineId=TOS&modal=true", null);
            }

            function close_TB() {
                tb_remove();
            }
        </script>
        <script type="text/javascript">
            function validateLogin(){
                var rxEmail = /^\w(\.?[\w-])*@\w(\.?[\w-])*\.[a-z]{2,6}(\.[a-z]{2})?$/i;
                if(!rxEmail.test(document.login.Email.value)){
                    alert("Oops! You have not entered a valid email address.");
                    document.login.Email.value="";
                    document.login.Password.value="";
                    return false;
                }
                if(document.login.Password.value==""){
                    alert("Oops! You have not entered a password.");
                    document.login.Password.value="";
                    document.login.Password.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="loginbox" id="loginUI" align="left">
            <form action="servlets/ValidateLogin" name="login" method="post" onsubmit="return validateLogin()">
                <br>
               Email:
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input name="Email" size="20" maxlength="100" class="form_input">

                <br><br>
                Password:
                &nbsp

                <input type="password" name="Password" size="20" maxlength="16" class="form_input">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="submit" value="Login" name="login" class="button" >
                <input type="button" value="Register" name="register" class="button" onclick="open_TB()" >
                <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
                <%
                            int counter1 = 0;
                            Cookie[] lcookies = request.getCookies();
                            if (lcookies == null) {%>
                <%} else {
                                                    for (int n = 0; n < lcookies.length; n++) {
                                                        Cookie d = lcookies[n];
                                                        if (d.getName().equals("DWT")) {
                                                            if (d.getValue().equals("false") == true) {
                                                                counter1 = 1;
                                                                Cookie kill = new Cookie("DWT", "");
                                                                kill.setPath("/GoWhereToday");
                                                                kill.setMaxAge(0);
                                                                response.addCookie(kill);%>
                <script type="text/javascript">
                    alert("There's an error in login. The password is incorrect.");
                </script>
                <%}

                                    }
                                }
                            }%>
            </form>
        </div>
        <div id="TOS" > <p>
                <%@include file="TOSPage.jsp" %>
            </p> </div>
    </body>
</html>
