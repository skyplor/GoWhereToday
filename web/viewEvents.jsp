<%--
    Document   : viewEvents
    Created on : Mar 3, 2010, 2:56:14 PM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!--
-->
<html>

    <head>
        <%@include file="navi.jsp" %>
        <link href="scripts/standard.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="scripts/prototype.js">
        </script>
        <script type="text/javascript" src="scripts/scriptaculous.js?load=effects,builder" >
        </script>
        <script type="text/javascript" src="scripts/lightbox.js">
        </script>
        <link rel="stylesheet" href="css/lightbox.css" type="text/css"
              media="screen" />
        <%@page language ="java" import="java.util.*, java.sql.*, Entities.*, javax.servlet.http.Cookie"%>
        <%
                    try {
                        Article[] article = (Article[]) session.getAttribute("result");
                        Article[] articlePic = (Article[]) session.getAttribute("resultPic");
                        Article[] articleCat = (Article[]) session.getAttribute("resultCat");
        %>
        <title><%=article[0].getPara(0)%></title>
        <script type="text/javascript" language=javascript>
            function setapprove()
            {
                document.approveArticle.approvalDicision.value="Y";
                return confirm("Confirm Approve?");
            }
            function setdisapprove()
            {
                document.approveArticle.approvalDicision.value="N";
                return confirm("Are you sure you want to disapprove? The article/event will be deleted.");
            }
            function setDelete()
            {
                document.deleteArticle.shouldDelete.value="Y";
                return confirm("Are you sure you want to Delete?");
            }
            function geomap()
            {
                document.gomap.submit();
                document.getElementById("map").style.display="block";
                document.getElementById("showmapbutton").style.display="none";
                document.getElementById("hidemapbutton").style.display="block";
            }
            function hidemap()
            {
                document.getElementById("map").style.display="none";
                document.getElementById("showmapbutton").style.display="block";
                document.getElementById("hidemapbutton").style.display="none";
            }
        </script>



    </head>

    <body>

        <div id="main" align="left">
            <div id="text">


                <div id="leftColumn">

                    <h4 align="center"> <FONT face="Verdana,Helvetica" SIZE="5" color="#F88017">
                            <%=article[0].getPara(0)%> <%--title--%>
                        </FONT></h4>


                    <table>

                        <%--Attribute div--%>
                        <tr>

                            <%--Attributes--%>
                            <td width="420px">
                                <% for (int check = 1; check < 13; check++) {
                                                            if (article[0].getPara(check).equals("null")) {
                                                                article[0].setPara(check, "");
                                                            }
                                                        }%>
                                <br><br>
                                <b>Address:</b>&nbsp; <%=article[0].getPara(1)%>&nbsp;<%--address--%>
                                S(<%=article[0].getPara(2)%>)
                                <br>
                                <%--postalCode--%>
                                <b>Region:</b>&nbsp; <%=article[0].getPara(3)%>
                                <br>
                                <%--Region--%>
                                <b>Location:</b>&nbsp; <%=article[0].getPara(4)%><%--Location--%>
                                <br>
                                <br>
                                <%--Event Date--%>
                                <b>Event Dates:</b>&nbsp;
                                <%
                                                        String year, month, day;
                                                        year = article[0].getPara(19).substring(0, 4);
                                                        month = article[0].getPara(19).substring(5, 7);
                                                        day = article[0].getPara(19).substring(8);

                                                        //handling month
                                                        if (month.equalsIgnoreCase("01")) {
                                                            month = "JAN";
                                                        } else if (month.equalsIgnoreCase("02")) {
                                                            month = "FEB";
                                                        } else if (month.equalsIgnoreCase("03")) {
                                                            month = "MAR";
                                                        } else if (month.equalsIgnoreCase("04")) {
                                                            month = "APR";
                                                        } else if (month.equalsIgnoreCase("05")) {
                                                            month = "MAY";
                                                        } else if (month.equalsIgnoreCase("06")) {
                                                            month = "JUN";
                                                        } else if (month.equalsIgnoreCase("07")) {
                                                            month = "JUL";
                                                        } else if (month.equalsIgnoreCase("08")) {
                                                            month = "AUG";
                                                        } else if (month.equalsIgnoreCase("09")) {
                                                            month = "SEP";
                                                        } else if (month.equalsIgnoreCase("10")) {
                                                            month = "OCT";
                                                        } else if (month.equalsIgnoreCase("11")) {
                                                            month = "NOV";
                                                        } else {
                                                            month = "DEC";
                                                        }

                                                        //process day
                                                        char ch = day.charAt(1);
                                                        if(ch == '1'){
                                                            day = day + "st";
                                                        }else if(ch == '2'){
                                                            day = day + "nd";
                                                        }else if(ch == '3'){
                                                            day = day + "rd";
                                                        }else{
                                                            day = day + "th";
                                                        }
                                                        if(day.charAt(0) == '0'){
                                                            day = day.substring(1);
                                                        }

                                                        String finalStart = day + " " + month + " " + year;

                                                        year = article[0].getPara(20).substring(0, 4);
                                                        month = article[0].getPara(20).substring(5, 7);
                                                        day = article[0].getPara(20).substring(8);

                                                        //handling month
                                                        if (month.equalsIgnoreCase("01")) {
                                                            month = "JAN";
                                                        } else if (month.equalsIgnoreCase("02")) {
                                                            month = "FEB";
                                                        } else if (month.equalsIgnoreCase("03")) {
                                                            month = "MAR";
                                                        } else if (month.equalsIgnoreCase("04")) {
                                                            month = "APR";
                                                        } else if (month.equalsIgnoreCase("05")) {
                                                            month = "MAY";
                                                        } else if (month.equalsIgnoreCase("06")) {
                                                            month = "JUN";
                                                        } else if (month.equalsIgnoreCase("07")) {
                                                            month = "JUL";
                                                        } else if (month.equalsIgnoreCase("08")) {
                                                            month = "AUG";
                                                        } else if (month.equalsIgnoreCase("09")) {
                                                            month = "SEP";
                                                        } else if (month.equalsIgnoreCase("10")) {
                                                            month = "OCT";
                                                        } else if (month.equalsIgnoreCase("11")) {
                                                            month = "NOV";
                                                        } else {
                                                            month = "DEC";
                                                        }

                                                        //process day
                                                        ch = day.charAt(1);
                                                        if(ch == '1'){
                                                            day = day + "st";
                                                        }else if(ch == '2'){
                                                            day = day + "nd";
                                                        }else if(ch == '3'){
                                                            day = day + "rd";
                                                        }else{
                                                            day = day + "th";
                                                        }
                                                        if(day.charAt(0) == '0'){
                                                            day = day.substring(1);
                                                        }

                                                        String finalEnd = day + " " + month + " " + year;
                                %>
                                <%=finalStart%>&nbsp; to &nbsp; <%=finalEnd%>
                                <br>
                                <br>
                                <br>
                                <b>Event Hours:</b>
                                <br>
                                <br>
                                <%=article[0].getPara(5)%><%--<%}%>--%>
                                <br>
                                <%--timingWd--%>
                                <%=article[0].getPara(6)%>
                                <br>
                                <%--tmingSat--%>
                                <%=article[0].getPara(7)%>
                                <br>
                                <%--timingPh--%>
                                <br>
                                <b>Tel:</b> &nbsp; <%=article[0].getPara(9)%>
                                <br>
                                <%--TelNo--%>
                                <b>Email:</b> &nbsp; <a href="mailTo:<%=article[0].getPara(10)%>"><%=article[0].getPara(10)%></a>
                                <br>
                                <%--Email--%>
                                <b>Website: </b> &nbsp; <% String website;
                                                        if (!article[0].getPara(11).contains("http") && !article[0].getPara(11).equals("")) {
                                                            website = "http://" + article[0].getPara(11);
                                                        } else {
                                                            website = article[0].getPara(11);
                                                        }%>
                                <a href='<%=website%>'target="_blank"><%=website%></a>
                                <br>
                                <%--Website--%>
                                <b>Budget:</b> &nbsp; <%=article[0].getPara(8)%>
                                <br>
                                <%--Budget--%>
                            </td>



                            <%--Ratings--%>
                            <td height="100" >
                                <%
                                                        int count = 0;
                                                        Cookie[] cookiesWAjsp = request.getCookies();
                                                        if (cookiesWAjsp != null) {
                                                            for (int i = 0; i < cookiesWAjsp.length; i++) {
                                                                Cookie d = cookiesWAjsp[i];
                                                                if (d.getName().equals("DWTtype")) {
                                                                    if (d.getValue().equalsIgnoreCase("Moderator") && article[0].getPara(13).equalsIgnoreCase("N")) {%>
                                <div align="right" id="button">
                                    <form action="servlets/modifyArticleServlet" name="approveArticle" method="post">
                                        <input type="hidden" name="articleId" value="<%=article[0].getID()%>">
                                        <input type="hidden" name="approvalDicision">
                                        <input type="submit" value="Approve" onclick="return setapprove()" />
                                        <input type="submit" value="Disapprove" onclick="return setdisapprove()" />
                                    </form>
                                </div>
                                <%} else if (d.getValue().equalsIgnoreCase("Moderator") && article[0].getPara(13).equalsIgnoreCase("Y")) {%>
                                <div id="button2">
                                    <form action="servlets/modifyArticleServlet" name="deleteArticle" method="post">
                                        <input type="hidden" name="articleId" value="<%=article[0].getID()%>">
                                        <input type="hidden" name="shouldDelete" value="nth">
                                        <input type="submit" value="Delete" onclick="return setDelete()" />
                                    </form>
                                </div>
                                <%}
                                                                }
                                                            }
                                                        }%>
                                <br>
                                <iframe src="addcode.jsp?articleID=<%=article[0].getID()%>&count=<%=article[0].getPara(15)%>&avg=<%=article[0].getPara(14)%>" frameborder="0" style="width:210px" ></iframe>
                                <!-- AddThis Button BEGIN -->
                                <a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4bea205365de27f7"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4bea205365de27f7"></script>
                                <!-- AddThis Button END -->
                                <br><br><b>Categories:</b><br> <% for (int k = 1; k < Integer.parseInt(articleCat[0].getPara(0)); k++) {%>
                                <form action="servlets/articlelist" name="viewarticle<%=k%>" method="post">
                                    <input type="hidden" value="<%=articleCat[0].getPara(k)%>" name="type">
                                    <a href="javascript:document.viewarticle<%=k%>.submit()"><%=articleCat[0].getPara(k)%><br> </a>
                                </form>
                                <%}%>

                            </td>



                        </tr>
                    </table>




                    <%--Map--%>

                    <div>
                        <br>
                        <br><strong>How to get there?</strong><br>

                        <form action="map-simple.jsp" name="gomap" method="post" target="mapframe">
                            <input type="submit" value=" Show map " name="gmap"  id="showmapbutton" onclick="geomap()"/>
                            <input type="submit" value=" Hide map " name="hmap" id="hidemapbutton" onclick="hidemap()" style="display:none;"/>
                            <input type="hidden" name="add" value="<%=article[0].getPara(1)%>"/>
                        </form><br>

                        <iframe id="map" name="mapframe" style="width: 400px; height: 400px; display: none;" frameborder="0"></iframe>

                    </div>


                    <%--Description--%>
                    <div valign="top" height="300"> <%--removed bgcolor="#FF99FF" --%>
                        <br><br>
                        <b>Description: </b>
                        <br>
                        <%=article[0].getPara(12)%><%--Description--%>
                        <br><br><br>
                        <b>By:</b>&nbsp;<a href="ProfilePage.jsp?username=<%=article[0].getPara(17)%>"><%=article[0].getPara(17)%></a>
                        <br>
                        <b>Date Written:</b>&nbsp;<%=article[0].getPara(18)%>
                    </div>



                    <div>
                        <% if (articlePic != null)
                                                    for (int j = 1; j < Integer.parseInt(articlePic[0].getPara(0)); j++) {%>

                        <a href="articleImages/<%=articlePic[0].getPara(j)%>" rel="lightbox[]" title="<%=article[0].getPara(0)%>">
                            <img src="articleImages/<%=articlePic[0].getPara(j)%>" width="200" height="200" alt=""/>
                        </a>
                        <%}%>

                        <br>
                        <br>
                    </div>



                    <div>
                        <br>

                        <hr>
                        <br><h2 class="form_title"> Reviews:</h2><br>
                        <iframe src="reviewArticle.jsp?articleID=<%=article[0].getID()%>" style="width: 900px; height: 600px; border: 0"></iframe>
                    </div>




                </div>
                    <%@include file="rightColumn.jsp" %>
            </div>
            <br>
            <hr>
            <%@include file="footer.jsp" %>
        </div>

        <%@include file="mlddm.jsp" %>
        <%

                        session.removeAttribute("result");
                        session.removeAttribute("resultPic");
                        session.removeAttribute("resultCat");
                    } catch (Exception e) {
                    }%>
    </body>

</html>
