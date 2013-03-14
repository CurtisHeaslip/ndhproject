﻿<%@ Page Title="" Language="C#" MasterPageFile="~/singlePage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/singlePage.master" %>

<asp:Content ID="cnt_head" ContentPlaceHolderID="cph_subhead" runat="server">

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <%-- /include google maps api --%>
    <script type="text/javascript">

        var origins = [
            <%-- Include origin data --%>
            <%=pp_mapOrigins %>
        ]; // add starting points

        var destinations = [
            "Notre Dame Hospital (Hearst)"
        ]; // likely will leave Hospital as only end point

        var query = {
            // set defaults
            origins: origins,
            destinations: destinations,
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC
        };

        var map, dms;
        var dirService, dirRenderer;
        var highlightedCell;
        var routeQuery;
        var bounds;
        var panning = false;

        var myLatLong = new google.maps.LatLng(49.685171, -83.67945); // lat & long for hearst ON

        function initialize() {
            var mapOptions = {
                zoom: 12, // zoom to hearst city centre
                center: myLatLong, // use var
                mapTypeId: google.maps.MapTypeId.ROADMAP, // use road map style
                disableDefaultUI: true, // a way to quickly hide all controls
                zoomControl: true,
                zoomControlOptions: {
                    style: google.maps.ZoomControlStyle.SMALL
                }
            }

            map = new google.maps.Map(document.getElementById("map"), mapOptions);

            // add custom marker for the hospital
            var marker = new google.maps.Marker({
                position: myLatLong,
                map: map,
                title: "Notre Dame Hospital, Hearst ON"
            });

            // add content for the info window
            var contentString =
                '<div id="contentWindow">' +
                'Location of Hearst, ON' +
                '</div>';

            // create the info window
            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });

            // add click event listener, will open window on click
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });

            createTable();

            for (var i = 0; i < origins.length; i++) {
                origins[i] += ', ON, Canada';
            }

            for (var j = 0; j < destinations.length; j++) {
                destinations[j] += ', ON, Canada';
            }

            dms = new google.maps.DistanceMatrixService();

            dirService = new google.maps.DirectionsService();
            dirRenderer = new google.maps.DirectionsRenderer({ preserveViewport: true, draggable: true });
            dirRenderer.setMap(map);

            google.maps.event.addListener(map, 'idle', function () {
                if (panning) {
                    map.fitBounds(bounds);
                    panning = false;
                    marker.setMap(null); // hide initial map marker once panning begins
                }
            });

            updateMatrix();
        }

        // retrieve data from google maps
        function updateMatrix() {
            dms.getDistanceMatrix(query, function (response, status) {
                if (status == "OK") {
                    populateTable(response.rows);
                }
            }
            );
        }

        // create matrix table
        function createTable() {
            var table = document.getElementById('matrix');
            var tr = addRow(table);
            tr.setAttribute("class", "head"); // simulate a head on table
            for (var j = 0; j < destinations.length; j++) {
                var td = addElement(tr);
                td.setAttribute("class", "destination");
                td.setAttribute("colspan", "2");
                td.appendChild(document.createTextNode(destinations[j]));
            }

            for (var i = 0; i < origins.length; i++) {
                var tr = addRow(table);
                var td = addElement(tr);
                td.setAttribute("class", "origin");
                td.appendChild(document.createTextNode(origins[i] + ", ON")); // add ON to make more readable
                for (var j = 0; j < destinations.length; j++) {
                    var td = addElement(tr, 'element-' + i + '-' + j);
                    td.onclick = getRouteFunction(i, j); // use on click instead of hover
                }
            }
        }

        // provide table data
        function populateTable(rows) {
            for (var i = 0; i < rows.length; i++) {
                for (var j = 0; j < rows[i].elements.length; j++) {
                    var distance = rows[i].elements[j].distance.text;
                    var duration = rows[i].elements[j].duration.text;
                    var td = document.getElementById('element-' + i + '-' + j);
                    td.setAttribute("class", "calculation"); // add class to allow styling
                    td.innerHTML = distance + "<br/>" + duration;
                }
            }
        }

        function getRouteFunction(i, j) {
            return function () {
                routeQuery = {
                    origin: origins[i],
                    destination: destinations[j],
                    travelMode: query.travelMode,
                    unitSystem: query.unitSystem,
                };
                showRoute();
            }
        }

        function showRoute() {
            dirService.route(routeQuery, function (result, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    dirRenderer.setDirections(result);
                    bounds = new google.maps.LatLngBounds();
                    bounds.extend(result.routes[0].overview_path[0]);
                    var k = result.routes[0].overview_path.length;
                    bounds.extend(result.routes[0].overview_path[k - 1]);
                    panning = true;
                    map.panTo(bounds.getCenter());
                }
            });
        }

        function updateMode() {
            switch (document.getElementById("mode").value) {
                case "driving":
                    query.travelMode = google.maps.TravelMode.DRIVING;
                    break;
                case "walking":
                    query.travelMode = google.maps.TravelMode.WALKING;
                    break;
            }
            updateMatrix();
            if (routeQuery) {
                routeQuery.travelMode = query.travelMode;
                showRoute();
            }
        }

        function updateUnits() {
            switch (document.getElementById("units").value) {
                case "km":
                    query.unitSystem = google.maps.UnitSystem.METRIC;
                    break;
                case "mi":
                    query.unitSystem = google.maps.UnitSystem.IMPERIAL;
                    break;
            }
            updateMatrix();
        }

        function addRow(table) {
            var tr = document.createElement('tr');
            table.appendChild(tr);
            return tr;
        }

        function addElement(tr, id) {
            var td = document.createElement('td');
            if (id) {
                td.setAttribute('id', id);
            }
            tr.appendChild(td);
            return td;
        }
    </script>
</asp:Content>

<%-- / begin hero unit--%>
<%-- ========================================================================= --%>
<asp:Content ID="cnt_herounit" ContentPlaceHolderID="cph_hero" runat="Server">
    <h1>
        <asp:Label ID="lbl_hero" runat="server" Text="Contact" />
    </h1>
    <h2>
        <asp:Label ID="lbl_contentSubHeader" runat="server" Text="Directions to our hospital, and how to contact us" />
    </h2>
</asp:Content>
<%-- ========================================================================= --%>
<%-- / end hero unit--%>


<%-- / begin main content title --%>
<%-- ========================================================================= --%>
<asp:Content ID="cnt_title" ContentPlaceHolderID="cph_primary_title" runat="Server">
    <h1>
        <asp:Label ID="lbl_map" runat="server" Text="How to Find Us" /></h1>
</asp:Content>
<%-- ========================================================================= --%>
<%-- / end main content title--%>


<%-- / begin main content --%>
<%-- ========================================================================= --%>
<asp:Content ID="Content3" ContentPlaceHolderID="cph_primary_content" runat="Server">
    <div id="mapContainer">
        <div id="map"></div>
    </div>
</asp:Content>
<%-- ========================================================================= --%>
<%-- / end main content--%>

<%-- / begin side content --%>
<%-- ========================================================================= --%>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_secondary_content" runat="Server">
    <div class="secondaryContentWrapperContent">
        <div class="secondarySectionID">
            <span class="secondaryTitle">Hotspot Locations</span>
        </div>
        <div class="secondaryContent">
            <p>Click the calculated distances to have the map display the fastest route to the hospital</p>
            <%-- When I run this table server side, it messed up javascript --%>
            <table id="matrix"></table>
            <div id="controls">
                <span>Mode of Travel: 
                    <select id="mode" onchange="updateMode()">
                        <option value="driving" selected="selected">Driving</option>
                        <option value="walking">Walking</option>
                    </select>
                </span>
                <span>Prefered Measurement:
                    <select id="units" onchange="updateUnits()">
                        <option value="km" selected="selected">Kilometers</option>
                        <option value="mi">Miles</option>
                    </select>
                </span>
            </div>            
        </div>
    </div>
    <%-- /end secondary widget--%>
</asp:Content>
<%-- ========================================================================= --%>
<%-- / end side content--%>

