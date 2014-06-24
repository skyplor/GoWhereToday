<%--
    Document   : home
    Created on : Mar 1, 2010, 10:36:15 AM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <title>Go Where Today? | Home</title>
    <%@include file="navi.jsp" %>
    <head>

        <%--Banner Scripts--%>
        <script type="text/javascript" src="swfobject.js"></script>
        <script type="text/javascript">
            var flashvars = {};
            var params = {};
            params.scale = "noscale";
            params.salign = "tl";
            params.wmode = "transparent";
            var attributes = {};
            swfobject.embedSWF("banner.swf", "BannerDiv", "600", "260", "9.0.0", false, flashvars, params, attributes);
        </script>



        <%--iCal Calendar scripts--%>
        <link rel="stylesheet" href="scripts/iCal.css" type="text/css" media="screen" charset="utf-8" />
        <script src="scripts/jquery-1.3.min.js" type="text/javascript"> </script>
        <script src="scripts/coda.js" type="text/javascript"> </script>

    </head>


    <%@page language="java" import="java.util.*, javax.servlet.http.Cookie" %>
    <%
                Cookie[] hcookies = request.getCookies();
                if (hcookies != null) {
                    for (int z = 0; z < hcookies.length; z++) {
                        Cookie d = hcookies[z];
                        if (d.getName().equals("DWTreg")) {
                            if (d.getValue().equals("success")) {
                                Cookie killhome = new Cookie("DWTreg", "");
                                killhome.setPath("/GoWhereToday");
                                killhome.setMaxAge(0);
                                response.addCookie(killhome);%>
    <script type="text/javascript">
        alert("Congratulations! You are now registered with us.");
    </script>
    <%}
                            } else if (d.getName().equals("DelArt")) {
                                if (d.getValue().equals("success")) {
                                    Cookie killhome = new Cookie("DelArt", "");
                                    killhome.setPath("/GoWhereToday");
                                    killhome.setMaxAge(0);
                                    response.addCookie(killhome);%>
    <script type="text/javascript">
        alert("The Article/Event is deleted.");
    </script>
    <%} else {%>
    <script type="text/javascript">
        alert("There is an error in deleting, please try again");
    </script>
    <%}
                            } else if (d.getName().equals("ModArt")) {
                                if (d.getValue().equals("success")) {
                                    Cookie killhome = new Cookie("ModArt", "");
                                    killhome.setPath("/GoWhereToday");
                                    killhome.setMaxAge(0);
                                    response.addCookie(killhome);%>
    <script type="text/javascript">
        alert("The Article/Event is approved.");
    </script>
    <%} else {%>
    <script type="text/javascript">
        alert("There is an error in the process of approving, please try again");
    </script>
    <%}
                        }
                    }
                }%>




    <body>
        <div id="main" align="left">
            <div id="text">



                <div id="leftColumn" >
                    <div id="flash">
                        <font color = "black">
                            <h3 id="highlights">Highlights</h3>
                            <br>
                            <div id="BannerDiv" style="padding:0px;"></div>
                        </font>
                    </div>
                    <br>
                    <br><br>


                    <div id="topArtDiv">
                        <h2 id="topArt" >Top Rated Articles</h2>
                        <%--<jsp:include page="servlets"><jsp:params name="" value=""></jsp:params></jsp:include>--%>
                        <%@page language="java" import="java.util.*, java.sql.*, java.io.*, Entities.*, MyControllers.*" %>
                        <%                        try {
                                        TopArticleController a = new TopArticleController();
                                        Article[] articleList = new Article[7];
                                        String[] type = new String[7];
                                        type[0] = "Arts";
                                        type[1] = "Food & Beverage";
                                        type[2] = "Leisure";
                                        type[3] = "Places of Interest";
                                        type[4] = "Nightlife";
                                        type[5] = "Shopping";
                                        type[6] = "Sports";
                                        for (int b = 0; b < articleList.length; b++) {
                                            if (a.getTopArticle(type[b]) != null) {
                                                articleList[b] = (Article) a.getTopArticle(type[b])[0];
                                            }
                                        }%>
                        <TABLE id="TopArt" cellpadding="15" cellspacing="2"  >
                            <% for (int i = 0; i < articleList.length; i++) {
                                                            if (articleList[i] != null) {%>
                            <thead>
                                <tr>
                                    <th style="padding-top: 10px; padding-left: 15px; color: #C68E17">
                                        <%=type[i]%>
                                    </th>
                                </tr>
                                <tr>
                                    <th width="200" style="background: url('images/header141.jpg'); padding-left: 20px; text-align: center"><font color="white">Name</font></th>
                                    <th width="500"  style=" background: url('images/header.jpg'); text-align: center"><font color="white">Description</font></th>
                                </tr>
                            </thead>
                            <tbody>
                            <form action="servlets/ViewArticleServlet" name="viewarticle<%=i%>" method="post">

                                <input type=hidden value="<%=articleList[i].getID()%>" name="articleid">
                                <tr>
                                    <TD width="200" style="background: url('images/header161.jpg'); padding-left: 20px; text-align: center; "><a href="javascript:document.viewarticle<%=i%>.submit()" style="color: white; font-size: 9pt"><%=articleList[i].getPara(0)%></a></TD>
                                    <TD width="500" style="background: url('images/header12.jpg'); padding-left: 15px " >
                                        <%if (!articleList[i].getPara(12).equalsIgnoreCase("null")) {
                                                                                                        StringTokenizer token = new StringTokenizer(articleList[i].getPara(12));
                                                                                                        for (int y = 0; y < 20 && y < token.countTokens(); y++) {%>
                                        <%=token.nextToken()%>
                                        <%}
                                            if (token.countTokens() > 20) {%>...<%}
                                            } else {%>N.A.<%}%></TD>
                                </tr>

                            </form>
                            <%}
                                            }

                                        } catch (Exception e) {
                                        }%>
                            </tbody>
                        </TABLE>


                        <br>
                        <br>
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

