<%-- 
    Document   : mlddm
    Created on : Mar 11, 2010, 2:08:05 AM
    Author     : NTUAdmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script type="text/javascript" src="scripts/mlddmenu.js"></script>
        <link rel="stylesheet" type="text/css" href="scripts/mlddmenu.css" />
    </head>
    <body>


        <div style=" display: block; position:absolute; top: 160px; left:300px; width:650px; height:50px; padding:10px; z-index:2; background:transparent; border:none;" align="center">

            <ul class="mlddm">
                <li><a href="home.jsp" id="mlddmStart" class="mlddmMain">Home</a></li>
                <li><a href="DWT1.jsp" id="mlddm2" class="mlddmMain">DWT</a></li>
                <li><form action="servlets/articlelist" name="viewall" method="post">
                        <input type="hidden" value="All Articles" name="type">
                        <a href="javascript:document.viewall.submit()" id="mlddm3" class="mlddmMain">Articles</a>
                    </form>
                    <ul>
                        <li><form action="servlets/articlelist" name="viewarts" method="post">
                                <input type="hidden" value="Arts & Performing Arts" name="type">
                                <a href="javascript:document.viewarts.submit()">Arts</a>
                            </form></li>
                        <li><form action="servlets/articlelist" name="viewfoods" method="post">
                                <input type="hidden" value="Food & Beverage" name="type">
                                <a href="javascript:document.viewfoods.submit()" class="hsub">Food</a>
                            </form>
                            <ul>
                                <li><form action="servlets/articlelist" name="viewChinese" method="post">
                                        <input type="hidden" value="Chinese" name="type">
                                        <a href="javascript:document.viewChinese.submit()">Chinese</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewHalal" method="post">
                                        <input type="hidden" value="Halal" name="type">
                                        <a href="javascript:document.viewHalal.submit()"> Halal</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewIndochinese" method="post">
                                        <input type="hidden" value="Indochinese" name="type">
                                        <a href="javascript:document.viewIndochinese.submit()">Indochinese</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewFusion" method="post">
                                        <input type="hidden" value="Fusion" name="type">
                                        <a href="javascript:document.viewFusion.submit()">Fusion</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewInternational" method="post">
                                        <input type="hidden" value="International" name="type">
                                        <a href="javascript:document.viewInternational.submit()">International</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewJapanese" method="post">
                                        <input type="hidden" value="Japanese" name="type">
                                        <a href="javascript:document.viewJapanese.submit()">Japanese</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewKorean" method="post">
                                        <input type="hidden" value="Korean" name="type">
                                        <a href="javascript:document.viewKorean.submit()">Korean</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewMalay" method="post">
                                        <input type="hidden" value="Malay" name="type">
                                        <a href="javascript:document.viewMalay.submit()">Malay</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewNonya" method="post">
                                        <input type="hidden" value="Nonya" name="type">
                                        <a href="javascript:document.viewNonya.submit()">Nonya</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewPizza" method="post">
                                        <input type="hidden" value="Pizza" name="type">
                                        <a href="javascript:document.viewPizza.submit()">Pizza</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewSeafood" method="post">
                                        <input type="hidden" value="Seafood" name="type">
                                        <a href="javascript:document.viewSeafood.submit()">Seafood</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewSteakandGrills" method="post">
                                        <input type="hidden" value="Steak and Grills" name="type">
                                        <a href="javascript:document.viewSteakandGrills.submit()">Steak and Grills</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewSteamboat" method="post">
                                        <input type="hidden" value="Steamboat" name="type">
                                        <a href="javascript:document.viewSteamboat.submit()">Steamboat</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewVegetarian" method="post">
                                        <input type="hidden" value="Vegetarian" name="type">
                                        <a href="javascript:document.viewVegetarian.submit()">Vegetarian</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewWestern" method="post">
                                        <input type="hidden" value="Western" name="type">
                                        <a href="javascript:document.viewWestern.submit()">Western</a>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li> <form action="servlets/articlelist" name="viewleisures" method="post">
                                <input type="hidden" value="Leisure" name="type">
                                <a href="javascript:document.viewleisures.submit()">Leisure</a>
                            </form></li>
                        <li><form action="servlets/articlelist" name="viewPOIs" method="post">
                                <input type="hidden" value="Places of Interest" name="type">
                                <a href="javascript:document.viewPOIs.submit()">Places of Interest</a>
                            </form></li>
                        <li><form action="servlets/articlelist" name="viewNLs" method="post">
                                <input type="hidden" value="Nightlife" name="type">
                                <a href="javascript:document.viewNLs.submit()">Nightlife</a>
                            </form></li>
                        <li> <form action="servlets/articlelist" name="viewshoppings" method="post">
                                <input type="hidden" value="Shopping" name="type">
                                <a href="javascript:document.viewshoppings.submit()" class="hsub">Shopping</a>
                            </form>
                            <ul>
                                <li><form action="servlets/articlelist" name="viewElectronics" method="post">
                                        <input type="hidden" value="Electronics" name="type">
                                        <a href="javascript:document.viewElectronics.submit()">Electronics</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewHomeAndHobbies" method="post">
                                        <input type="hidden" value="Home & Hobbies" name="type">
                                        <a href="javascript:document.viewHome.submit()">Home & Hobbies</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewHotDeals" method="post">
                                        <input type="hidden" value="Hot Deals" name="type">
                                        <a href="javascript:document.viewHotDeals.submit()">Hot Deals</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewKidsAndBaby" method="post">
                                        <input type="hidden" value="Kids & Baby" name="type">
                                        <a href="javascript:document.viewKidsAndBaby.submit()">Kids & Baby</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewMenFashion" method="post">
                                        <input type="hidden" value="Men Fashion" name="type">
                                        <a href="javascript:document.viewMenFashion.submit()">Men Fashion</a>
                                    </form>
                                </li>
                                <li><form action="servlets/articlelist" name="viewWomenFashion" method="post">
                                        <input type="hidden" value="Women Fashion" name="type">
                                        <a href="javascript:document.viewWomenFashion.submit()">Women Fashion</a>
                                    </form>
                                </li>
                            </ul>
                            </li>
                        <li><form action="servlets/articlelist" name="viewSports" method="post">
                                <input type="hidden" value="Sports" name="type">
                                <a href="javascript:document.viewSports.submit()">Sports</a>
                            </form></li>
                    </ul>
                </li>
                <li><form action="servlets/eventslist" name="viewEvents" method="post">
                        <input type="hidden" value="Events" name="type">
                        <a href="javascript:document.viewEvents.submit()" id="mlddm4" class="mlddmMain">Events</a>
                    </form></li>
                <li><a href="WriteArticle.jsp" id="mlddm5" class="mlddmMain">Contribute</a></li>

                <li><a href="mailto:timtam207@gmail.com" id="mlddmEnd" class="mlddmMain">Contact Us</a></li>
            </ul>
        </div>


    </body>
</html>

 	 	 	 
 	 	 	 