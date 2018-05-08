<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>回呼函式-AJAX Demo</title>
</head>
<body>
	<form id="form1" action="success.html" method="post">
		pikachu驗證器:
		<input type="text" name="account" id="account">
		<input type="button" id="doSubmit" value="送出">
<!-- 		<input type="submit" id="submit" value="送出"> -->
	</form>
</body>
<script>
var checked =false;
	$(function(){
		$('#doSubmit').on('click', function(){
			var account = $('#account').val();
			checked = false;
			$.ajax({
				 type: "POST",
				 url: "callBackDemo.do",
				 data: {"account": account},
				 dataType: "json",
				 async: false, // true預設是非同步，也就是"不會等待"; false是同步，"會等待"
				 success: function (data){
					console.log(data);
					if(data.canPass === "Yes"){
						checked = true;
					}
			     },
	            error: function(){alert("AJAX-class發生錯誤囉!")}
	        })
	        console.log("checked: "+ checked);
	        if(checked){
		        	alert('!!!')
		        	$('#form1').submit();
	        }
		});
	});
</script>
</html>