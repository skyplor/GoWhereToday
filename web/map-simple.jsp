<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <title>Google Maps JavaScript API v3 Example: Map Simple</title>
        <script type="text/javascript" src="http://maps.google.com.sg/maps/api/js?sensor=false"></script>
        <%--<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=ABQIAAAAGF4z7K0RwzLEIt0Nd6DVKRRM9zm2iky2NjrhfyMgi4j3F42zDRRnBJ0jkx8F92-PjGapHQ28XCxETg" type="text/javascript"></script>--%>
        <script type="text/javascript">
            var geocoder;
            var map;
            <%--function show() {
                geocoder = new google.maps.Geocoder();
                var latlng = new google.maps.LatLng(1.3520830, 103.8198360);
                var myOptions = {
                    zoom: 14,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            }--%>

                function codeAddress() {
                    geocoder = new google.maps.Geocoder();
                    var latlng = new google.maps.LatLng(1.3025650, 103.8346940);
                    var myOptions = {
                        zoom: 10,
                        center: latlng,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    }
            <%--map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);--%>
                            var address = '<%= request.getParameter("add")%>'//document.getElementById("address").value;
                            if(address != ''){
                                if (geocoder) {
                                    geocoder.geocode( { 'address': address}, function(results, status) {
                                        if (status == google.maps.GeocoderStatus.OK) {
                                            myOptions = {zoom: 15, center: latlng, mapTypeId: google.maps.MapTypeId.ROADMAP}
                                            map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                                            map.setCenter(results[0].geometry.location);
                                            var marker = new google.maps.Marker({
                                                map: map,
                                                position: results[0].geometry.location
                                            });
                                        } else {map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
                                        }
                                    });
                                }
                            }else{map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);}
                        }
        </script>
    </head>
    <body style="margin:0px; padding:0px;" onload="codeAddress()">
        <div id="map_canvas" style="width:100%; height:100%"></div>
    </body>
</html>
