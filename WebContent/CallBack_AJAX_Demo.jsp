<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>�^�I�禡-AJAX Demo</title>
</head>
<body>
	<form id="form1" action="success.html" method="post">
		pikachu���Ҿ�:
		<input type="text" name="account" id="account">
		<input type="button" id="doSubmit" value="�e�X">
<!-- 		<input type="submit" id="submit" value="�e�X"> -->
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
				 async: false, // true�w�]�O�D�P�B�A�]�N�O"���|����"; false�O�P�B�A"�|����"
				 success: function (data){
					console.log(data);
					if(data.canPass === "Yes"){
						checked = true;
					}
			     },
	            error: function(){alert("AJAX-class�o�Ϳ��~�o!")}
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