<%--
    Document   : navi
    Created on : Mar 3, 2010, 2:06:35 PM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
        <%
                    int counter = 0;
                    Cookie[] cookies = request.getCookies();
                    if (cookies == null) {%>
        <%@include file="loginUI.jsp" %>
        <%} else {
                                for (int i = 0; i < cookies.length; i++) {
                                    Cookie c = cookies[i];
                                    if (c.getName().equals("DWT")) {
                                        if (c.getValue().equals("true") == true) {
                                            counter = 1;%>
        <%@include file="logout.jsp" %>
        <%} else if (c.getValue().equals("false") == true) {
                                                    counter = 1;%>
        <%@include file="loginUI.jsp" %>
        <%}

                                    }
                                }
                                if (counter == 0) {%>
        <%@include file="loginUI.jsp" %>
        <%}
                    }%>
        <link rel="stylesheet" type="text/css" href="scripts/standard.css" />
    </head>
    <body>
        <div style=" display: block; position:absolute; top: 0px; left:120px; width:400px; height:180px; padding:0px; z-index:2; background:transparent; border:none;" align="left">
            <a href="home.jsp">
                <img src ="logo3.png" class ="picture" style="padding:0px; border:none;" >
            </a>
        </div>


        
    </body>
</html>
