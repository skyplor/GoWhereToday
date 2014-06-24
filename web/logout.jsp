<%--
    Document   : login
    Created on : Mar 24, 2010, 11:59:06 AM
    Author     : Flyzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="standard.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    </head>
    <body>
        <div class="loginbox" id="loginUI" align="left" >
                <form action="servlets/logout" name="logout" method="post">
                    <%@page language="java" import="java.util.*, javax.servlet.http.Cookie" %>
                    <br>
                    Welcome,
                    <%
                                Cookie[] ucookies = request.getCookies();
                                for (int y = 0; y < ucookies.length; y++) {
                                    Cookie x = ucookies[y];
                                    if (x.getName().equals("DWTuser")) {
                                        String username = x.getValue();%>
                    <a href="ControlPanel.jsp#"><%= username%></a>
                    <%}
                            }%>
                            <br>
                            <br>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    Click
                    <a href="javascript:document.logout.submit()" >here</a> to logout.
                </form>
        </div>
    </body>
</html>
