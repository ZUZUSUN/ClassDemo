<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
    $("#btn1").click(function(){
        $("#p1").hide("slow", function(){
            alert("The paragraph is now hidden");
        });
    });
    $("#btn2").click(function(){
        $("#p2").hide(1000);
        alert("The paragraph is now hidden");
    });
});
</script>
</head>
<body>
<button id="btn1">Hide</button>
<p id="p1">With Callback</p>

<div></div>

<button id="btn2">Hide</button>
<p id="p2">Without Callback</p>

</body>
</html>