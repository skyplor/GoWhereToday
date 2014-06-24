<%--
    Document   : DWTPage1
    Created on : May 10, 2010, 10:33:39 AM
    Author     : Weiliang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<link href="scripts/standard.css" rel="stylesheet" type="text/css">

<style type="text/css">
    a {
        text-decoration: none;
    }
    .dropdown_menu {
        font-size: 90%;
        list-style: none;
        margin: 0;
        padding: 0;
        vertical-align: top;
        width: 620px;
    }
    .dropdown_menu ul {
        display: none;
        list-style: none;
        margin: 0;
        padding: 0;
    }
    .dropdown_menu li {
        background-image: none;
        margin: 0;
        padding: 0;
    }
    .dropdown_menu ul ul {
        display: inline;
    }
    .dropdown_menu ul ul li a {
        padding-left: 20px;
        width: 600px;
    }
    .dropdown_menu a {
        color: #000;
        cursor: pointer;
        display: block;
        font-weight: bold;
        margin-left: 0;
        padding: 2px 2px 2px 17px;
        width: 600px;
    }
    .dropdown_menu a.expanded {
        background: #FFE87C url(collapse.gif) no-repeat 3px 50%;
    }
    .dropdown_menu a.collapsed {
        background: #FFE87C url(expand.gif) no-repeat 3px 50%;
    }
    .dropdown_menu a:hover {
        text-decoration: none;
    }
    .dropdown_menu ul a {
        background: #e8e8e8;
        border-top: 2px solid #fff;
        color: #000;
        display: block;
        font-weight: normal;
        padding: 2px 2px 2px 10px;
        width: 600px;
    }
    .dropdown_menu ul a:hover {
        background : #f5f5f5;
        text-decoration: underline;
    }
    .dropdown_menu li.active a {
        background: #fff;
    }
    .dropdown_menu li.active li a {
        background: #e8e8e8;
    }
    .dropdown_menu .footer {
        background: transparent url(dropdownfooter.jpg) no-repeat 0 0;
        border-top: 2px solid #fff;
        height: 9px;
        margin: 0 0 10px 0;
        width: 620px;
    }
    .dropdown_menu .footer span {
        display: none;
    }
    .dropdown_menu .top {
        border-top: 2px solid #fff;
    }
    .dropdown_menu .bottom {
        background-color: #FFF8C6;
    }
    .dropdown_menu .backgroundcolour {
        background-color: #FFE87C;
    }
</style>

<script type="text/javascript">
    function checkReset(){
        return confirm("Are you sure you want to reset? All the fields will be cleared.");
    }
</script>

<script type="text/javascript">
    function toggleStatusEvents() {
        if ($('#typeEvents:checked').val() == null) {
            $('#EventsTable :input').attr('disabled', true);
        } else {
            $('#EventsTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusSports() {
        if ($('#typeSports:checked').val() == null) {
            $('#SportsTable :input').attr('disabled', true);
        } else {
            $('#SportsTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusShopping() {
        if ($('#typeShopping:checked').val() == null) {
            $('#ShoppingTable :input').attr('disabled', true);
        } else {
            $('#ShoppingTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusNightlife() {
        if ($('#typeNightlife:checked').val() == null) {
            $('#NightlifeTable :input').attr('disabled', true);
        } else {
            $('#NightlifeTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusPOI() {
        if ($('#typePOI:checked').val() == null) {
            $('#POITable :input').attr('disabled', true);
        } else {
            $('#POITable :input').removeAttr('disabled');
        }
    }

    function toggleStatusLeisure() {
        if ($('#typeLeisure:checked').val() == null) {
            $('#LeisureTable :input').attr('disabled', true);
        } else {
            $('#LeisureTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusFB() {
        if ($('#typeFB:checked').val() == null) {
            $('#FBTable :input').attr('disabled', true);
        } else {
            $('#FBTable :input').removeAttr('disabled');
        }
    }

    function toggleStatusArts() {
        if ($('#typeArts:checked').val() == null) {
            $('#ArtsTable :input').attr('disabled', true);
        } else {
            $('#ArtsTable :input').removeAttr('disabled');
        }
    }

    function checkInput() {
        if (!document.DWTform.typeArts.checked && !document.DWTform.typeFB.checked &&
            !document.DWTform.typeLeisure.checked && !document.DWTform.typePOI.checked &&
            !document.DWTform.typeNightlife.checked && !document.DWTform.typeShopping.checked &&
            !document.DWTform.typeSports.checked && !document.DWTform.typeEvents.checked){
            alert("Oops! You need to search for at least one category of articles");
            return false;
        }
        if ((document.DWTform.Month.selectedIndex  == "4" || document.DWTform.Month.selectedIndex  == "6" || document.DWTform.Month.selectedIndex  == "9" || document.DWTform.Month.selectedIndex  == "11")&&(document.DWTform.Day.selectedIndex  == "31")){
            alert("The event date is invalid.");
            return false;
        }
        else if (document.DWTform.Month.selectedIndex  == "2" && (document.DWTform.Day.selectedIndex  == "30" || document.DWTform.Day.selectedIndex  == "31") ){
            alert("The event date is invalid.");
            return false;
        }
        else if (document.DWTform.Month.selectedIndex  == "2" && (document.DWTform.Day.selectedIndex  == "29" || document.DWTform.Day.selectedIndex  == "30" || document.DWTform.Day.selectedIndex  == "31") && (document.DWTform.Year.value != "2012" && document.DWTform.Year.value != "2016")) {
            alert("The event date is invalid.");
            return false;
        }
    }
</script>

<script type="text/javascript" src="scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Grow/Shrink
        $("#menu > li > a[class=expanded]").find("+ ul").show("normal");

        $("#menu > li > a").click(function() {
            var el = $(this).find("+ ul");

            if($(this).hasClass("collapsed"))
                $(el).show('normal');
            else
                $(el).hide('normal');

            $(this).toggleClass("expanded").toggleClass("collapsed");
        });
    });
</script>
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
        <%@include file="navi.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Go Where Today? | Do What Today</title>
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
                                                        for (int i = 0; i < cookiesWAjsp.length; i++) {
                                                            Cookie c = cookiesWAjsp[i];
                                                            if (c.getName().equals("DWTuser")) {
                                                                count = 1;%>
                    <h4>Do What Today is an activity planner which allows you to organise and plan
                        <br>your activities based on your preferences.<br></h4>
                    <h3>Page 1 Instructions </h3>
                    <h4> First select the category of activities you wish to attend,
                        <br>then specify more information in the given fields.</h4>

                    <h4 style="padding-left: 530px;">Page 1 of 3</h4>

                    <div>
                        <form action= "servlets/DWTPage1Servlet" onsubmit="return checkInput()" method="post" name="DWTform">
                            <ul class="dropdown_menu" id="menu">

                                <%-- Arts--%>
                                <li><a class="collapsed">Arts</a>
                                    <ul>
                                        <li class="top"></li>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeArts" name="typeArts" type="checkbox" value="Arts" onchange="toggleStatusArts()"><i><b>&nbsp;Check this box if you wish to search for articles related to Arts.</b></i>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="ArtsTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionArts" name="regionArts" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationArts" name="locationArts" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetArts" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetArts" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetArts" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetArts" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetArts" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursArts" name="workHoursArts" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursArts" name="workHoursArts" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursArts" name="workHoursArts" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top">Subcategories</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateArts" name="subCateArts" type="checkbox" value="Exhibitions" disabled> Exhibitions</td>
                                                                <td width="75%" class="font_13"><input id="subCateArts" name="subCateArts" type="checkbox" value="Performing Arts" disabled> Performing Arts</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Food & Beverage --%>
                                <li><a class="collapsed">Food & Beverage</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeFB" name="typeFB" type="checkbox" value="Food & Beverage" onchange="toggleStatusFB()"><b><i>&nbsp;Check this box if you wish to search for articles related to Food & Beverage.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="FBTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionFB" name="regionFB" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationFB" name="locationFB" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetFB" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetFB" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetFB" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetFB" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetFB" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursFB" name="workHoursFB" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursFB" name="workHoursFB" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursFB" name="workHoursFB" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top">Subcategories</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Chinese" disabled> Chinese</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Indian" disabled> Indian</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Indochinese" disabled> Indochinese</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Fusion" disabled> Fusion</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Halal" disabled> Halal</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="International" disabled> International</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Japanese" disabled> Japanese</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Korean" disabled> Korean</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Malay" disabled> Malay</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Nonya" disabled> Nonya</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Pizza" disabled> Pizza</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Seafood" disabled> Seafood</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Steak and Grills" disabled> Steak</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Steamboat" disabled> Steamboat</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Vegetarian" disabled> Vegetarian</td>
                                                                <td width="25%" class="font_13"><input id="subCateFB" name="subCateFB" type="checkbox" value="Western" disabled> Western</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Leisure --%>
                                <li><a class="collapsed">Leisure</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeLeisure" name="typeLeisure" type="checkbox" value="Leisure" onchange="toggleStatusLeisure()"><b><i>&nbsp;Check this box if you wish to search for articles related to Leisure.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="LeisureTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionLeisure" name="regionLeisure" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationLeisure" name="locationLeisure" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetLeisure" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetLeisure" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetLeisure" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetLeisure" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetLeisure" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursLeisure" name="workHoursLeisure" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursLeisure" name="workHoursLeisure" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursLeisure" name="workHoursLeisure" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Places of Interest --%>
                                <li><a class="collapsed">Places of Interest</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typePOI" name="typePOI" type="checkbox" value="Places of Interest" onchange="toggleStatusPOI()"><b><i>&nbsp;Check this box if you wish to search for articles related to Places of Interest.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="POITable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionPOI" name="regionPOI" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationPOI" name="locationPOI" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetPOI" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetPOI" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetPOI" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetPOI" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetPOI" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursPOI" name="workHoursPOI" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursPOI" name="workHoursPOI" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursPOI" name="workHoursPOI" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Nightlife --%>
                                <li><a class="collapsed">Nightlife</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeNightlife" name="typeNightlife" type="checkbox" value="Nightlife" onchange="toggleStatusNightlife()"><b><i>&nbsp;Check this box if you wish to search for articles related to Nightlife.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="NightlifeTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionNightlife" name="regionNightlife" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationNightlife" name="locationNightlife" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetNightlife" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetNightlife" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetNightlife" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetNightlife" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetNightlife" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursNightlife" name="workHoursNightlife" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursNightlife" name="workHoursNightlife" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursNightlife" name="workHoursNightlife" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Shopping --%>
                                <li><a class="collapsed">Shopping</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeShopping" name="typeShopping" type="checkbox" value="Shopping" onchange="toggleStatusShopping()"><b><i>&nbsp;Check this box if you wish to search for articles related to Shopping.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="ShoppingTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionShopping" name="regionShopping" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationShopping" name="locationShopping" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetShopping" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetShopping" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetShopping" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetShopping" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetShopping" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursShopping" name="workHoursShopping" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursShopping" name="workHoursShopping" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursShopping" name="workHoursShopping" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top">Subcategories</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Electronics" disabled> Electronics</td>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Home & Hobbies" disabled> Home</td>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Hot Deals" disabled> Hot Deals</td>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Kids & Baby" disabled> Kids & Baby</td>
                                                            </tr>
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Men Fashion" disabled> Men</td>
                                                                <td width="25%" class="font_13"><input id="subCateShopping" name="subCateShopping" type="checkbox" value="Women Fashion" disabled> Women</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Sports --%>
                                <li><a class="collapsed">Sports</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeSports" name="typeSports" type="checkbox" value="Sports" onchange="toggleStatusSports()"><b><i>&nbsp;Check this box if you wish to search for articles related to Sports.</i></b>
                                            <table width ="100%" bgcolor="#FFF8C6" border="0" cellpadding="0" cellspacing="10" id="SportsTable">
                                                <tr>
                                                    <td>Region</td>
                                                    <td><select id="regionSports" name="regionSports" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationSports" name="locationSports" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetSports" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetSports" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetSports" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetSports" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetSports" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Operating Days</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr>
                                                                <td width="25%" class="font_13"><input id="workHoursSports" name="workHoursSports" type="checkbox" value="timingWd" disabled> Weekdays</td>
                                                                <td width="25%" class="font_13"><input id="workHoursSports" name="workHoursSports" type="checkbox" value="timingSat" disabled> Saturday</td>
                                                                <td width="50%" class="font_13"><input id="workHoursSports" name="workHoursSports" type="checkbox" value="timingPh" disabled> Sunday</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>

                                <%-- Events --%>
                                <li><a class="collapsed">Events</a>
                                    <ul>
                                        <li class="bottom">
                                            <br>
                                            <input id="typeEvents" name="typeEvents" type="checkbox" value="Events" onchange="toggleStatusEvents()"><b><i>&nbsp;Check this box if you wish to search for articles related to Events.</i></b>
                                            <table width ="100%" border="0" cellpadding="0" cellspacing="10" id="EventsTable">
                                                <tr>
                                                    <td width="16%">Region</td>
                                                    <td width="84%"><select id="regionEvents" name="regionEvents" name="regionEvents" disabled>
                                                            <option value="selectRegion">Select your region &nbsp;</option>
                                                            <option value="All Of Singapore" >All of Singapore</option>
                                                            <option value="Central" >Central</option>
                                                            <option value="North" >North</option>
                                                            <option value="South" >South</option>
                                                            <option value="East" >East</option>
                                                            <option value="West" >West</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Location</td>
                                                    <td><select id="locationEvents" name="locationEvents" disabled>
                                                            <option value="selectLocation">Select your location</option>
                                                            <option value="Admiralty" >Admiralty</option>
                                                            <option value="Aljunied" >Aljunied</option>
                                                            <option value="Ang Mo Kio" >Ang Mo Kio</option>
                                                            <option value="Bartley" >Bartley</option>
                                                            <option value="Bedok" >Bedok</option>
                                                            <option value="Bishan" >Bishan</option>
                                                            <option value="Boon Keng" >Boon Keng</option>
                                                            <option value="Boon Lay" >Boon Lay</option>
                                                            <option value="Braddell" >Braddell</option>
                                                            <option value="Bras Basah" >Bras Basah</option>
                                                            <option value="Bugis" >Bugis</option>
                                                            <option value="Buangkok" >Buangkok</option>
                                                            <option value="Bukit Batok" >Bukit Batok</option>
                                                            <option value="Bukit Gombak" >Bukit Gombak</option>
                                                            <option value="Bukit Merah" >Bukit Merah</option>
                                                            <option value="Bukit Panjang" >Bukit Panjang</option>
                                                            <option value="Bukit Timah" >Bukit Timah</option>
                                                            <option value="Buona Vista" >Buona Vista</option>
                                                            <option value="Changi" >Changi</option>
                                                            <option value="Changi Airport" >Changi Airport</option>
                                                            <option value="Changi Bay" >Changi Bay</option>
                                                            <option value="Chinatown" >Chinatown</option>
                                                            <option value="Chinese Garden" >Chinese Garden</option>
                                                            <option value="City Hall" >City Hall</option>
                                                            <option value="Choa Chu Kang" >Choa Chu Kang</option>
                                                            <option value="Clarke Quay" >Clarke Quay</option>
                                                            <option value="Clementi" >Clementi</option>
                                                            <option value="Commonwealth" >Commonwealth</option>
                                                            <option value="Dakota" >Dakota</option>
                                                            <option value="Douby Ghaut" >Douby Ghaut</option>
                                                            <option value="Dover" >Dover</option>
                                                            <option value="Esplanade" >Esplanade</option>
                                                            <option value="Eunos" >Eunos</option>
                                                            <option value="Expo" >Expo</option>
                                                            <option value="Farrer Park" >Farrer Park</option>
                                                            <option value="Geylang" >Geylang</option>
                                                            <option value="HarbourFront" >HarbourFront</option>
                                                            <option value="Hougang" >Hougang</option>
                                                            <option value="Joo Koon" >Joo Koon</option>
                                                            <option value="Jurong East" >Jurong East</option>
                                                            <option value="Jurong West" >Jurong West</option>
                                                            <option value="Kallang" >Kallang</option>
                                                            <option value="Katong" >Katong</option>
                                                            <option value="Kembangan" >Kembangan</option>
                                                            <option value="Khatib" >Khatib</option>
                                                            <option value="Kovan" >Kovan</option>
                                                            <option value="Kranji" >Kranji</option>
                                                            <option value="Lakeside" >Lakeside</option>
                                                            <option value="Lavender" >Lavender</option>
                                                            <option value="Lim Chu Kang" >Lim Chu Kang</option>
                                                            <option value="Little India" >Little India</option>
                                                            <option value="Macpherson" >Macpherson</option>
                                                            <option value="Mandai" >Mandai</option>
                                                            <option value="Marina East" >Marina East</option>
                                                            <option value="Marina South" >Marina South</option>
                                                            <option value="Marsiling" >Marsiling</option>
                                                            <option value="Marymount" >Marymount</option>
                                                            <option value="Mountbatten" >Mountbatten</option>
                                                            <option value="Newton" >Newton</option>
                                                            <option value="Nicoll Highway" >Nicoll Highway</option>
                                                            <option value="Novena" >Novena</option>
                                                            <option value="Orchard" >Orchard</option>
                                                            <option value="Outram Park" >Outram Park</option>
                                                            <option value="Paya Lebar" >Paya Lebar</option>
                                                            <option value="Pasir Ris" >Pasir Ris</option>
                                                            <option value="Pioneer" >Pioneer</option>
                                                            <option value="Punggol" >Punggol</option>
                                                            <option value="Potong Pasir" >Potong Pasir</option>
                                                            <option value="Promenade" >Promenade</option>
                                                            <option value="Queenstown" >Queenstown</option>
                                                            <option value="Raffles Place" >Raffles Place</option>
                                                            <option value="Redhill" >Redhill</option>
                                                            <option value="River Valley" >River Valley</option>
                                                            <option value="Rochor" >Rochor</option>
                                                            <option value="Seletar" >Seletar</option>
                                                            <option value="Sembawang" >Sembawang</option>
                                                            <option value="Sengkang" >Sengkang</option>
                                                            <option value="Sentosa" >Sentosa</option>
                                                            <option value="Serangoon" >Serangoon</option>
                                                            <option value="Simei" >Simei</option>
                                                            <option value="Simpang" >Simpang</option>
                                                            <option value="Somerset" >Somerset</option>
                                                            <option value="Stadium" >Stadium</option>
                                                            <option value="Sungei Kadut" >Sungei Kadut</option>
                                                            <option value="Tai Seng" >Tai Seng</option>
                                                            <option value="Tampines" >Tampines</option>
                                                            <option value="Tanah Merah" >Tanah Merah</option>
                                                            <option value="Tanglin" >Tanglin</option>
                                                            <option value="Tanjong Pagar" >Tanjong Pagar</option>
                                                            <option value="Tiong Bahru" >Tiong Bahru</option>
                                                            <option value="Toa Payoh" >Toa Payoh</option>
                                                            <option value="Tuas" >Tuas</option>
                                                            <option value="Woodlands" >Woodlands</option>
                                                            <option value="Yew Tee" >Yew Tee</option>
                                                            <option value="Yio Chu Kang" >Yio Chu Kang</option>
                                                            <option value="Yishun" >Yishun</option>
                                                        </select></td>
                                                </tr>
                                                <tr>
                                                    <td>Budget</td>
                                                    <td><input type="radio" name="budgetEvents" value="$" checked="checked" disabled/>$ &nbsp;
                                                        <input type="radio" name="budgetEvents" value="$$" disabled/>$$ &nbsp;
                                                        <input type="radio" name="budgetEvents" value="$$$" disabled/>$$$ &nbsp;
                                                        <input type="radio" name="budgetEvents" value="$$$$" disabled/>$$$$ &nbsp;
                                                        <input type="radio" name="budgetEvents" value="$$$$$" disabled/>$$$$$
                                                        <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Event Date</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                            <tr><td>Day:
                                                                    <select name="Day" size="1" disabled>
                                                                        <option value="null">Select</option>
                                                                        <option value="01">1</option>
                                                                        <option value="02">2</option>
                                                                        <option value="03">3</option>
                                                                        <option value="04">4</option>
                                                                        <option value="05">5</option>
                                                                        <option value="06">6</option>
                                                                        <option value="07">7</option>
                                                                        <option value="08">8</option>
                                                                        <option value="09">9</option>
                                                                        <option value="10">10</option>
                                                                        <option value="11">11</option>
                                                                        <option value="12">12</option>
                                                                        <option value="13">13</option>
                                                                        <option value="14">14</option>
                                                                        <option value="15">15</option>
                                                                        <option value="16">16</option>
                                                                        <option value="17">17</option>
                                                                        <option value="18">18</option>
                                                                        <option value="19">19</option>
                                                                        <option value="20">20</option>
                                                                        <option value="21">21</option>
                                                                        <option value="22">22</option>
                                                                        <option value="23">23</option>
                                                                        <option value="24">24</option>
                                                                        <option value="25">25</option>
                                                                        <option value="26">26</option>
                                                                        <option value="27">27</option>
                                                                        <option value="28">28</option>
                                                                        <option value="29">29</option>
                                                                        <option value="30">30</option>
                                                                        <option value="31">31</option>
                                                                    </select>
                                                                    &nbsp;Month:
                                                                    <select name="Month" size="1" disabled>
                                                                        <option value="null" selected>Select</option>
                                                                        <option value="01">Jan</option>
                                                                        <option value="02">Feb</option>
                                                                        <option value="03">Mar</option>
                                                                        <option value="04">Apr</option>
                                                                        <option value="05">May</option>
                                                                        <option value="06">Jun</option>
                                                                        <option value="07">Jul</option>
                                                                        <option value="08">Aug</option>
                                                                        <option value="09">Sep</option>
                                                                        <option value="10">Oct</option>
                                                                        <option value="11">Nov</option>
                                                                        <option value="12">Dec</option>
                                                                    </select>
                                                                    &nbsp;Year:
                                                                    <select name="Year" size="1" disabled>
                                                                        <option value="null">Select</option>
                                                                        <option value="2010">2010</option>
                                                                        <option value="2011">2011</option>
                                                                        <option value="2012">2012</option>
                                                                        <option value="2013">2013</option>
                                                                        <option value="2014">2014</option>
                                                                        <option value="2015">2015</option>
                                                                        <option value="2016">2016</option>
                                                                        <option value="2017">2017</option>
                                                                        <option value="2018">2018</option>
                                                                        <option value="2019">2019</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: top">Category</td>
                                                    <td><table width="100%" border="0" cellpadding="0" cellspacing="5">
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Arts" id="Arts" disabled> Arts</td>
                                                            </tr>
                                                            <tr>
                                                                <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Exhibitions"  disabled> Exhibitions</td>
                                                                            <td width="75%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Performing Arts"   disabled> Performing Arts</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Food & Beverage" id="FB" disabled> Food & Beverage</td>
                                                            </tr>
                                                            <tr>
                                                                <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Chinese" disabled> Chinese</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Indian" disabled> Indian</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Indochinese" disabled> Indochinese</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Fusion" disabled> Fusion</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Halal" disabled> Halal</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="International" disabled> International</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Japanese" disabled> Japanese</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Korean" disabled> Korean</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Malay/Indonesian" disabled> Malay</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Nonya/Peranakan" disabled> Nonya</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Pizza" disabled> Pizza</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Seafood" disabled> Seafood</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Steak and Grills" disabled> Steak</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Steamboat" disabled> Steamboat</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Vegetarian" disabled> Vegetarian</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Western" disabled> Western</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Leisure" disabled> Leisure</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Places of Interest" disabled> Places of Interest</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Nightlife" disabled> Nightlife</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Shopping" id="Shopping" disabled> Shopping</td>
                                                            </tr>
                                                            <tr>
                                                                <td><table width="100%" border="0" cellpadding="0" cellspacing="2">
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Electronics" disabled> Electronics</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Home & Hobbies" disabled> Home</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Hot Deals" disabled> Hot Deals</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Kids & Baby" disabled> Kids & Baby</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Men Fashion" disabled> Men</td>
                                                                            <td width="25%" class="font_13"><input id="CateEvents" name="CateEvents" type="checkbox" value="Women Fashion" disabled> Women</td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="backgroundcolour"><input id="CateEvents" name="CateEvents" type="checkbox" value="Sports" disabled> Sports</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><span>&nbsp;</span></li>
                            </ul>
                            <table border="0" width="600" cellspacing="0" cellpadding="0">
                                <br>
                                <tr>
                                    <td align="right">
                                        <input type="reset" value="Reset" id="reset" onclick="return checkReset()" title="Click to reset input" style="padding:3px"/>&nbsp;&nbsp;
                                        <input type="submit" value="&nbsp;Next&nbsp;" id="submit" title="Click to continue to next page" style="padding:3px"/>
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>

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
            <br>
            <hr>
            <%@include file="footer.jsp" %>
        </div>
        <%@include file="mlddm.jsp" %>
    </body>
</html>
