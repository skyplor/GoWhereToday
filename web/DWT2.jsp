<%--
    Document   : DWT Page 2
    Created on : May 10, 2010, 20:07:33 PM
    Author     : Timothy Peh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link href="scripts/standard.css" rel="stylesheet" type="text/css">

<style type="text/css">
    body { font-size: 80%; font-family: 'Lucida Grande', Verdana, Arial, Sans-Serif; }
    ul.tabs { list-style-type: none; margin: 30px 0 0 0; padding: 0 0 0.3em 0; }
    ul.tabs li { display: inline; }
    ul.tabs li a { color: #42454a; background-color: #dedbde; font-weight: normal; border: 1px solid #c9c3ba; border-bottom: none; padding: 0.3em; text-decoration: none; }
    ul.tabs li a:hover { background-color: #f1f0ee; }
    ul.tabs li a.selected { color: #000; background-color: #f1f0ee; font-weight: bold; padding: 0.7em 0.3em 0.38em 0.3em; }
    div.tabContent { border: 1px solid #c9c3ba; padding: 0.5em; background-color: #f1f0ee; }
    div.tabContent.hide { display: none; }
</style>

<script type="text/javascript">
    //<![CDATA[

    var tabLinks = new Array();
    var contentDivs = new Array();

    function init(tabsID) {
        tabLinks[tabsID] = new Array();
        contentDivs[tabsID] = new Array();

        // Grab the tab links and content divs from the page
        var tabListItems = document.getElementById(tabsID).childNodes;
        for ( var i = 0; i < tabListItems.length; i++ ) {
            if ( tabListItems[i].nodeName == "LI" ) {
                var tabLink = getFirstChildWithTagName( tabListItems[i], 'A' );
                var id = getHash( tabLink.getAttribute('href') );
                tabLinks[tabsID][id] = tabLink;
                contentDivs[tabsID][id] = document.getElementById( id );
            }
        }

        // Assign onclick events to the tab links, and
        // highlight the first tab
        var i = 0;

        for ( var id in tabLinks[tabsID] ) {
            tabLinks[tabsID][id].onclick = showTab;
            tabLinks[tabsID][id].onfocus = function() { this.blur() };
            if ( i == 0 ) tabLinks[tabsID][id].className = 'selected';
            i++;
        }

        // Hide all content divs except the first
        var i = 0;

        for ( var id in contentDivs[tabsID] ) {
            if ( i != 0 ) contentDivs[tabsID][id].className = 'tabContent hide';
            i++;
        }
    }

    function showTab(obj) {
        var selectedId = (obj && typeof obj.href != "undefined") ? getHash(obj.href) : getHash( this.getAttribute('href') );
        var selectedId = getHash( this.getAttribute('href') );

        // Find the set of tabs that this tab is in
        outer:
            for ( var tabsID in tabLinks ) {
            for ( var id in tabLinks[tabsID] ) {
                if ( id == selectedId ) break outer;
            }
        }

        // Highlight the selected tab, and dim all others.
        // Also show the selected content div, and hide all others.
        for ( var id in contentDivs[tabsID] ) {
            if ( id == selectedId ) {
                tabLinks[tabsID][id].className = 'selected';
                contentDivs[tabsID][id].className = 'tabContent';
            } else {
                if ( typeof tabLinks[tabsID][id] != "undefined" ) {
                    tabLinks[tabsID][id].className = '';
                    contentDivs[tabsID][id].className = 'tabContent hide';
                }
            }
        }

        // Stop the browser following the link
        return false;
    }

    function getFirstChildWithTagName( element, tagName ) {
        for ( var i = 0; i < element.childNodes.length; i++ ) {
            if ( element.childNodes[i].nodeName == tagName ) return element.childNodes[i];
        }
    }

    function getHash( url ) {
        var hashPos = url.lastIndexOf ( '#' );
        return url.substring( hashPos + 1 );
    }

    function checkInput() {
        var check = 0;
        if(document.searchlist.filter.length==undefined){
            if(document.searchlist.filter.checked){
                check = 1;
            }
        }else{
            for(var i=0; i<document.searchlist.filter.length; i++){
                if(document.searchlist.filter[i].checked){
                    check = 1;
                    break;
                }
            }
        }
        if(check == 0){
            alert("Oops! Please select at least one article.");
            return false;
        }
    }

    //]]>
</script>

<html>
    <head>
        <title>Go Where Today? | Do What Today</title>

        <%@include file="navi.jsp" %>
    </head>

    <body>
        <div id="main" align="left">
            <div id="text">



                <div id="leftColumn" >
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
                    <h4><br>Do What Today is an activity planner which allows you to organise and plan
                        <br>your activities based on your preferences.<br></h4>
                    <h3>Page 2 Instructions</h3>
                    <h4>The results are shown below, select the actual activities you would want to
                        <br>attend by clicking on the checkbox corresponding to each activity.<br><br></h4>
                    <h4 style="padding-left: 530px;">Page 2 of 3</h4>
                    <%@page language="java" import="java.util.*, java.sql.*, java.io.*, Entities.*" %>

                    <%
                                PrintWriter outp = response.getWriter();
                                try {
                                    Article[] rs = (Article[]) session.getAttribute("DWTresult");
                    %>

                    <form action="servlets/DWT2Servlet" onsubmit="return checkInput()" method="post" name="searchlist">
                        <ul class="tabs" id="tabs1">

                            <%
                                                            int numCategory = Integer.parseInt(rs[0].getPara(0));
                                                            String[] tempCat = new String[numCategory];

                                                            int y = 1;

                                                            for (int i = 0; i < numCategory; i++) {
                                                                tempCat[i] = rs[0].getPara(y);
                                                                y += 2;
                                                            }
                                                            for (int i = 0; i < numCategory; i++) {
                                                                if (tempCat[i].equalsIgnoreCase("Arts")) {
                            %>

                            <li><a href="#Arts">Arts</a></li>

                            <%                                                                                    } else if (tempCat[i].equalsIgnoreCase("Events")) {
                            %>

                            <li><a href="#Events">Events</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Food & Beverage")) {
                            %>

                            <li><a href="#Food & Beverage">F&B</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Leisure")) {
                            %>

                            <li><a href="#Leisure">Leisure</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Places of Interest")) {
                            %>

                            <li><a href="#Places of Interest">Places of Interests</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Nightlife")) {
                            %>

                            <li><a href="#Nightlife">Nightlife</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Shopping")) {
                            %>

                            <li><a href="#Shopping">Shopping</a></li>

                            <%                                                                            } else if (tempCat[i].equalsIgnoreCase("Sports")) {
                            %>

                            <li><a href="#Sports">Sports</a></li>

                            <% }
                                                        }%>

                        </ul>

                        <%
                                                        int m = 1;
                                                        int i = 1;
                                                        String name;
                                                        String desc;
                                                        double ratings;
                                                        int id;
                                                        int length;
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Arts")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Arts">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>


                                            <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>

                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                            if (length > 20) {

                                        %>...<%}
                                                                                                                                                                        } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++;
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Food & Beverage")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Food & Beverage">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                        if (length > 20) {

                                        %>...<%}
                                                                                                                                                                } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++;
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Leisure")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Leisure">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                            if (length > 20) {

                                        %>...<%}
                                                                                                                                                                        } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++;
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Places of Interest")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Places of Interest">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                        if (length > 20) {

                                        %>...<%}
                                                                                                                                                                } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++;
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Nightlife")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Nightlife">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                            if (length > 20) {

                                        %>...<%}
                                                                                                                                                                        } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++; // increment array pointer
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Shopping")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Shopping">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                            if (length > 20) {

                                        %>...<%}
                                                                                                                                                                        } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++; // increment array pointer
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Sports")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Sports">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                            if (length > 20) {

                                        %>...<%}
                                                                                                                                                                        } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++; // increment array pointer
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                                        }
                                                        if (rs[0].getPara(i) != null && rs[0].getPara(i).equalsIgnoreCase("Events")) {
                                                            i++;
                        %>

                        <div class="tabContent" id="Events">

                            <table border="1" width="640" cellspacing="0" cellpadding="5">
                                <tr>
                                    <td align="center" height="40" width="140">Name of Article</td>
                                    <td align="center" height="40" width="440">Description</td>
                                    <td align="center" height="40" width="30">Ratings</td>
                                    <td align="center" height="40" width="30">Select</td>
                                </tr>

                                <%
                                                                                        for (int j = 0; j < Integer.parseInt(rs[0].getPara(i)); j++) { // Loop for the number of articles under that category
                                                                                            name = rs[m].getPara(0);
                                                                                            desc = rs[m].getPara(1);
                                                                                            ratings = Double.parseDouble(rs[m].getPara(2));
                                                                                            id = rs[m].getID();
                                %>

                                <tr>
                                    <td>
                                        <a href="servlets/ViewArticleServlet?articleid=<%=id%>" target="_blank"><%=name%></a>
                                    </td>
                                    <td>

                                        <%
                                                                                                                                if (!desc.equalsIgnoreCase("null")) {
                                                                                                                                    StringTokenizer token = new StringTokenizer(desc);
                                                                                                                                    length = token.countTokens();

                                                                                                                                    for (int z = 0; z < 20 && z < length; z++) {
                                                                                                                                        if (token.hasMoreTokens()) {
                                        %>

                                        <%=token.nextToken()%>

                                        <%
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                        if (length > 20) {

                                        %>...<%}
                                                                                                                                                                } else {%>N.A.<%}%>

                                    </td>
                                    <td align="center">
                                        <%=ratings%>
                                    </td>
                                    <td align="center" height="40">
                                        <input type="checkbox" name="filter" id="filter" value="<%=id%>" />
                                    </td>
                                </tr>

                                <%
                                                                                            m++;
                                                                                        }
                                                                                        i++;
                                %>

                            </table>
                        </div>

                        <%
                                        }
                                        session.removeAttribute("result");
                                    } catch (Exception e) {
                                        outp.println("Exception is: " + e);
                                    }
                        %>

                        <br>

                        <table border="0" width="640" cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td align="right">
                                        <input type="reset" value="Reset" id="reset" onclick="return checkReset()" title="Click to reset input" style="padding:3px"/>&nbsp;&nbsp;
                                        <input type="button" value="Back" onclick="document.location.href='DWT1.jsp';" title="Click to return to previous page" style="padding:3px"/>&nbsp;&nbsp;
                                        <input type="submit" value="&nbsp;Next&nbsp;" name="Select" title="Click to continue to next page" style="padding:3px"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                        <%}
                                                        }
                                                        if (count == 0) {%>
                    <%--Enter your Error Msg--%>
                    Please login or <font color="gray"><a id="link" onclick="open_TB()">register</a></font> to review.
                    <%}
                                }%>
                </div>



<%@include file="rightColumn.jsp" %>

            </div>

            <script type="text/javascript">
                init('tabs1');
            </script>

            <br>
            <hr>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="mlddm.jsp" %>
    </body>
</html>