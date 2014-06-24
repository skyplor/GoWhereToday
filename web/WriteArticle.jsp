<%--
    Document   : WriteArticle
    Created on : Mar 22, 2010, 9:22:41 PM
    Author     : Weiliang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<link href="scripts/standard.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="scripts/jquery-latest.js">
</script>
<script type="text/javascript" src="scripts/thickbox2.js">
</script>
<link rel="stylesheet" href="scripts/thickbox.css" type="text/css" media="screen" />
<style type="text/css"> #TOS {display:none;} </style>
<script type="text/javascript">
    function toggleStatusEvents() {
        if ($('#Events:checked').val() == null) {
            $('#EventsTable tr td input').attr('disabled', true);
        } else {
            $('#EventsTable tr td input').removeAttr('disabled');
        }
    }
    function toggleStatusArts() {
        if ($('#Arts:checked').val() == null) {
            $('#ArtsTable tr td input').attr('disabled', true);
        } else {
            $('#ArtsTable tr td input').removeAttr('disabled');
        }
    }
    function toggleStatusFB() {
        if ($('#FB:checked').val() == null) {
            $('#FBTable tr td input').attr('disabled', true);
        } else {
            $('#FBTable tr td input').removeAttr('disabled');
        }
    }
    function toggleStatusShopping() {
        if ($('#Shopping:checked').val() == null) {
            $('#ShoppingTable tr td input').attr('disabled', true);
        } else {
            $('#ShoppingTable tr td input').removeAttr('disabled');
        }
    }
</script>
<script type="text/javascript" src="scripts/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="scripts/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
<script type="text/javascript">
    $(function(){
        $('#startDate').daterangepicker({
            presetRanges: [
                {text: 'Today', dateStart: 'Today', dateEnd: 'Today' }
            ],
            presets: {specificDate: 'Pick a date'},
            dateFormat: 'yy-mm-dd',
            rangeSplitter: 'to',
            datepickerOptions:{
                changeMonth: true,
                changeYear: true
            }
        });
    });
    $(function(){
        $('#endDate').daterangepicker({
            presetRanges: [{text: 'Today', dateStart: 'Today', dateEnd: 'Today' }
            ],
            presets: {specificDate: 'Pick a date'},
            dateFormat: 'yy-mm-dd',
            rangeSplitter: 'to',
            datepickerOptions:
                {
                changeMonth: true,
                changeYear: true
            }
        });
    });
</script>
<style type="text/css">
    .ui-daterangepickercontain{font-size: 11px}
    #startDate {width: 200px; height: 1.3em; display:block;}
    #endDate {width: 200px; height: 1.3em; display:block;}
</style>
<script type="text/javascript" language="javascript">
    //check if input parameters have been filled in correctly
    function validateArticle(){
        //check article name, make confirmation that article has a name
        var articleName = document.ArticleInfo.name.value;
        if (articleName == ""){
            alert("Oops! This article needs a name.");
            document.ArticleInfo.name.focus();
            return false;
        }
        ////check time inputs, first predicate confirms that the input is in 12 hour format
        //Second predicate confirms that the input is within 60 mins (i.e. 1 hour).
        weekStart = document.ArticleInfo.o_1.value;
        if(weekStart != ""){
            if (!((100 <= weekStart && weekStart <= 999) || (1000 <= weekStart && weekStart <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_1.focus();
                return false;
            }
            time = weekStart % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. \nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_1.focus();
                return false;
            }
        }
        weekEnd = document.ArticleInfo.o_2.value;
        if(weekEnd!= ""){
            if (!((100 <= weekEnd && weekEnd <= 999) || (1000 <= weekEnd && weekEnd <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_2.focus();
                return false;
            }
            time = weekEnd % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. \nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_2.focus();
                return false;
            }
        }
        satStart = document.ArticleInfo.o_3.value;
        if(satStart!= ""){
            if (!((100 <= satStart && satStart <= 999) || (1000 <= satStart && satStart <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_3.focus();
                return false;
            }
            time = satStart % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.");
                document.ArticleInfo.o_3.focus();
                return false;
            }
            time = satStart % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. \nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_3.focus();
                return false;
            }
        }
        satEnd = document.ArticleInfo.o_4.value;
        if(satEnd!= ""){
            if (!((100 <= satEnd && satEnd <= 999) || (1000 <= satEnd && satEnd <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_4.focus();
                return false;
            }
            time = satEnd % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid.\nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_4.focus();
                return false;
            }
        }
        sunStart = document.ArticleInfo.o_5.value;
        if(sunStart!= ""){
            if (!((100 <= sunStart && sunStart <= 999) || (1000 <= sunStart && sunStart <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_5.focus();
                return false;
            }
            time = sunStart % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. \nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_5.focus();
                return false;
            }
        }
        sunEnd = document.ArticleInfo.o_6.value;
        if(sunEnd!= ""){
            if (!((100 <= sunEnd && sunEnd <= 999) || (1000 <= sunEnd && sunEnd <= 1259))){
                alert("Oops! The time inserted is invalid. GWT uses the 12 hour format.")
                document.ArticleInfo.o_6.focus();
                return false;
            }
            time = sunEnd % 100;
            if (time > 59){
                alert("Oops! The time inserted is invalid. \nThe minutes declared must not be more than 59.");
                document.ArticleInfo.o_6.focus();
                return false;
            }
        }
        //check checkbox inputs, and send an alert when none of the categories was selected
        if (!document.ArticleInfo.checkInput[0].checked && !document.ArticleInfo.checkInput[1].checked
            && !document.ArticleInfo.checkInput[2].checked && !document.ArticleInfo.checkInput[3].checked
            && !document.ArticleInfo.checkInput[4].checked && !document.ArticleInfo.checkInput[5].checked
            && !document.ArticleInfo.checkInput[6].checked && !document.ArticleInfo.checkInput[7].checked
            && !document.ArticleInfo.checkInput[8].checked && !document.ArticleInfo.checkInput[9].checked
            && !document.ArticleInfo.checkInput[10].checked && !document.ArticleInfo.checkInput[11].checked
            && !document.ArticleInfo.checkInput[12].checked && !document.ArticleInfo.checkInput[13].checked
            && !document.ArticleInfo.checkInput[14].checked && !document.ArticleInfo.checkInput[15].checked
            && !document.ArticleInfo.checkInput[16].checked && !document.ArticleInfo.checkInput[17].checked
            && !document.ArticleInfo.checkInput[18].checked && !document.ArticleInfo.checkInput[19].checked
            && !document.ArticleInfo.checkInput[20].checked && !document.ArticleInfo.checkInput[21].checked
            && !document.ArticleInfo.checkInput[22].checked && !document.ArticleInfo.checkInput[23].checked
            && !document.ArticleInfo.checkInput[24].checked && !document.ArticleInfo.checkInput[25].checked
            && !document.ArticleInfo.checkInput[26].checked && !document.ArticleInfo.checkInput[27].checked
            && !document.ArticleInfo.checkInput[28].checked && !document.ArticleInfo.checkInput[29].checked
            && !document.ArticleInfo.checkInput[30].checked && !document.ArticleInfo.checkInput[31].checked){
            alert("Oops! This article needs to be in at least one category.");
            return false;
        }
        if (document.ArticleInfo.checkInput[3].checked)
        {
            sDate = document.ArticleInfo.startDate.value;
            eDate = document.ArticleInfo.endDate.value;
            if(sDate==""||eDate=="")
            {
                alert("Oops! You need to input the Event dates.");
                return false;
            }
            var yr1 = parseInt(sDate.substring(0,4),10);
            var mon1 = parseInt(sDate.substring(5,7),10);
            var dt1  = parseInt(sDate.substring(8),10);
            var yr2  = parseInt(eDate.substring(0,4),10);
            var mon2 = parseInt(eDate.substring(5,7),10);
            var dt2  = parseInt(eDate.substring(8),10);
            var date1 = new Date(yr1, mon1, dt1);
            var date2 = new Date(yr2, mon2, dt2);
            if(date2 < date1)
            {
                alert("Oops! Event end date cannot be earlier than start date.");
                return false;
            }
        }
        for(var i = 0; i <document.ArticleInfo.name.value.length; i++){
        document.ArticleInfo.name.value = document.ArticleInfo.name.value.replace("'","&rsquo;");
        }
        for(var j = 0; j <document.ArticleInfo.address.value.length; j++){
        document.ArticleInfo.address.value = document.ArticleInfo.address.value.replace("'","&rsquo;");}
        for(var k = 0; k <document.ArticleInfo.postal.value.length; k++){
        document.ArticleInfo.postal.value = document.ArticleInfo.postal.value.replace("'","&rsquo;");}
        for(var l = 0; l <document.ArticleInfo.telNo.value.length; l++){
        document.ArticleInfo.telNo.value = document.ArticleInfo.telNo.value.replace("'","&rsquo;");}
        for(var m = 0; m <document.ArticleInfo.website.value.length; m++){
        document.ArticleInfo.website.value = document.ArticleInfo.website.value.replace("'","&rsquo;");}
        for(var n = 0; n <document.ArticleInfo.email.value.length; n++){
        document.ArticleInfo.email.value = document.ArticleInfo.email.value.replace("'","&rsquo;");}
        for(var o = 0; o <document.ArticleInfo.description.value.length; o++){
        document.ArticleInfo.description.value = document.ArticleInfo.description.value.replace("'","&rsquo;");}
        //window.onload = open_TB;
        function open_TB() {
            tb_show("Register?", "?TB_inline=true&height=550&width=800&inlineId=TOS&modal=true", null);
        }

        function close_TB() {
            tb_remove();
        }
    }
</script>
<html>
    <head>
        <%@include file="navi.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Go Where Today | Contribute!</title>
    </head>
    <body>
        <div id="main" >
            <div id="text">


                
                <div id="leftColumn" >
                <%@page language="java" import ="java.util.*, javax.servlet.http.Cookie"%>
                <%
                            int count = 0;
                            Cookie[] cookiesWAjsp = request.getCookies();
                            if (cookiesWAjsp == null) {%>
                <%--Enter Error MSG No cookies found.--%>
                <h1 class="form_title">Contribute an article now!</h1><br>
                <h3>It appears you are not logged into GoWhereToday.</h3><br>
                <h4>Login to GoWhereToday to enjoy the full priviledges as a member.</h4>
                <h4>Not a member? Register <font color="gray"><a onclick="open_TB()">here</a></font>.</h4>
                <h4>Not a member? <a href="Registration.jsp">Register</a> here</h4>
                <%} else {
                                                for (int i = 0; i < cookiesWAjsp.length; i++) {
                                                    Cookie c = cookiesWAjsp[i];
                                                    if (c.getName().equals("DWTarticle")) {
                                                        if (c.getValue().equals("fail") == true) {
                                                            Cookie killarticle = new Cookie("DWTarticle", "");
                                                            killarticle.setPath("/GoWhereToday");
                                                            killarticle.setMaxAge(0);
                                                            response.addCookie(killarticle);%>
                <script type="text/javascript">
                    alert("Sorry. There seems to be a problem in the uploading process. \n Please bear with us as your error is being logged.");
                </script>
                <%}
                                                                    } else if (c.getName().equals("DWT")) {
                                                                        if (c.getValue().equals("true") == true) {
                                                                            count = 1;%>

                <h1 class="form_title">Contribute an article now!</h1>
                <h4><br>Simply fill in and submit this form to us.<br>
                    We appreciate all contributions to this site to make it informative and interesting!
                    Thank you!</h4><br>
                <form action= "servlets/WriteArticleServlet" onsubmit="return validateArticle()" method="post" name="ArticleInfo">
                    <table width ="100%" border="0" cellpadding="0" cellspacing="10">
                        <tr>
                            <strong>Article Details</strong>
                        </tr>
                        <%-- Name --%>
                        <tr>
                            <td width="20%">Name</td>
                            <td width="80%"><input name="name" type="text" class="form_input" id="name" size="60" maxlength="100">
                                <br><i class="font_11">e.g. Siloso Beach Resort</i></td>
                        </tr>
                        <%-- Address --%>
                        <tr>
                            <td width="20%">Address</td>
                            <td width="80%"><input name="address" type="text" class="form_input" id="address" size="60" maxlength="100">
                                <br><i class="font_11">e.g. 51 Imbiah Walk</i></td>
                        </tr>
                        <%-- Postal --%>
                        <tr>
                            <td width="20%">Postal Code</td>
                            <td width="80%"><input name="postal" type="text" class="form_input" id="postal" size="21" maxlength="6">
                                <br><i class="font_11">e.g. 099538</i></td>
                        </tr>
                        <%-- Region --%>
                        <tr>
                            <td>Region</td>
                            <td><select name="region" class="form_input" id="region">
                                    <option value="selectRegion">Select your region &nbsp;</option>
                                    <option value="All Of Singapore" >All of Singapore</option>
                                    <option value="Central" >Central</option>
                                    <option value="North" >North</option>
                                    <option value="South" >South</option>
                                    <option value="East" >East</option>
                                    <option value="West" >West</option>
                                </select></td>
                        </tr>
                        <%-- Location --%>
                        <tr>
                            <td>Location</td>
                            <td><select name="location" class="form_input" id="location">
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
                        <%-- Opening Hours --%>
                        <tr>
                            <td style="vertical-align: top">Opening Hours <br> (if applicable)</td>
                            <td><table>
                                    <tr style="vertical-align: top">
                                        <td><input name="o_1" type="text" class="form_input" id="o_1" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 800 am</i></td>
                                        <td><select name="weekdayStartAmPm" class="form_input" id="weekdayStartAmPm">
                                                <option value="am" >am</option>
                                                <option value="pm" >pm</option>
                                            </select></td>
                                        <td>&nbsp; to &nbsp;</td>
                                        <td><input name="o_2" type="text" class="form_input" id="o_2" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 1000 pm</i></td>
                                        <td><select name="weekdayEndAmPm" class="form_input" id="weekdayEndAmPm">
                                                <option value="pm" >pm</option>
                                                <option value="am" >am</option>
                                            </select></td>
                                        <td>&nbsp; for weekdays</td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td><input name="o_3" type="text" class="form_input" id="o_3" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 800 am</i></td>
                                        <td><select name="saturdayStartAmPm" class="form_input" id="saturdayStartAmPm">
                                                <option value="am" >am</option>
                                                <option value="pm" >pm</option>
                                            </select></td>
                                        <td>&nbsp; to &nbsp;</td>
                                        <td><input name="o_4" type="text" class="form_input" id="o_4" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 1000 pm</i></td>
                                        <td><select name="saturdayEndAmPm" class="form_input" id="saturdayEndAmPm">
                                                <option value="pm" >pm</option>
                                                <option value="am" >am</option>
                                            </select></td>
                                        <td>&nbsp; for Saturday</td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td><input name="o_5" type="text" class="form_input" id="o_5" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 800 am</i></td>
                                        <td><select name="sundayStartAmPm" class="form_input" id="sundayStartAmPm">
                                                <option value="am" >am</option>
                                                <option value="pm" >pm</option>
                                            </select></td>
                                        <td>&nbsp; to &nbsp;</td>
                                        <td><input name="o_6" type="text" class="form_input" id="o_6" size="5" maxlength="4">
                                            <br><i class="font_11">e.g. 1000 pm</i></td>
                                        <td><select name="sundayEndAmPm" class="form_input" id="sundayEndAmPm">
                                                <option value="pm" >pm</option>
                                                <option value="am" >am</option>
                                            </select></td>
                                        <td>&nbsp; for Sunday and public holidays</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%-- Budget --%>
                        <tr>
                            <td>Budget</td>
                            <td><input type="radio" name="budget" value="$" checked="checked" />$ &nbsp;
                                <input type="radio" name="budget" value="$$" />$$ &nbsp;
                                <input type="radio" name="budget" value="$$$" />$$$ &nbsp;
                                <input type="radio" name="budget" value="$$$$" />$$$$ &nbsp;
                                <input type="radio" name="budget" value="$$$$$" />$$$$$
                                <br><i class="font_11">The number of dollar signs ($) indicates how expensive the activity is to you</i>
                            </td>
                        </tr>
                        <%-- Telephone Number --%>
                        <tr>
                            <td width="20%">Telephone Number</td>
                            <td width="80%"><input name="telNo" type="text" class="form_input" id="telNo" size="21" maxlength="8">
                                <br><i class="font_11">e.g. 68227122</i></td>
                        </tr>
                        <%-- Website --%>
                        <tr>
                            <td width="20%">Website</td>
                            <td width="80%"><input name="website" type="text" class="form_input" id="website" size="60" maxlength="100">
                                <br><i class="font_11">e.g. http://www.sentosa.com.sg</i></td>
                        </tr>
                        <%-- Email --%>
                        <tr>
                            <td width="20%">Email</td>
                            <td width="80%"><input name="email" type="text" class="form_input" id="email" size="60" maxlength="100">
                                <br><i class="font_11">e.g. siloso_sentosa@live.com</i></td>
                        </tr>
                        <tr>
                            <td></td><td><br><hr><br></td>
                        </tr>
                        <%-- Category --%>
                        <tr>
                            <td style="vertical-align: top">Category <br></td>
                            <td><table width="100%" border="0" cellpadding="0" cellspacing="5">
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Arts" id="Arts" onchange="toggleStatusArts()"> Arts</td>
                                    </tr>
                                    <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="2" id="ArtsTable">
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Exhibitions"  disabled> Exhibitions</td>
                                                    <td width="75%" class="font_13"><input name="checkInput" type="checkbox" value="Performing Arts"  disabled> Performing Arts</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Events" id="Events" onchange="toggleStatusEvents()"> Events</td>
                                    </tr>
                                    <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="2" id="EventsTable">
                                                <tr>
                                                    <td>Start Date:<input type="text" class="form_input" id="startDate" name="startDate"  disabled/></td>
                                                    <td>End Date:<input type="text" class="form_input" id="endDate" name="endDate"  disabled/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Food & Beverage" id="FB" onchange="toggleStatusFB()"> Food & Beverage</td>
                                    </tr>
                                    <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="2" id="FBTable">
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Chinese" disabled> Chinese</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Indian" disabled> Indian</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Indochinese" disabled> Indochinese</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Fusion" disabled> Fusion</td>
                                                </tr>
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Halal" disabled> Halal</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="International" disabled> International</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Japanese" disabled> Japanese</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Korean" disabled> Korean</td>
                                                </tr>
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Malay" disabled> Malay</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Nonya" disabled> Nonya</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Pizza" disabled> Pizza</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Seafood" disabled> Seafood</td>
                                                </tr>
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Steak and Grills" disabled> Steak and Grills</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Steamboat" disabled> Steamboat</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Vegetarian" disabled> Vegetarian</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Western" disabled> Western</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Leisure"> Leisure</td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Places of Interest"> Places of Interest</td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Nightlife"> Nightlife</td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Shopping" id="Shopping" onchange="toggleStatusShopping()"> Shopping</td>
                                    </tr>
                                    <tr>
                                        <td><table width="100%" border="0" cellpadding="0" cellspacing="2" id="ShoppingTable">
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Electronics" disabled> Electronics</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Home & Hobbies" disabled> Home & Hobbies</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Hot Deals" disabled> Hot Deals</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Kids & Baby" disabled> Kids & Baby</td>
                                                </tr>
                                                <tr>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Men Fashion" disabled> Men Fashion</td>
                                                    <td width="25%" class="font_13"><input name="checkInput" type="checkbox" value="Women Fashion" disabled> Women Fashion</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="checkbox_bg"><input name="checkInput" type="checkbox" value="Sports"><b> Sports</b></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td><td><br><hr><br></td>
                        </tr>
                        <%-- Article Description --%>
                        <tr>
                            <td style="vertical-align: top">Description </td>
                            <td><textarea name="description" class="form_input" id="description" cols="85" rows="10"></textarea>
                                <br><i class="font_11">Describe the place or event, what do you feel about it</i></td>
                        </tr>
                        <tr>
                            <td></td><td><br><hr><br></td>
                        </tr>
                        <%-- Submit --%>
                        <tr>
                            <td></td>
                            <td><input type="submit" name="submit" value="Submit Article"/>
                                <br><i class="font_11">Submission is definite. Do check before submitting</i></td>
                        </tr>
                    </table>
                </form>
                <%}
                                                    }
                                                }
                                                if (count == 0) {%>
                <%--Enter your Error Msg--%>
                <h1 class="form_title">Contribute an article now!</h1><br>
                <h3>It appears you are not logged into GoWhereToday.</h3><br>
                <h4>Login to GoWhereToday to enjoy the full priviledges as a member.</h4>
                <h4>Not a member? Register <font color="gray"><a onclick="open_TB()">here</a></font>.</h4>
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