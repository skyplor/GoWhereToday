<%-- 
    Document   : Tour
    Created on : Mar 3, 2010, 2:52:33 PM
    Author     : Timothy Peh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@include file="navi.jsp" %>
        <title>Go Where Today? | Tour</title>
    </head>
    <body>
        <div id="main" align="left">
            <div id="text">
                <div id="leftColumn" >
                    <h1 align="center">Video Tour</h1>

                    <table border="0" width="1" cellspacing="1" cellpadding="50">
                        <tr>
                            <td>
                                <object id="MediaPlayer1" width="500" height="500"
                                        classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95"
                                        codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
                                        standby="Loading Microsoft® Windows® Media Player components..."
                                        type="application/x-oleobject" align="middle">
                                    <param name="FileName" value="demo video.avi">
                                    <param name="ShowStatusBar" value="True">
                                    <param name="DefaultFrame" value="mainFrame">
                                    <param name="autostart" value="false">
                                    <embed type="application/x-mplayer2"
                                           pluginspage = "http://www.microsoft.com/Windows/MediaPlayer/"
                                           src="demo video.avi"
                                           autostart="false"
                                           align="middle"
                                           width="550"
                                           height="500"
                                           defaultframe="rightFrame"
                                           showstatusbar="true">
                                    </embed>
                                </object>
                            </td>
                        </tr>
                    </table>

                    <table border="0" width="650">
                        <tr>
                            <td align="center">A video clip of what GoWhereToday is capable of.</td>
                        </tr>
                    </table>

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