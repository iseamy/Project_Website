<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GoogleMapsAPI.ascx.cs" Inherits="User_Controls_GoogleMapsAPI" %>

<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFjesjGbTYDqUd54DxqP-anl4WAtavVSM&sensor=false">
 </script>

<script>
    function initialize() {
        var mapOptions = {
            zoom: 16,
            center: new google.maps.LatLng(54.581755, -5.937936)
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
    }

    function loadScript() {
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
            'callback=initialize';
        document.body.appendChild(script);
    }
    
    window.onload = loadScript;
</script>

<%--<div class="GoogleMap">
            <uc1:GoogleMapsAPI runat="server" id="GoogleMapsAPI" />
            <div id="map-canvas" style="width: 200px; height: 100%"></div> 
        </div>--%>