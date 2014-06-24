<%--
    Document   : uploadPicture
    Created on : Mar 28, 2010, 12:32:01 AM
    Author     : Weiliang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link href="scripts/standard.css" rel="stylesheet" type="text/css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="navi.jsp" %>
        <title>Go Where Today | Contribute Pictures</title>
    </head>
    <body>
        <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
        <%
                    Cookie[] cookiespicture = request.getCookies();
                    if (cookiespicture == null) {%>
        <%--Enter Error MSG No cookies found.--%>
        <%} else {
                                for (int l = 0; l < cookiespicture.length; l++) {
                                    Cookie n = cookiespicture[l];
                                    if (n.getName().equals("DWTarticle")) {
                                        if (n.getValue().equals("success") == true) {
                                            Cookie killarticle = new Cookie("DWTarticle", "");
                                            killarticle.setPath("/GoWhereToday");
                                            killarticle.setMaxAge(0);
                                            response.addCookie(killarticle);%>
        <script type="text/javascript">
            alert("Congratulations! The article has been uploaded successfully.");
        </script>
        <%}
                                            } else if (n.getName().equals("DWTpicture")) {
                                                if (n.getValue().equals("success") == true) {
                                                    Cookie killarticle = new Cookie("DWTpicture", "");
                                                    killarticle.setPath("/GoWhereToday");
                                                    killarticle.setMaxAge(0);
                                                    response.addCookie(killarticle);%>
        <script type="text/javascript">
            alert("Picture has been uploaded successfully");
        </script>
        <%} else {
                                                            Cookie killarticle = new Cookie("DWTpicture", "");
                                                            killarticle.setPath("/GoWhereToday");
                                                            killarticle.setMaxAge(0);
                                                            response.addCookie(killarticle);%>
        <script type="text/javascript">
            alert("Picture uploaded failed");
        </script>
        <%}
                            }
                        }
                    }%>
        <div id="main">
            <div id="text">
                <div id="leftColumn" >
                <h1 class="form_title">Contribute Pictures</h1>
                <h5>Do you have a picture to add to the article?</h5>
                <form action= "servlets/UploadPictureServlet" method="post" name="uploadForm" enctype="multipart/form-data" >
                    <table width ="100%" border="0" cellpadding="0" cellspacing="10">
                        <%-- Upload Picture --%>
                        <tr>
                            <td width="20%">Upload Picture</td>
                            <td width="80%"><input type="file" class="form_input" name="fileUpload0" accept="image/*"/></td>
                        </tr>
                        <tr>
                            <td width="20%"></td>
                            <td width="80%"><input type="file" class="form_input" name="fileUpload1" accept="image/*"/></td>
                        </tr>
                        <tr>
                            <td width="20%"></td>
                            <td width="80%"><input type="file" class="form_input" name="fileUpload2" accept="image/*"/></td>
                        </tr>
                        <tr>
                            <td width="20%"></td>
                            <td width="80%"><input type="file" class="form_input" name="fileUpload3" accept="image/*"/></td>
                        </tr>
                        <tr>
                            <td width="20%"></td>
                            <td width="80%"><input type="file" class="form_input" name="fileUpload4" accept="image/*"/></td>
                        </tr>
                        <%-- Submit --%>
                        <tr>
                            <td width="20%"></td>
                            <td>
                                <input type="submit" name="submit" value="Upload Picture"/>
                                <input type="button" value="Home" onclick="document.location.href='home.jsp';">
                            </td>
                        </tr>
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