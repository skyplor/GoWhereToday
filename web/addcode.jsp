<%@page import="java.io.*" %>
<%@page import="java.net.*"%>


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
<script type="text/javascript" language=javascript>
    var name = new Array();
    name[0]= "images/starB.png";
    if(document.images)
    {
        var ss = new Image();
        ss.src = name[0];

    }
</script>
<%! int count;
    double rateval;%>

<%
            count = Integer.parseInt(request.getParameter("count"));
            rateval = Double.parseDouble(request.getParameter("avg"));
            if (request.getParameter("suc") != null) {
                if (request.getParameter("suc").equals("Y")) {
%>
<script type="text/javascript"> alert("Thanks for voting.");
</script>
<% } else if (request.getParameter("suc").equals("N")) {
%>
<script type="text/javascript"> alert("You have already voted for this article.");
</script>
<% }
            }%>

<table width=210px height=100px cellpadding=0 cellspacing=0 border=0 style="border: 1px solid green; font-family: arial, verdana, san-serif; font-size: 14px;">
    <tr align=left>
        <td>
            <b>&nbsp;Rating: </b>
            <br>
            <%
                        for (int i = 1; i <= 5; i++) {
                            if (rateval >= 1) {
                                out.print("<img src=\"images/starB.png\"/>");
                                rateval = rateval - 1;
                            } else if (rateval >= 0.5) {
                                out.print("<img src=\"images/starC.png\"/>");
                                rateval = rateval - 1;
                            } else if (rateval < 0.5 && rateval > 0) {
                                out.print("<img src=\"images/starA.png\"/>");
                                rateval = rateval - 1;
                            } else if (rateval <= 0) {
                                out.print("<img src=\"images/starA.png\"/>");
                            }
                        }
            %>
            <font color='#0000ff'>
                <%
                            out.println("&nbsp;[" + count + "&nbsp; <span style='font-size: 12px;'>vote(s)</span>]&nbsp;");
                %>
            </font>
        </td>


    </tr>
    <style>
        .star{cursor:pointer; }
    </style>


    <script type="text/javascript" language=javascript>
        function selstar(val)
        {
            for(var x=1;x<=val;x++)
            {
                document['i'+x].src="images/starB.png";
            }
        }
        function remstar(val)
        {
            for(var x=1;x<=val;x++)
            {
                document['i'+x].src="images/starA.png";
            }
        }

        function setrate(val,articleID)
        {
            document.rate.rating.value=val;
            document.rate.id.value=articleID;
            document.rate.submit();
        }
    </script>
    <tr>

        <td align=left>
            <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
            <%
                        int count = 0;
                        Cookie[] cookiesWAjsp = request.getCookies();
                        if (cookiesWAjsp == null) {%>
            Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to vote.
            <%} else {
                                        for (int i = 0; i < cookiesWAjsp.length; i++) {
                                            Cookie c = cookiesWAjsp[i];
                                            if (c.getName().equals("DWTuser")) {
                                                String username = c.getValue();
                                                count = 1;%>
            <form name=rate method=post action="servlets/addRatingServlet">
                <b>&nbsp;Rate this Page :</b>
                <br>
                <img name=i1 class=star onmouseover="selstar(1)" onmouseout="remstar(1)" onclick="setrate(1, <%= request.getParameter("articleID")%>)" src="images/starA.png">
                <img name=i2 class=star onmouseover="selstar(2)" onmouseout="remstar(2)" onclick="setrate(2, <%= request.getParameter("articleID")%>)" src="images/starA.png">
                <img name=i3 class=star onmouseover="selstar(3)" onmouseout="remstar(3)" onclick="setrate(3, <%= request.getParameter("articleID")%>)" src="images/starA.png">
                <img name=i4 class=star onmouseover="selstar(4)" onmouseout="remstar(4)" onclick="setrate(4, <%= request.getParameter("articleID")%>)" src="images/starA.png">
                <img name=i5 class=star onmouseover="selstar(5)" onmouseout="remstar(5)" onclick="setrate(5, <%= request.getParameter("articleID")%>)" src="images/starA.png">
                <input type=hidden name="rating">
                <input type=hidden name="id">
                <input type=hidden name="username" value="<%= username%>">

            </form>
            <%}
                                        }
                                        if (count == 0) {%>
            <%--Enter your Error Msg--%>
            Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to vote.
            <%}
                        }%>
        </td>
    </tr>
</table>