<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		// Without CallBack function
		$('#output1').append('starting ...');
		$('#output1').append('continuing ...');
		$('#output1').append('ending!');
		
		// 使用Timeout模擬查詢server完後的CallBack function
		$('#output2').append('starting ...');
		getData('http://fakedomain1234.com/userlist', writeData);
		$('#output2').append('continuing ...');

		function getData(dataURI, callback) {
		    // Normally you would actually connect to a server here.
		    // We're just going to simulate a 3-second delay.
		    setTimeout(function () {
		        var dataArray = [123, 456, 789, 012, 345, 678];
		        callback(dataArray);
		    }, 3000);
		}
		function writeData(myData) {
			$('#output2').append(myData);
		    $('#output2').append('ending!');
		}
		
		// 沒有使用Timeout的CallBack function
		$('#output3').append('starting ...');
		getData2('http://fakedomain1234.com/userlist', writeData2);
		$('#output3').append('continuing ...');

		function getData2(dataURI, callback) {
		    var dataArray = [123, 456, 789, 012, 345, 678];
		    callback(dataArray);
		}
		function writeData2(myData) {
			$('#output3').append(myData);
		    $('#output3').append('ending!');
		}
	});
</script>
</head>
<body>
   <p id="output1">
   </p>
   <p id="output2">
   </p>
   <p id="output3">
   </p>
</body>
</html>