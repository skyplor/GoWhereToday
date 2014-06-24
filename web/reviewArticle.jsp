<%-- 
    Document   : reviewArticle
    Created on : May 10, 2010, 4:36:59 PM
    Author     : Sky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link href="scripts/addcode.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/jquery-latest.js">
</script>
<script type="text/javascript" src="scripts/thickbox2.js">
</script>
<link rel="stylesheet" href="scripts/thickbox.css" type="text/css" media="screen" />
<style type="text/css">
    #TOS {display:none;}
</style>
<script type="text/javascript" language=javascript>
    function open_TB() {
        parent.tb_show("Register?", "?TB_inline=true&height=550&width=800&inlineId=TOS&modal=true", null);
    }

    function close_TB() {
        tb_remove();
    }
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            .pg-normal {
                color: black;
                font-weight: normal;
                text-decoration: none;
                cursor: pointer;
            }
            .pg-selected {
                color: black;
                font-weight: bold;
                text-decoration: underline;
                cursor: pointer;
            }
        </style>
        <script type="text/javascript" src="paging.js"></script>
    </head>
    <script type="text/javascript" language=javascript>
        function setReview(articleID,date)
        {
            document.review.id.value=articleID;
            document.review.date.value=date;
            var txtArea = document.getElementById('reviews');
            if(txtArea.value!='Write a review'){
                for(var i=1; i<document.review.reviews.value.length;i++){
                document.review.reviews.value=document.review.reviews.value.replace("'","&rsquo;");}
                document.review.submit();
                return true;
            }
            else{
                return false;
            }
        }

        function getDate()
        {
            var d = new Date()
            return d
        }

    </script>
    <body>
        <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie, Entities.*, MyServlets.reviewArticleServlet, MyControllers.*"%>

        <table id="results">
            <%
                        try {%>
            <%
                                        int articleid = Integer.parseInt(request.getParameter("articleID"));
                                        User client;
                                        ProfilePageController con = new ProfilePageController();
                                        reviewArticleController reviews = new reviewArticleController();
                                        Review[] reviewss = (Review[]) reviews.getReviewList(articleid);
                                        if (reviewss != null) {
                                            for (int j = reviewss.length - 1; j >= 0; j--) {%>
            <tr>
                <td style="border-bottom: solid 2px orange; width:500px; height:100px">
                    <br>
                    <% client = con.findUserByUsername(reviewss[j].getUsername());%>
                    <img src="Avatars/<%=client.getAvatar()%>" height="40" width="40" alt="<%=client.getUsername()%>'s Avatar">
                    &nbsp;<a href="ProfilePage.jsp?username=<%=reviewss[j].getUsername()%>" target="_parent"><%=reviewss[j].getUsername()%></a>&nbsp;says:<br>
                    <%=reviewss[j].getReview()%><br>
                    <%
                                                                    String date = reviewss[j].getDatetime().substring(0, 24);
                                                                    date.trim();
                    %>
                    <br><%=date%>
                </td>
            </tr>
            <%}
                                            }%>
            <div id="pageNavPosition"></div>
        </table>
        <table>
            <tr>
                <td>
                    <form action="servlets/reviewArticleServlet" method="post" name="review">
                        <%
                                                    int count = 0;
                                                    Cookie[] cookiesWAjsp = request.getCookies();
                                                    if (cookiesWAjsp == null) {%>
                        Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to review.
                        <%} else {%>
                        <%
                                                                                for (int i = 0; i < cookiesWAjsp.length; i++) {
                                                                                    Cookie c = cookiesWAjsp[i];
                                                                                    if (c.getName().equals("DWTuser")) {
                                                                                        String username = c.getValue();
                                                                                        count = 1;%>
                        <strong>Review:</strong><br>
                        <textarea name="reviews" id="reviews" rows ="8" cols="54"
                                  onfocus = "if (this.value == 'Write a review') this.value = ''"
                                  onblur = "if (this.value == '') this.value = 'Write a review'">Write a review</textarea><br>
                        <script src="scripts/jquery-latest.js" type="text/javascript" charset="utf-8"></script>
                        <script src="scripts/jquery.elastic.js" type="text/javascript" charset="utf-8"></script>
                        <script type="text/javascript">
                            // <![CDATA[
                            $(document).ready(function(){
                                $('textarea').elastic();
                            });
                            // ]]>
                        </script>
                        <input type="submit" value="Submit" name="submit" onclick="return setReview(<%= request.getParameter("articleID")%>,getDate())"/>
                        <input type=hidden name="id">
                        <input type=hidden name="date">
                        <input type=hidden name="username" value="<%= username%>">

                    </form>
                    <%}
                                                                            }
                                                                            if (count == 0) {%>
                    <%--Enter your Error Msg--%>
                    Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to review.
                    <%}
                                    }
                                    session.removeAttribute("result");
                                } catch (Exception e) {
                                    System.out.println("Exception is ;" + e);
                                }%>
                </td>
            </tr>
        </table>
        <script type="text/javascript"><!--
            var pager = new Pager('results', 3);
            pager.init();
            pager.showPageNav('pager', 'pageNavPosition');
            pager.showPage(1);
            //--></script>
    </body>
</html>