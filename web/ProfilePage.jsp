<%-- 
    Document   : ProfilePage
    Created on : May 10, 2010, 01:34AM
    Author     : jasonlv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="navi.jsp" %>
        <link href="standard.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page language ="java" import="java.util.*, Entities.*, MyControllers.*" %>
        <title>Profile Page</title>
    </head>
    <body>
        <div id="main" align="left">
            <div id="text">




                <div id="leftColumn" >
                    <%
                                String username = request.getParameter("username");
                                ProfilePageController con = new ProfilePageController();
                                ViewArticleController cat = new ViewArticleController();
                                User client = con.findUserByUsername(username);
                                Article[] articles = con.findArticleByUsername(username);
                                Article[] articleCat;
                    %>
                    <h2><font color="#F88017"><%=client.getUsername()%>'s Profile Page</font></h2>




                    <div width="35%">
                        <%=client.getUsername()%>'s Avatar<br>
                        <img src="Avatars/<%=client.getAvatar()%>" height="200" width="200" alt="<%=client.getUsername()%>'s Avatar">
                        <br>
                        Email:&nbsp;<%=client.getEmailAddr()%><br>
                        Birthdate:&nbsp; <%String startDate;
                                    if (!client.getDOB().toString().equalsIgnoreCase("1801-02-19")) {
                                        String dob = client.getDOB().toString();
                                        String startYear = dob.substring(0, 4);
                                        String startMonth = dob.substring(5, 7);
                                        String startDay = dob.substring(8);

                                        if (startMonth.equalsIgnoreCase("01")) {
                                            startMonth = "JAN";
                                        } else if (startMonth.equalsIgnoreCase("02")) {
                                            startMonth = "FEB";
                                        } else if (startMonth.equalsIgnoreCase("03")) {
                                            startMonth = "MAR";
                                        } else if (startMonth.equalsIgnoreCase("04")) {
                                            startMonth = "APR";
                                        } else if (startMonth.equalsIgnoreCase("05")) {
                                            startMonth = "MAY";
                                        } else if (startMonth.equalsIgnoreCase("06")) {
                                            startMonth = "JUN";
                                        } else if (startMonth.equalsIgnoreCase("07")) {
                                            startMonth = "JUL";
                                        } else if (startMonth.equalsIgnoreCase("08")) {
                                            startMonth = "AUG";
                                        } else if (startMonth.equalsIgnoreCase("09")) {
                                            startMonth = "SEP";
                                        } else if (startMonth.equalsIgnoreCase("10")) {
                                            startMonth = "OCT";
                                        } else if (startMonth.equalsIgnoreCase("11")) {
                                            startMonth = "NOV";
                                        } else {
                                            startMonth = "DEC";
                                        }
                                        startDate = startDay + " " + startMonth + " " + startYear;
                                    } else {
                                        startDate = "N.A.";
                                    }%><%=startDate%><br>
                        Date joined:&nbsp; <%=client.getRegDate()%><br>
                        About me:<br>
                        &nbsp;&nbsp;<%if (client.getAboutMe() != null) {%><%=client.getAboutMe()%><%} else {%>N.A.<%}%><br>
                    </div>
                    <div width="60%">
                        <br>
                        <br>
                        <h3>List of articles written by <%=client.getUsername()%></h3><br>
                        <%if (articles == null) {%>
                        Oops, it seems that this user haven't written anything
                        <%} else {
                            for (int count = 0; count < articles.length; count++) {
                                int count1 = 0;
                                articleCat = (Article[]) cat.getArticleCat(articles[count].getID());
                                for (int k = 1; k < Integer.parseInt(articleCat[0].getPara(0)); k++) {
                                    if (articleCat[0].getPara(k).equalsIgnoreCase("Events")) {
                                        count1 = 1;
                        %>
                        <form action="servlets/ViewEventsServlet" name="viewevent<%=count%>" method="post">
                            <input type=hidden value="<%=articles[count].getID()%>" name="articleid">
                            <b><a href="javascript:document.viewevent<%=count%>.submit()"><%=articles[count].getPara(0)%></a></b><br>
                            <p><%if (!articles[count].getPara(12).equalsIgnoreCase("null")) {
                                                                        StringTokenizer token = new StringTokenizer(articles[count].getPara(12));
                                                                        for (int y = 0; y < 20 && y < token.countTokens(); y++) {%>
                                <%=token.nextToken()%>
                                <%}
                                    if (token.countTokens() > 20) {%>
                                ...</p>
                                <%}
                            } else {%>N.A.<%}%>
                            <br>
                        </form>
                        <%
                                                            }
                                                        }
                                                        if (count1 == 0) {%>
                        <form action="servlets/ViewArticleServlet" name="viewarticle<%=count%>" method="post">
                            <input type=hidden value="<%=articles[count].getID()%>" name="articleid">
                            <b><a href="javascript:document.viewarticle<%=count%>.submit()"><%=articles[count].getPara(0)%></a></b><br>
                            <p><%if (!articles[count].getPara(12).equalsIgnoreCase("null")) {
                                                                        StringTokenizer token = new StringTokenizer(articles[count].getPara(12));
                                                                        for (int y = 0; y < 20 && y < token.countTokens(); y++) {%>
                                <%=token.nextToken()%>
                                <%}
                                    if (token.countTokens() > 20) {%>
                                ...</p>
                                <%}
                            } else {%>N.A.<%}%>
                            <br>
                        </form>
                        <%}
                            }}
                        %>
                    </div>
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
