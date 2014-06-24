<%-- 
    Document   : rightColumn
    Created on : May 14, 2010, 2:33:33 AM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <%--  iCal Calendar scripts
        <link rel="stylesheet" href="scripts/iCal.css" type="text/css" media="screen" charset="utf-8" />
        <script src="scripts/jquery-1.3.min.js" type="text/javascript"> </script>
        <script src="scripts/coda.js" type="text/javascript"> </script>--%>
    </head>
    <body>

        <div id="rightColumn" style="position: absolute; left:750px; top:5px; padding: 10px;">


                    <div style = "padding: 20px; padding-left: 30px; height:330px; background: url('images/sticky-notes.png');">
                        <a id="sideTab1" href="DWT1.jsp" title="New Here?" class="sideTab"><span>New Here?</span></a>
                        <a id="sideTab2" href="aboutUs.jsp" title="Who We Are?" class="sideTab"<span>Who We Are?</span></a>
                        <a id="sideTab3" href="WriteArticle.jsp" title="Share With Us" class="sideTab"><span>Share With Us</span></a>
                        <a id="sideTab4" href="Tour.jsp" title="Take A Tour" class="sideTab"><span>Take A Tour</span></a>
                    </div>

                    <%--<div id="eventCal">
                    <h4>Events Calendar </h4>
                    <table cellspacing="0" id="eventCalTable">
                        <thead>
                            <tr>
                                <th>Mon</th><th>Tue</th><th>Wed</th>
                                <th>Thu</th><th>Fri</th><th>Sat</th>
                                <th>Sun</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="padding" colspan="5"></td>
                                <td> 1</td>
                                <td> 2</td>

                            </tr>
                            <tr>
                                <td> 3</td>
                                <td> 4</td>
                                <td> 5</td>
                                <td> 6</td>
                                <td> 7</td>
                                <td> 8</td>
                                <td> 9</td>

                            </tr>
                            <tr>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td class="date_has_event">
						13
                                    <div class="events">
                                        <ul>
                                            <li>
                                                <span class="title">Event 1</span>
                                                <span class="desc">I got an 'A'!</span>
                                            </li>
                                            <li>
                                                <span class="title">Event 2</span>
                                                <span class="desc">Exams...zzz.</span>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td class="today">14</td>
                                <td>15</td>
                                <td>16</td>

                            </tr>
                            <tr>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td class="date_has_event">
						22
                                    <div class="events">
                                        <ul>
                                            <li>
                                                <span class="title">Event 1</span>
                                                <span class="desc">Sentosa Strip Party.</span>
                                            </li>
                                            <li>
                                                <span class="title">Event 2</span>
                                                <span class="desc">Natasha Studio Jam.</span>
                                            </li>
                                        </ul>
                                    </div>
                                </td>
                                <td>23</td>

                            </tr>
                            <tr>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                                <td>30</td>
                            </tr>
                            <tr>
                                <td>31</td>
                                <td class="padding" colspan="6"></td>
                            </tr>
                        </tbody>
                        <tfoot>
                        <th>Mon</th><th>Tue</th><th>Wed</th>
                        <th>Thu</th><th>Fri</th><th>Sat</th>
                        <th>Sun</th>
                        </tfoot>
                    </table>
                    </div>--%>


                </div>


    </body>
</html>
