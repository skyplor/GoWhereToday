<%--
    Document   : article
    Created on : Mar 28, 2010, 8:51:21 PM
    Author     : Flyzz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link href="scripts/standard.css" rel="stylesheet" type="text/css">
<html>
    <head>
        <%@include file="navi.jsp" %>
        <script type='text/javascript' src='tablesort.js'></script>
        <script type='text/javascript' src='paginate.js'></script>
        <script type='text/javascript' src='customsort.js'></script>
        <link href="standard.css" rel="stylesheet" type="text/css">
        <link href="sorttable.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Go Where Today? | Articles</title>
        <style type="text/css">
            /* Demo style */
            p
            {
                width:800px;
                margin:0 auto 1.6em auto;
            }

            /* Pagination list styles */
            ul.fdtablePaginater
            {
                display:table;
                list-style:none;
                padding:0;
                margin:0 auto;
                text-align:center;
                height:2em;
                width:auto;
                margin-bottom:2em;
            }
            ul.fdtablePaginater li
            {
                display:table-cell;
                padding-right:4px;
                color:#666;
                list-style:none;

                -moz-user-select:none;
                -khtml-user-select:none;
            }
            ul.fdtablePaginater li a.currentPage
            {
                border-color:#a84444 !important;
                color:#000;
            }
            ul.fdtablePaginater li a:active
            {
                border-color:#222 !important;
                color:#222;
            }
            ul.fdtablePaginater li a,
            ul.fdtablePaginater li div
            {
                display:block;
                width:2em;
                font-size:1em;
                color:#666;
                padding:0;
                margin:0;
                text-decoration:none;
                outline:none;
                border:1px solid #ccc;
                font-family:georgia, serif;
            }
            ul.fdtablePaginater li div
            {
                cursor:normal;
                opacity:.5;
                filter:alpha(opacity=50);
            }
            ul.fdtablePaginater li a span,
            ul.fdtablePaginater li div span
            {
                display:block;
                line-height:2em;
                border:1px solid #fff;
                background:#fff url(../media/gradient.gif) repeat-x 0 -20px;
            }
            ul.fdtablePaginater li a
            {
                cursor:pointer;
            }
            ul.fdtablePaginater li a:focus
            {
                color:#333;
                text-decoration:none;
                border-color:#aaa;
            }
            .fdtablePaginaterWrap
            {
                text-align:center;
                clear:both;
                text-decoration:none;
            }
            ul.fdtablePaginater li .next-page span,
            ul.fdtablePaginater li .previous-page span,
            ul.fdtablePaginater li .first-page span,
            ul.fdtablePaginater li .last-page span
            {
                font-weight:bold !important;
            }
            /* Keep the table columns an equal size during pagination */
            #visibleTotal
            {
                text-align:center;
                letter-spacing:auto;
            }
            * html ul.fdtablePaginater li div span,
            * html ul.fdtablePaginater li div span
            {
                background:#eee;
            }
            tr.invisibleRow
            {
                display:none;
                visibility:hidden;
            }
            p.paginationText
            {
                font-style:oblique;
            }
            table.theTable thead{
                color:#666666;
                font-weight: bold;
                cursor: auto;
            }
            th, td {
                padding: 3px !important;
            }
        </style>
    </head>
    <body>
        <div id="main" align="left">
            <div id="text">




                <div id="leftColumn" >
                <%@page language="java" import="java.util.*, java.sql.*, java.io.*, Entities.*,java.text.*" %>
                <%
                            PrintWriter outp = response.getWriter();
                            try {
                                DecimalFormat df = new DecimalFormat("##.##");
                                int length;
                                Article[] rs = (Article[]) session.getAttribute("result");
                                Article header = (Article) session.getAttribute("header");%>
                <h1><font color="orange"><%=header.getPara(0)%></font></h1><br><br>
                <table id="theTable" cellpadding="15" cellspacing="0" class="no-arrow rowstyle-alt colstyle-alt paginate-10 max-pages-7">
                    <thead>
                        <tr>
                            <th class="sortable-text" width="200" height ="60" align="center">Name</th>
                            <th width="500" height ="60" align="center">Description</th>
                            <th class="sortable-numeric"align="center" width="100" height ="60">Rating</th>
                            <th class="sortable-sortDollar"align="center" width="100" height ="60">Price</th>
                            <th class="sortable-text"align="center" width="100" height ="60">Region</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < rs.length; i++) {%>
                    <form action="servlets/ViewEventsServlet" name="viewarticle<%=i%>" method="post">
                        <input type=hidden value="<%=rs[i].getID()%>" name="articleid">
                        <tr>
                            <td height ="80"><a href="javascript:document.viewarticle<%=i%>.submit()"><%=rs[i].getPara(0)%></a></td>
                            <td width="500" height ="80"><%
                                 if (!rs[i].getPara(12).equalsIgnoreCase("null")) {
                                     StringTokenizer token = new StringTokenizer(rs[i].getPara(12));
                                     length = token.countTokens();
                                     for (int y = 0; y < 20 && y < length; y++) {
                                         if (token.hasMoreTokens()) {%>
                                <%=token.nextToken()%>
                                <%}
                                                                     }
                                                                     if (token.countTokens() > 20) {%>...<%}
                                                                          }else{%>N.A.<%}%></td>
                            <td align="center" height ="80"><%=df.format(Double.parseDouble(rs[i].getPara(14)))%></td>
                            <td align="center" height ="80"><%=rs[i].getPara(8)%></td>
                            <td align="center" height ="80"><%if (!rs[i].getPara(3).equalsIgnoreCase("null")) {%>
                                <%=rs[i].getPara(3)%></td>
                                <%}%>
                        </tr>
                    </form>
                    <%}
                                    session.removeAttribute("result");
                                } catch (Exception e) {
                                }%>
                    </tbody>
                </table>
            </div>


<%@include file="rightColumn.jsp" %>
            </div>
            <br>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="mlddm.jsp" %>
    </body>
</html>
