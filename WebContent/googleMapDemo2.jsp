<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<title>Google Map</title>
<style>
html {
  height:100%;
}
body {
  height:100%;margin:0px;font-family: Helvetica,Arial;
}
/* Animations to fade the snackbar in and out */
#snackbar {
    visibility: hidden;
    min-width: 120px;
    margin-left: -60px;
    background-color: #333;
    color: #fff;
    text-align: center;
    border-radius: 30px;
    padding: 14px;
    position: fixed;
    z-index: 1;
    left: 50%;
    bottom: 30px;
    font-size: 14px;
}
#snackbar.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;} 
    to {bottom: 30px; opacity: 1;}
}
@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 30px; opacity: 1;}
}
@-webkit-keyframes fadeout {
    from {bottom: 30px; opacity: 1;} 
    to {bottom: 0; opacity: 0;}
}
@keyframes fadeout {
    from {bottom: 30px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}
</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=YourAPIKey&sensor=false"></script>
<script type ="text/javascript" src="js/v3_epoly.js"></script>
<script type="text/javascript">
  
  var map;
  var directionDisplay;
  var directionsService;
  var stepDisplay;
 
  var position;
  var marker = [];
  var polyline = [];
  var poly2 = [];
  var poly = null;
  var startLocation = [];
  var endLocation = [];
  var timerHandle = [];
    
  
  var speed = 0.000005, wait = 1;
  var infowindow = null;
  
  var myPano;   
  var panoClient;
  var nextPanoId;
  
  var startLoc = new Array();
  var endLoc = new Array();
  var plateNo = new Array();
  var results = new Array();

  var timerMin = 0;
  // var Colors = ["#FF0000", "#00FF00", "#0000FF"];
  var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';

function initialize() {  

  var address = prompt("Please enter your name", '中壢火車站');
  if(!address) return;
  
  geocoder = new google.maps.Geocoder();
  geocoder.geocode( {'address': address}, function(results, status) {
    var myLatlng = results[0].geometry.location;
    // var myLatlng = {lat: 24.969, lng: 121.192};

    map = new google.maps.Map(document.getElementById('map_canvas'), {
      center: myLatlng,
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Click to zoom'
    });

    getJSON('http://ptx.transportdata.tw/MOTC/v2/Bus/RealTimeByFrequency/City/Taoyuan?$format=JSON', callback);
    countDown = 60;
    var timer = setInterval(function(){
      showToast(countDown);
      countDown--;
      if(countDown == 0){
        clearInterval(timer);
      }
    }, 1000);

    setInterval(function(){
      // 擷取及時公車資訊
      getJSON('http://ptx.transportdata.tw/MOTC/v2/Bus/RealTimeByFrequency/City/Taoyuan?$format=JSON', callback);
    }, 1000*60);
  }); 
} 

function getJSON(url, callback) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url, true);
  xhr.responseType = 'json';
  xhr.onload = function() {
    var status = xhr.status;
    if (status === 200) {
      callback(null, xhr.response);
    } else {
      callback(status, xhr.response);
    }
  };
  xhr.send();
}

function callback(err, data) {
  if (err !== null) {
    alert('Something went wrong: ' + err);
  } else {
    console.log(data)
    for(var i = 0; i < data.length; i++){
      if(data[i].PlateNumb && plateNo.indexOf(data[i].PlateNumb) == -1) { // 第一次加入
        var busPosition = data[i].BusPosition;
        var latLng = new google.maps.LatLng(busPosition.PositionLat, busPosition.PositionLon);
        if(map.getBounds().contains(latLng)){
          plateNo.push(data[i].PlateNumb);
          var index = plateNo.indexOf(data[i].PlateNumb);
          startLoc[index] = latLng;
          endLoc[index] = latLng;
        }
      } else { // 第二次以後
        var index = plateNo.indexOf(data[i].PlateNumb);
        var busPosition = data[i].BusPosition;
        var latLng = new google.maps.LatLng(busPosition.PositionLat, busPosition.PositionLon);
        startLoc[index] = endLoc[index];
        endLoc[index] = latLng;
      }
      results[i] = data[i];
    }
    if(timerMin != 0) setRoutes(); // 開始跑動畫
    timerMin++;
  }
}

function createMarker(latlng, result) {
    // var contentString = '<b>'+label+'</b><br>'+html;
    var marker = new google.maps.Marker({
        position: latlng,
        map: map,
        icon: iconBase + 'bus_maps.png',
        zIndex: Math.round(latlng.lat()*-100000)<<5
    });
    // marker.myname = label;
    var infowindow = new google.maps.InfoWindow({
        content: "<h2>"+result.RouteName.Zh_tw+"</h2><div><p><b>車號: </b>"+result.PlateNumb+"</p><p><b>司機: </b>"+result.OperatorID+"</p><p><b>位置: </b>{"+result.BusPosition.PositionLat+","+result.BusPosition.PositionLon+"}</p></div>"
    });
    marker.addListener('click', function() {
        infowindow.open(map, marker);
    });

    // google.maps.event.addListener(marker, 'click', function() {
    //     infowindow.setContent(contentString); 
    //     infowindow.open(map, marker);
    // });
    return marker;
}  

function setRoutes(){   

    var directionsDisplay = new Array();
    for (var i=0; i< startLoc.length; i++){
	    var rendererOptions = {
	        map: map,
	        suppressMarkers : true,
	        preserveViewport: true
	    }
	    directionsService = new google.maps.DirectionsService();
	    var request = {
	        origin: startLoc[i],
	        destination: endLoc[i],
	        travelMode: google.maps.DirectionsTravelMode.DRIVING
	    };
      directionsService.route(request, makeRouteCallback(i, directionsDisplay[i]));
    }   

    function makeRouteCallback(routeNum, disp){
        // if (polyline[routeNum] && (polyline[routeNum].getMap() != null)) {
  	     // 	startAnimation(routeNum);
  	     // 	return;
        // }

        return function(response, status){
          
        	if (status == google.maps.DirectionsStatus.OK){

            var bounds = new google.maps.LatLngBounds();
            var route = response.routes[0];
            startLocation[routeNum] = new Object();
            endLocation[routeNum] = new Object();

            polyline[routeNum] = new google.maps.Polyline({
	            path: [],
	            strokeColor: '#FFFF00',
	            strokeWeight: 3
            });

            poly2[routeNum] = new google.maps.Polyline({
	            path: [],
	            strokeColor: '#FFFF00',
	            strokeWeight: 3
            });     

            // For each route, display summary information.
            var path = response.routes[0].overview_path;
            var legs = response.routes[0].legs;


            disp = new google.maps.DirectionsRenderer(rendererOptions);     
            disp.setMap(map);
            disp.setDirections(response);

            //Markers               
            for (i=0; i < legs.length; i++) {
	            if (i == 0) { 
	                startLocation[routeNum].latlng = legs[i].start_location;
	                startLocation[routeNum].address = legs[i].start_address;
	                // marker = google.maps.Marker({map:map,position: startLocation.latlng});
	                if(!marker[routeNum])
                    marker[routeNum] = createMarker(legs[i].start_location, results[routeNum]);
                    // marker[routeNum] = createMarker(legs[i].start_location, "start", legs[i].start_address, "green");
	            }
	            endLocation[routeNum].latlng = legs[i].end_location;
	            endLocation[routeNum].address = legs[i].end_address;
	            var steps = legs[i].steps;

	            for (j=0; j<steps.length; j++) {
	                var nextSegment = steps[j].path;                
	                var nextSegment = steps[j].path;

	                for (k=0; k<nextSegment.length; k++) {
	                    polyline[routeNum].getPath().push(nextSegment[k]);
	                    //bounds.extend(nextSegment[k]);
	                }
	            }
            }
         	}
          if(polyline[routeNum]){
            console.log(routeNum)       
	          polyline[routeNum].setMap(map);
  	        //map.fitBounds(bounds);
  	        startAnimation(routeNum);  
          }
    	  } // else alert("Directions request failed: "+status);
	}
}

var lastVertex = 1;
var stepnum = 0;
// var step = 50; // 5; // metres
// var tick = 100; // milliseconds
var perTime = 1000 * 60; //每一分鐘
var step = 10; // metres
var tick = []; // milliseconds
var eol= [];
//----------------------------------------------------------------------                
function updatePoly(i, d) {
    // Spawn a new polyline every 20 vertices, because updating a 100-vertex poly is too slow
    if (poly2[i].getPath().getLength() > 10) {
        poly2[i]=new google.maps.Polyline([polyline[i].getPath().getAt(lastVertex-1)]);
        // map.addOverlay(poly2)
    }

    if (polyline[i].GetIndexAtDistance(d) < lastVertex+2) {
        if (poly2[i].getPath().getLength()>1) {
            poly2[i].getPath().removeAt(poly2[i].getPath().getLength()-1)
        }
        poly2[i].getPath().insertAt(poly2[i].getPath().getLength(), polyline[i].GetPointAtDistance(d));
    } else {
        poly2[i].getPath().insertAt(poly2[i].getPath().getLength(), endLocation[i].latlng);
    }
 }
//----------------------------------------------------------------------------

function animate(index, d) {
    if (d > eol[index]) {
	    marker[index].setPosition(endLocation[index].latlng);
      // setTimeout(function(){
      //   marker[index] = null;
      // }, 10);
	    return;
    }
    var p = polyline[index].GetPointAtDistance(d);

    //map.panTo(p);
    marker[index].setPosition(p);
    updatePoly(index, d);
    timerHandle[index] = setTimeout("animate("+index+", "+(d+step)+")", tick[index]);
}

//-------------------------------------------------------------------------

function startAnimation(index) {
    if (timerHandle[index]) clearTimeout(timerHandle[index]);
    eol[index] = polyline[index].Distance();
    tick[index] = (step)/eol[index] * perTime;
    // map.setCenter(polyline[index].getPath().getAt(0));
    poly2[index] = new google.maps.Polyline({path: [polyline[index].getPath().getAt(0)], strokeColor:"#FFFF00", strokeWeight:3});
    timerHandle[index] = setTimeout("animate("+index+", 10)", 1);  // Allow time for the initial map display 起始等待一秒
}

//----------------------------------------------------------------------------    

function showToast(text, millisecond) {
    if(!millisecond) millisecond = 700
    var d = document.createElement("DIV")
    d.id = "snackbar"
    document.body.appendChild(d)
    var x = document.getElementById("snackbar")
    x.className = "show";
    x.innerText = text

    setTimeout(function(){ 
        x.className = x.className.replace("show", ""); 
        x.remove()
    }, millisecond);
}


</script>
</head>
<body onload="initialize()">

<!-- 	<div id="tools">
	    <button onclick="setRoutes();">Start</button>
	</div> -->
	<div id="map_canvas" style="width:100%;height:100%;"></div>

	<!-- <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script> -->
<!-- 	<script type="text/javascript">
		_uacct = "UA-162157-1";
		urchinTracker();
	</script> -->
</body>
</html>