<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>�T���h�ʺA���</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#grade').change(function(){
			 $.ajax({
				 type: "GET",
				 url: "ajaxResponse.do",
				 data: creatQueryString($(this).val(), ""),
				 dataType: "json",
				 success: function (data){
					clearSelect();
					$.each(data, function(i, item){
						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
					});
// 					$(data).each(function(i, item){
// 						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
// 					});
// 					jQuery.each(data, function(i, item){
// 						$('#class').append("<option value='"+item.classId+"'>"+item.className+"</option>");
// 					});
			     },
	             error: function(){alert("AJAX-grade�o�Ϳ��~�o!")}
	         })
		 })
		 $('#class').change(function(){
			$.ajax({
				 type: "POST",
				 url: "ajaxResponse.do",
				 data: creatQueryString($('#grade').val(), $(this).val()),
				 dataType: "json",
				 success: function (data){
					 clearSelect2();
					 $.each(data, function(i, item){
						 $('#name').append("<option value='"+data[i].nameId+"'>"+data[i].name+"</option>");
					 });
			     },
	            error: function(){alert("AJAX-class�o�Ϳ��~�o!")}
	        })
		})
	})
	
	function creatQueryString(paramGrade, paramClass){
		console.log("paramGrade:"+paramGrade+"; paramClass:"+paramClass);
		var queryString= {"action":"getSelect", "gradeId":paramGrade, "classId":paramClass};
		return queryString;
	}
	function clearSelect(){
		$('#class').empty();
		$('#class').append("<option value='-1'>�п��</option>");
		$('#name').empty();
		$('#name').append("<option value='-1'>�п��</option>");
	}
	function clearSelect2(){
		$('#name').empty();
		$('#name').append("<option value='-1'>�п��</option>");
	}
</script>
<body>
	�~�šG
	<select id="grade">
		<option value="-1">�п��</option>
		<option value="grade3">�T�~��</option>
		<option value="grade2">�G�~��</option>
		<option value="grade1">�@�~��</option>
	</select>
	�Z�O�G
	<select id="class">
		<option value="-1">�п��</option>
	</select>
	�m�W:
	<select id="name">
		<option value="-1">�п��</option>
	</select>
	<br><br>
	<iframe width="860" height="615" src="https://www.youtube.com/embed/aVmZpcrQBU4?autoplay=1" frameborder="0" allowfullscreen></iframe>
</body>
</html>