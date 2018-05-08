<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=YourAPIKey&v=3.exp&sensor=false&language=zh-TW"></script>
</head>
<body>
	<script>
		 $(function () {
	        Distance();
	     });
	     function Distance() {
	         var start = "高雄市鳳山區光遠路226號";
	         var end = "屏東市廣東路100號";
	         var request = {
	             origin: start,
	             destination: end,
	             travelMode: google.maps.DirectionsTravelMode.DRIVING
	         };
	         //宣告
	         var directionsService = new google.maps.DirectionsService();
	         directionsService.route(request, function (response, status) {
	             var strTmp = "";
	             if (status == google.maps.DirectionsStatus.OK) {
	                 var route = response.routes[0];
	                 console.log(response.routes);
	                 for (var i = 0; i < route.legs.length; i++) {
	                     var routeSegment = i + 1;
	                     strTmp += route.legs[i].distance.text;
	                 }
	                 //取得距離(正整數，公尺)
	                 var dist = parseInt(parseFloat(strTmp) * 1000).toString();
	                 alert(dist);
	             }
	         });
	     }
     </script>
</body>
</html>