<%--
    Document   : DWT Page 3
    Created on : May 12, 2010, 22:11:15 PM
    Author     : Timothy Peh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link href="scripts/standard.css" rel="stylesheet" type="text/css">

<html>
    <head>
        <%@include file="navi.jsp" %>
        <title>Go Where Today? | Do What Today</title>
    </head>
    <body>
        <div id="main" align="left">

            <div id="text" >


                <div id="leftColumn" >
                    <div>
                        <br>

                        <h1 class="form_title">Do What Today</h1>
                        <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
                        <%
                                    int count = 0;
                                    Cookie[] cookiesWAjsp = request.getCookies();
                                    if (cookiesWAjsp == null) {%>
                        Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to use this functions.
                        <%} else {%>
                        <%
                                                            for (int k = 0; k < cookiesWAjsp.length; k++) {
                                                                Cookie c = cookiesWAjsp[k];
                                                                if (c.getName().equals("DWTuser")) {
                                                                    count = 1;%>
                        <h4>Do What Today is an activity planner which allows you to organise and plan
                            <br>your activities based on your preferences.<br></h4>
                        <h3>Page 3 Instructions </h3>
                        <h4> First select the category of activities you wish to attend,
                            <br>then specify more information in the given fields.</h4>

                        <h4 style="padding-left: 530px;">Page 3 of 3</h4>
                        <%@page language="java" import="java.util.*, java.sql.*, java.io.*, Entities.*" %>

                        <%
                                    PrintWriter outp = response.getWriter();
                                    try {
                                        Article[] rs = (Article[]) session.getAttribute("DWTfiltered");

                                        String name;
                                        String timing1;
                                        String timing2;
                                        String timing3;
                                        String startDate;
                                        String endDate;
                                        int id;
                        %>
                        <%@include file="calendar.jsp" %>

                        <br>
                        <br>

                        <table border="1" width="640" cellspacing="0" cellpadding="0">

                            <tr>
                                <td align="center" width="140" height="30">Name</td>
                                <td align="center" width="300" height="30">Timings</td>
                                <td align="center" width="100" height="30">Start Date</td>
                                <td align="center" width="100" height="30">End Date</td>

                            </tr>

                            <%
                                                            for (int i = 0; i < rs.length; i++) {
                                                                name = rs[i].getPara(0);
                                                                id = rs[i].getID();
                                                                if(!rs[i].getPara(3).equalsIgnoreCase("null")){
                                                                timing1 = rs[i].getPara(3);}
                                                                else{
                                                                timing1 = "N.A.";
                                                                }
                                                                if(!rs[i].getPara(4).equalsIgnoreCase("null")){
                                                                timing2 = rs[i].getPara(4);}
                                                                else{
                                                                timing2 = "N.A.";
                                                                }
                                                                if(!rs[i].getPara(5).equalsIgnoreCase("null")){
                                                                timing3 = rs[i].getPara(5);}
                                                                else{
                                                                timing3 = "N.A.";
                                                                }
                                                                startDate = rs[i].getPara(6);
                                                                endDate = rs[i].getPara(7);

                                                                if (startDate.equalsIgnoreCase("01 JAN 2001")) {
                                                                    String startYear = startDate.substring(0, 4);
                                                                    String startMonth = startDate.substring(5, 7);
                                                                    String startDay = startDate.substring(8);

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
                                                                    startDate = "N.A. <br> Date applicable to events only";
                                                                }

                                                                if (endDate.equalsIgnoreCase("01 JAN 2001")) {
                                                                    String endYear = endDate.substring(0, 4);
                                                                    String endMonth = endDate.substring(5, 7);
                                                                    String endDay = endDate.substring(8);

                                                                    if (endMonth.equalsIgnoreCase("01")) {
                                                                        endMonth = "JAN";
                                                                    } else if (endMonth.equalsIgnoreCase("02")) {
                                                                        endMonth = "FEB";
                                                                    } else if (endMonth.equalsIgnoreCase("03")) {
                                                                        endMonth = "MAR";
                                                                    } else if (endMonth.equalsIgnoreCase("04")) {
                                                                        endMonth = "APR";
                                                                    } else if (endMonth.equalsIgnoreCase("05")) {
                                                                        endMonth = "MAY";
                                                                    } else if (endMonth.equalsIgnoreCase("06")) {
                                                                        endMonth = "JUN";
                                                                    } else if (endMonth.equalsIgnoreCase("07")) {
                                                                        endMonth = "JUL";
                                                                    } else if (endMonth.equalsIgnoreCase("08")) {
                                                                        endMonth = "AUG";
                                                                    } else if (endMonth.equalsIgnoreCase("09")) {
                                                                        endMonth = "SEP";
                                                                    } else if (endMonth.equalsIgnoreCase("10")) {
                                                                        endMonth = "OCT";
                                                                    } else if (endMonth.equalsIgnoreCase("11")) {
                                                                        endMonth = "NOV";
                                                                    } else {
                                                                        endMonth = "DEC";
                                                                    }
                                                                    endDate = endDay + " " + endMonth + " " + endYear;
                                                                } else {
                                                                    endDate = "N.A. <br> Date applicable to events only";
                                                                }
                            %>


                            <tr>
                                <td align="center" height="60">
                                    <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a></td>
                                <td>
                                    <table border="0" width="300" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td align="center" height="20"><%=timing1%></td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="20"><%=timing2%></td>
                                        </tr>
                                        <tr>
                                            <td align="center" height="20"><%=timing3%></td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="center" height="45"><%=startDate%></td>
                                <td align="center" height="45"><%=endDate%></td>
                            </tr>

                            <%
                                                            }
                            %>

                        </table>

                        <%
                                    } catch (Exception e) {
                                        outp.println("Exception is: " + e);
                                    }
                        %>
                        <br>
                        <table border="0" width="600" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <input type="button" value="Back" onclick="document.location.href='DWT2.jsp';" title="Click to return to previous page" style="padding:3px"/>&nbsp;&nbsp;
                                        <input type="button" value="End" onclick="document.location.href='home.jsp';" title="Click to return to home page" style="padding:3px"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <%}
                                                        }
                                                        if (count == 0) {%>
                        <%--Enter your Error Msg--%>
                        Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to review.
                        <%}
                                }%>
                    </div>


                </div>


<%@include file="rightColumn.jsp" %>
            </div>
            <hr>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="mlddm.jsp" %>
    </body>
</html>