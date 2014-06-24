<%--
    Document   : register
    Created on : Mar 4, 2010, 10:35:45 AM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <%@include file="navi.jsp" %>
        <%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
        <%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
        <script type="text/javascript">
            var RecaptchaOptions = {
                theme : 'clean'
            };
        </script>
        <script type="text/javascript">
            var secs = 9;
            var wait = secs * 1000;
            AGREE.value = "I Agree(" + secs + ")";
            AGREE.disabled = true;
            for(i = 1; i <= secs; i++) {
                window.setTimeout("update(" + i + ")", i * 1000);
            }
            window.setTimeout("timer()", wait);
            function update(num, value) {
                if(num == (wait/1000)) {
                    AGREE.value = "I Agree";
                }
                else {
                    printnr = (wait / 1000) - num;
                    AGREE.value = "I Agree(" + printnr + ")";
                }
            }
            function timer() {
                AGREE.disabled = false;
                AGREE.value = "I Agree";
            }
        </script>
        <script type="text/javascript">
            function on_submit(){
                var usrnm = document.InfoTable.username.value;
                var pswd = document.InfoTable.password.value;
                var address = document.InfoTable.emailAddr.value;
                var testEmail = /^\w(\.?[\w-])*@\w(\.?[\w-])*\.[a-z]{2,6}(\.[a-z]{2})?$/i;
                var testAlpha = /^[A-Za-z0-9]+$/i
                if (usrnm == ""){
                    alert("Oops! You have not entered a username.");
                    document.InfoTable.username.focus();
                    return false;
                }
                else if (!testAlpha.test(usrnm) || usrnm.length > 41 || usrnm.length < 6){
                    alert("The username you have entered is invalid,\nit must be between 6 to 40 alphanumeric characters long.");
                    document.InfoTable.username.focus();
                    return false;
                }
                else if (pswd == ""){
                    alert("Oops! You have not entered a password.");
                    document.InfoTable.password.focus();
                    return false;
                }
                else if (!testAlpha.test(pswd) || pswd.length > 16 || pswd.length < 6){
                    alert("The password you have entered is invalid,\nit must be between 6 to 16 alphanumeric characters long.");
                    document.InfoTable.password.focus();
                    return false;
                }
                else if (document.InfoTable.repeatedPassword.value == ""){
                    alert("Please re-enter your password.");
                    document.InfoTable.repeatedPassword.focus();
                    return false;
                }
                else if (document.InfoTable.repeatedPassword.value != pswd){
                    alert("The passwords do not match.");
                    document.InfoTable.repeatedPassword.focus();
                    return false;
                }
                else if (address==""){
                    alert("Oops! You have not entered an email address.");
                    document.InfoTable.emailAddr.focus();
                    return false;
                }
                else if (!testEmail.test(address)){
                    alert("The email address you have entered is invalid.");
                    document.InfoTable.emailAddr.focus();
                    return false;
                }
                else if (document.InfoTable.repeatedEmailAddr.value == ""){
                    alert("Please re-enter your email address.");
                    document.InfoTable.repeatedEmailAddr.focus();
                    return false;
                }
                else if (document.InfoTable.repeatedEmailAddr.value != address){
                    alert("The email addresses do not match.");
                    document.InfoTable.repeatedEmailAddr.focus();
                    return false;
                }
                else if (document.InfoTable.fullName.value == ""){
                    alert("Please enter your name");
                    document.InfoTable.fullName.focus();
                    return false;
                }
                else if (document.InfoTable.Month.selectedIndex  == "0" || document.InfoTable.Day.selectedIndex  == "0" || document.InfoTable.Year.selectedIndex  == "0" ){
                    alert("Oops! You have not entered your birthday.");
                    return false;
                }
                else if ((document.InfoTable.Month.selectedIndex  == "4" || document.InfoTable.Month.selectedIndex  == "6" || document.InfoTable.Month.selectedIndex  == "9" || document.InfoTable.Month.selectedIndex  == "11")&&(document.InfoTable.Day.selectedIndex  == "31")){
                    alert("The date is invalid.");
                    return false;
                }
                else if (document.InfoTable.Month.selectedIndex  == "2" && (document.InfoTable.Day.selectedIndex  == "30" || document.InfoTable.Day.selectedIndex  == "31") ){
                    alert("The date is invalid.");
                    return false;
                }
                for(var i = 0; i < document.InfoTable.fullName.value.length; i++ ){
                    document.InfoTable.fullName.value=document.InfoTable.fullName.value.replace("'","&rsquo;");}
                return true;
            }
            function checkReset(){
                return confirm("Are you sure you want to reset? All the fields will be cleared.");
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Go Where Today | Registration</title>
        <script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery-ui-1.7.1.custom.min.js"></script>
        <script type="text/javascript" src="scripts/daterangepicker.jQuery.js"></script>
        <link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
        <link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
        <script type="text/javascript">
            $(function(){
                $('#BirthDate').daterangepicker({
                    presetRanges: [
                        {text: 'Today', dateStart: 'Today', dateEnd: 'Today' }
                    ],
                    presets: {specificDate: 'Pick a date'},
                    dateFormat: 'yy-mm-dd',
                    rangeSplitter: 'to',
                    datepickerOptions:{
                        changeMonth: true,
                        changeYear: true,
                        yearRange: '1910:2005'
                    }
                });
            });
        </script>
    </head>
    <body>
        <%@page language="java" import="java.util.*, javax.servlet.http.Cookie" %>
        <%
                    Cookie[] rcookies = request.getCookies();
                    for (int o = 0; o < rcookies.length; o++) {
                        Cookie p = rcookies[o];
                        if (p.getName().equals("DWTreg")) {
                            if (p.getValue().equals("eusername")) {
                                Cookie killreg = new Cookie("DWTreg", "");
                                killreg.setPath("/GoWhereToday");
                                killreg.setMaxAge(0);
                                response.addCookie(killreg);%>
        <script type="text/javascript">
            alert("The username you chosen exist, please choose another one");
        </script>
        <%} else if (p.getValue().equals("eemail")) {
                                        Cookie killreg = new Cookie("DWTreg", "");
                                        killreg.setPath("/GoWhereToday");
                                        killreg.setMaxAge(0);
                                        response.addCookie(killreg);%>
        <script type="text/javascript">
            alert("The email you chosen exist, please choose another one");
        </script>
        <%} else if (p.getValue().equals("unknown")) {
                                        Cookie killreg = new Cookie("DWTreg", "");
                                        killreg.setPath("/GoWhereToday");
                                        killreg.setMaxAge(0);
                                        response.addCookie(killreg);%>
        <script type="text/javascript">
            alert("Unknown error has occur, please try again.");
        </script>
        <%} else if (p.getValue().equals("captcha")) {
                                        Cookie killreg = new Cookie("DWTreg", "");
                                        killreg.setPath("/GoWhereToday");
                                        killreg.setMaxAge(0);
                                        response.addCookie(killreg);%>
        <script type="text/javascript">
            alert("The text you entered didn't match the security check. Please try again");
        </script>
        <%}
                        }
                    }%>
        <div id="main" align="left">
            <div id="text">




                <div id="leftColumn" >
                    <h1 class="form_title">Join Our Community</h1><br>
                    <h4>Interested to be a part of us?
                        Its just a one step process to get full access to our website.<br>
                        The fields denoted with a (*) below are required.</h4>
                    <br>
                    <form action="servlets/RegistrationServlet" onsubmit="return on_submit()" name="InfoTable" method="POST">
                        <table width="100%" border="0" align="center" cellpadding="10" cellspacing="10">
                            <tbody>
                                <tr>
                                    <td width="25%">Username (*)</td>
                                    <td width="75%"><input type="text" name="username" class="form_input" size="45" maxlength="40"/>
                                        <br><i class="font_11">A name to identify yourself in this community</i></td>
                                </tr>
                                <tr>
                                    <td>Password (*)</td>
                                    <td><input type="password" name="password" class="form_input" size="45" maxlength="16"/>
                                        <br><i class="font_11">To be between 6 to 16 alphanumeric characters long</i></td>
                                </tr>
                                <tr>
                                    <td>Re-enter password (*)</td>
                                    <td><input type="password" name="repeatedPassword" class="form_input" size="45" maxlength="16"/>
                                        <br><i class="font_11">Verify your password</i></td>
                                </tr>
                                <tr>
                                    <td>Email Address (*)</td>
                                    <td><input type="text" name="emailAddr" class="form_input" size="45" maxlength="100"/>
                                        <br><i class="font_11">Used for login</i></td>
                                </tr>
                                <tr>
                                    <td>Re-enter Email Address (*)</td>
                                    <td><input type="text" name="repeatedEmailAddr" class="form_input" size="45" maxlength="100"/>
                                        <br><i class="font_11">Verify your email address</i></td>
                                </tr>
                                <tr>
                                    <td>Full Name (*)</td>
                                    <td><input type="text" name="fullName" class="form_input" size="45" maxlength="100"/>
                                        <br><i class="font_11">Your actual name</i></td>
                                </tr>
                                <tr>
                                    <td>Gender<br><i class="font_11">(Optional)</i></td>
                                    <td>
                                        <input type="radio" name="gender" value="M" />Male&nbsp;
                                        <input type="radio" name="gender" value="F" />Female&nbsp;
                                        <input type="radio" name="gender" value="H" checked="checked" />'Sshhhh!'</td>
                                </tr>
                                <tr>
                                    <td>Birthday<br><i class="font_11">(Optional)</i></td>
                                    <td><input type="text" class="form_input" id="BirthDate" name="BirthDate" /></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <%
                                                    ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LeDGroSAAAAAOiUlcmsyr1oi3wM0KTHZXgXrmio", "6LeDGroSAAAAAEL0pL_MehGtAkwc9CocNVhmwmDM", false);
                                                    out.print(c.createRecaptchaHtml(null, null));
                                        %>
                                        <script type="text/javascript"
                                                src="http://api.recaptcha.net/challenge?k=<6LeDGroSAAAAAOiUlcmsyr1oi3wM0KTHZXgXrmio >">
                                        </script> <noscript>
                                            <iframe src="http://api.recaptcha.net/noscript?k=<6LeDGroSAAAAAOiUlcmsyr1oi3wM0KTHZXgXrmio >"
                                                    height="300" width="500" frameborder="0"></iframe><br>
                                            <input type="text" name="recaptcha_challenge_field">
                                            <input type="hidden" name="recaptcha_response_field"
                                                   value="manual_challenge">
                                        </noscript>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><br>
                                        <input type="submit" value="Submit" name="submit" />&nbsp;&nbsp;&nbsp;
                                        <input type="reset" value="Reset" name="reset" onclick="return checkReset()" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>


                <%@include file="rightColumn.jsp" %>
            </div>
            <br>
            <hr>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="mlddm.jsp" %>
    </body>
</html>
