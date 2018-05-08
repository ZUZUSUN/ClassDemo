<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<title>�T���h�ʺA���</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#grade').change(function(){
			 $('#form1').submit();
		 })
		 $('#class').change(function(){
			 $('#form1').submit();
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
	<form id="form1" action="servletResponse.do" method="POST">
	<input type="hidden" name="action" value="getSelect">
		<c:set scope="page" var="gradeSelect" value="${classList.get(0).gradeId}"></c:set>
		<c:set scope="page" var="classSelect" value="${userList.get(0).classId}"></c:set>
		�~�šG
		<select name="gradeId" id="grade">
			<option value="-1">�п��</option>
			<option value="grade3" ${(gradeSelect=="grade3")? 'selected':'' }>�T�~��</option>
			<option value="grade2" ${(gradeSelect=="grade2")? 'selected':'' }>�G�~��</option>
			<option value="grade1" ${(gradeSelect=="grade1")? 'selected':'' }>�@�~��</option>
		</select>
		�Z�O�G
		<select name="classId" id="class">
			<option value="-1">�п��</option>
			<c:forEach var="item" items="${classList}">
				<option value="${item.classId}" ${(item.classId==classSelect)? 'selected':'' } >${item.className}</option>
			</c:forEach>
		</select>
		�m�W:
		<select name="nameId">
			<option value="-1">�п��</option>
			<c:forEach var="item" items="${userList}">
				<option value="${item.nameId}">${item.name}</option>
			</c:forEach>
		</select>
	</form>
	<br><br>
	<iframe width="860" height="615" src="https://www.youtube.com/embed/aVmZpcrQBU4?autoplay=1" frameborder="0" allowfullscreen></iframe>
</body>
</html>