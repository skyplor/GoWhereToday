<%-- 
    Document   : ControlPanel
    Created on : May 10, 2010, 02:57AM
    Author     : jasonlv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%@page language="java" import="java.util.*, javax.servlet.http.Cookie, MyControllers.*, Entities.*" %>
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
<link href="scripts/standard.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="scripts/jquery-latest.js">
</script>
<script type="text/javascript" src="scripts/thickbox2.js">
</script>
<link rel="stylesheet" href="scripts/thickbox.css" type="text/css" media="screen" />
<style type="text/css"> #TOS {display:none;} </style>

<script type="text/javascript" language="javascript">
    function open_TB() {
        tb_show("Register?", "?TB_inline=true&height=550&width=800&inlineId=TOS&modal=true", null);
    }
    function confirm_Reset(){
        return confirm("Are you sure to reset every entry?");
    }
    function validate_Change(){
        var pswd = document.newInfoTable.newPwd.value;
        var testAlpha = /^[A-Za-z0-9]+$/i;

        //check whether all info are empty,
        if (document.newInfoTable.newFullName.value == "" && pswd == "" && document.newInfoTable.confirmedPwd.value == ""
            && document.newInfoTable.BirthDate.value == "" && !document.newInfoTable.newGender[0].checked && !document.newInfoTable.newGender[1].checked && !document.newInfoTable.newGender[2].checked
            && document.newInfoTable.newAboutMe.value == ""){
            alert("You haven't specified any change.");
            document.newInfoTable.newFullName.focus();
            return false;
        }
        else if (pswd != "" && (!testAlpha.test(pswd) || pswd.length > 16 || pswd.length < 6)){
            alert("The password you have entered is invalid,\nit must be between 6 to 16 alphanumeric characters long.");
            document.newInfoTable.newPwd.focus();
            return false;
        }
        else if (document.newInfoTable.confirmedPwd.value != pswd){
            alert("The passwords do not match.");
            document.newInfoTable.confirmedPwd.focus();
            return false;
        }
        for(var i = 0; i<document.newInfoTable.newFullName.value.length;i++){
            document.newInfoTable.newFullName.value = document.newInfoTable.newFullName.value.replace("'","&rsquo;");}
        for(var j = 0; j<document.newInfoTable.newAboutMe.value.length;j++){
            document.newInfoTable.newAboutMe.value = document.newInfoTable.newAboutMe.value.replace("'","&rsquo;");}
            return true;
        }
        function check_notNull(){
            if (document.getElementById("newAvatar").value.trim() == ""){
                alert("You haven't chosen a picture to upload!");
                return false;
            }
        }
</script>

<script type="text/javascript" src="js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ui-1.7.1.custom.min.js"></script>
<script type="text/javascript" src="scripts/daterangepicker.jQuery.js"></script>
<link rel="stylesheet" href="css/ui.daterangepicker.css" type="text/css" />
<link rel="stylesheet" href="css/redmond/jquery-ui-1.7.1.custom.css" type="text/css" title="ui-theme" />
<script type="text/javascript">
        $(function(){
            $('#BirthDate').daterangepicker({
                presetRanges: [
                    {text: 'Today', dateStart: 'Today', dateEnd: 'Today' }
                ],
                presets: {specificDate: 'Pick a date'},
                dateFormat: 'yy-mm-dd',
                rangeSplitter: 'to',
                datepickerOptions:{
                    changeMonth: true,
                    changeYear: true,
                    yearRange:'1910:2005'
                }
            });
        });
</script>

<%--Checking cookies after new infoForm is submitted--%>
<%
            Cookie[] probes = request.getCookies();
            for (int count = 0; count < probes.length; count++) {
                if (probes[count].getName().equalsIgnoreCase("UserAvatar")) {
                    if (probes[count].getValue().equalsIgnoreCase("success")) {
%>
<script type="text/javascript">
        alert("Congratulations! Your avatar has been updated successfully!");
</script>
<%                    } else if (probes[count].getValue().equalsIgnoreCase("failure")) {
%>
<script type="text/javascript">
        alert("Sorry there seems to be a problem, your avatar is not updated");
</script>
<%                    }
                }
                if (probes[count].getName().equalsIgnoreCase("GWTupdate")) {
                    if (probes[count].getValue().equalsIgnoreCase("success")) {
%>
<script type="text/javascript">
        alert("Congratulations! Your particulars have been updated successfully!");
</script>
<%                    } else if (probes[count].getValue().equalsIgnoreCase("failure")) {
%>
<script type="text/javascript">
        alert("Sorry there seems to be a problem, your particulars are not updated");
</script>
<%                        }
                }
            }
%>

<html>
    <head>
        <link href="standard.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="navi.jsp" %>
        <title>Control Panel</title>
    </head>
    <body>
        <div id="main">
            <div id="text">



                <div id="leftColumn" >
                    <%
                                Cookie[] myCookies = request.getCookies();
                                int count0;
                                String username = "";
                                String userType = "";
                                boolean isLoggedIn = false;
                                for (count0 = 0; count0 < myCookies.length; count0++) {
                                    if (myCookies[count0].getName().equalsIgnoreCase("DWTUser")) {
                                        username = myCookies[count0].getValue();
                                        isLoggedIn = true;
                                    } else if (myCookies[count0].getName().equalsIgnoreCase("DWTType")) {
                                        userType = myCookies[count0].getValue();
                                    }
                                }
                                if (!isLoggedIn) {
                    %>

                    <%--Error Msg--%>
                    <h3>It appears you are not logged into GoWhereToday.</h3><br>
                    <h4>Login to GoWhereToday to enjoy the full priviledges as a member.</h4>
                    <h4>Not a member? Register <font color="gray"><a onclick="open_TB()">here</a></font>.</h4>
                    <%--/Error Msg--%>

                    <%                    } else {
                                                        ProfilePageController con = new ProfilePageController();
                                                        ViewArticleController cat = new ViewArticleController();
                                                        User client = con.findUserByUsername(username);
                    %>
                    <div align="center">
                        <table border="0" cellpadding="10">
                            <thead>
                                <tr align="left">
                                    <th><h4><font size="5" color="#F88017">Particulars</font></h4></th>
                                    <th><h4><font size="5" color="#F88017">Modify your particulars</font></h4></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>

                                    <td width="300px" align="left">
                                        <br>
                                        <b>Name:</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                                        <%=username%>
                                        <br>
                                        <b>Email:</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                                        <%=client.getEmailAddr()%>
                                        <br>
                                        <b>Full name:</b>&nbsp&nbsp;
                                        <%=client.getFullName()%>
                                        <br>
                                        <b>Gender:</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;
                                        <%=client.getGender()%>
                                        <br>

                                        <b>Birthdate:</b>&nbsp&nbsp&nbsp;<%String startDate;
                                                                            if (!client.getDOB().toString().equalsIgnoreCase("1801-02-19")) {
                                                                                String dob = client.getDOB().toString();
                                                                                String startYear = dob.substring(0, 4);
                                                                                String startMonth = dob.substring(5, 7);
                                                                                String startDay = dob.substring(8);

                                                                                if (startMonth.equalsIgnoreCase("01")) {
                                                                                    startMonth = "JAN";
                                                                                } else if (startMonth.equalsIgnoreCase("02")) {
                                                                                    startMonth = "FEB";
                                                                                } else if (startMonth.equalsIgnoreCase("03")) {
                                                                                    startMonth = "MAR";
                                                                                } else if (startMonth.equalsIgnoreCase("04")) {
                                                                                    startMonth = "APR";
                                                                                } else if (startMonth.equalsIgnoreCase("05")) {
                                                                                    startMonth = "MAY";
                                                                                } else if (startMonth.equalsIgnoreCase("06")) {
                                                                                    startMonth = "JUN";
                                                                                } else if (startMonth.equalsIgnoreCase("07")) {
                                                                                    startMonth = "JUL";
                                                                                } else if (startMonth.equalsIgnoreCase("08")) {
                                                                                    startMonth = "AUG";
                                                                                } else if (startMonth.equalsIgnoreCase("09")) {
                                                                                    startMonth = "SEP";
                                                                                } else if (startMonth.equalsIgnoreCase("10")) {
                                                                                    startMonth = "OCT";
                                                                                } else if (startMonth.equalsIgnoreCase("11")) {
                                                                                    startMonth = "NOV";
                                                                                } else {
                                                                                    startMonth = "DEC";
                                                                                }
                                                                                startDate = startDay + " " + startMonth + " " + startYear;
                                                                            } else {
                                                                                startDate = "N.A.";
                                                                            }%><%=startDate%><br>
                                        <b>About me</b><br>
                                        &nbsp;&nbsp;<%if (client.getAboutMe() != null) {%><%=client.getAboutMe()%><%} else {%>N.A.<%}%><br>
                                        <form enctype="multipart/form-data" action="servlets/uploadAvatarServlet" name="avatarTable" onsubmit="return check_notNull()" method="POST">
                                            <b><%=username%>'s avatar</b><br>
                                            <img src="Avatars/<%=client.getAvatar()%>" width="100" height="100" alt="Avatar"><br>
                                            <b>New avatar</b>&nbsp;
                                            <input type="file" id="newAvatar" class="form_input" name="newAvatar" accept="image/*"/>
                                            <input type="submit" value="Upload avatar!" name="submit" />
                                        </form>
                                    </td>



                                    <td width="350px" valign="top">
                                        <form action="servlets/ControlPanelServlet" name="newInfoTable" onsubmit="return validate_Change()" method="POST">
                                            <input type="hidden" name="Email" value="<%=client.getEmailAddr()%>" />
                                            <br>
                                            <b>New Full Name:</b>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <input type="text" class="form_input" name="newFullName" />
                                            <br>
                                            <b>Change gender:</b>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <input type="radio" name="newGender" value="M" />Male
                                            &nbsp&nbsp
                                            <input type="radio" name="newGender" value="F" />Female
                                            &nbsp&nbsp
                                            <input type="radio" name="newGender" value="H" />'Sshhhh!'
                                            <br>
                                            <b>New password:</b>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            &nbsp&nbsp&nbsp&nbsp
                                            <input type="password" class="form_input" name="newPwd"/>
                                            <br>
                                            <b>Re-enter password:</b>
                                            &nbsp&nbsp
                                            <input type="password" class="form_input" name="confirmedPwd"/>
                                            <br>
                                            <b>Birthdate:</b>
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                            <input type="text" class="form_input" id="BirthDate" name="BirthDate" />
                                            <br><br>
                                            <b>About me:</b>
                                            <br>
                                            <textarea class="form_input" name="newAboutMe" rows="7" cols="30" ></textarea>
                                            <br>
                                            <input type="submit" value="I'm done changing!" name="Modify" />
                                            <input type="reset" value="Reset" name="Reset" onclick="return confirm_Reset()"/>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="center">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <br>
                    <div align="center">
                        <h4><font size="5" color="#F88017">List of Articles Written</font></h4>
                        <%
                                                            Article[] articles = con.findAllArticleByUsername(username);
                                                            Article[] articleCat;
                        %>
                        <%
                                                            if (articles == null) {
                        %><h4><b>Oops, it seems that you haven't written anything!</b><br>
                            Want to contribute? Click <a href="WriteArticle.jsp">here</a>!</h4>
                            <%  } else {
                            %>

                        <table border="0">
                            <tbody>
                            <thead>
                                <tr>
                                    <th>Article</th>
                                    <th>Date Written</th>
                                    <th>Approved?</th>
                                </tr>
                            </thead>
                            <%
                                                                                    for (int count = 0; count < articles.length; count++) {
                                                                                        int count1 = 0;
                                                                                        articleCat = (Article[]) cat.getArticleCat(articles[count].getID());
                                                                                        for (int k = 1; k < Integer.parseInt(articleCat[0].getPara(0)); k++) {
                                                                                            if (articleCat[0].getPara(k).equalsIgnoreCase("Events")) {
                                                                                                count1 = 1;
                            %>
                            <tr>
                                <td>
                                    <form action="servlets/ViewEventsServlet" name="viewEventTable<%=count%>" method="post">
                                        <input type="hidden" value="<%=articles[count].getID()%>" name="articleid" />
                                        <b><a href="javascript:document.viewEventTable<%=count%>.submit()"><%=articles[count].getPara(0)%></a></b><br>
                                    </form>
                                </td>
                                <td>
                                    <%=articles[count].getPara(18)%>
                                </td>
                                <td align="center">
                                    <%
                                                                                                                            if (articles[count].getPara(13).equalsIgnoreCase("y")) {
                                    %>
                                    <img src="images/tick.png" alt="approved">
                                    <%                                            } else {
                                    %>
                                    <img src="images/cross.png" alt="not approved">
                                    <%                                            }
                                    %>
                                </td>
                            </tr>
                            <%
                                                                                                                }
                                                                                                            }
                                                                                                            if (count1 == 0) {%>
                            <tr>
                                <td>
                                    <form action="servlets/ViewArticleServlet" name="viewArtTable<%=count%>" method="post">
                                        <input type="hidden" value="<%=articles[count].getID()%>" name="articleid" />
                                        <b><a href="javascript:document.viewArtTable<%=count%>.submit()"><%=articles[count].getPara(0)%></a></b><br>
                                    </form>
                                </td>
                                <td>
                                    <%=articles[count].getPara(18)%>
                                </td>
                                <td align="center">
                                    <%
                                                                                                                                            if (articles[count].getPara(13).equalsIgnoreCase("y")) {
                                    %>
                                    <img src="images/tick.png" alt="approved">
                                    <%                                            } else {
                                    %>
                                    <img src="images/cross.png" alt="not approved">
                                    <%                                            }
                                    %>
                                </td>
                            </tr>
                            <%}
                                                                                    }
                            %>
                            </tbody>
                        </table>

                        <%
                                                            }
                        %>
                    </div>
                    <br>
                    <br>
                    <%
                                                        if (userType.equalsIgnoreCase("moderator")) {
                    %>
                    <div align="center">
                        <br>
                        <h4><font size="5" color="#F88017">List of Pending Articles</font></h4>
                        <br>
                        <table border="0">
                            <tbody>
                                <%
                                                                                    ControlPanelController cont = new ControlPanelController();
                                                                                    Article[] arts = cont.getUnapprovedArticles();
                                                                                    if (arts == null) {
                                %>
                            <h4><b>There is no unapproved article at the moment.</b></h4>
                            <%  } else {
                                                                                                            for (int count1 = 0; count1 < arts.length; count1++) {
                            %>
                            <tr>
                                <td>
                                    <form action="servlets/ViewArticleServlet" name="viewarticleTable<%=count1%>" method="post">
                                        <input type="hidden" value="<%=arts[count1].getID()%>" name="articleid" />
                                        <b><a href="javascript:document.viewarticleTable<%=count1%>.submit()"><%=arts[count1].getPara(0)%></a></b><br>
                                    </form>
                                </td>
                            </tr>
                            <%
                                                                                    }
                                                                                }%>
                            </tbody>
                        </table>

                    </div>
                    <%}
                                }
                    %>
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
