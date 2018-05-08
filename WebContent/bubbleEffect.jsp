<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	function init(){
		// eventPhase: 1 �OCAPTURING_PHASE�A2 �OAT_TARGET�A3 �OBUBBLING_PHASE
		// body ������
		document.getElementsByTagName("body")[0].addEventListener("click", function(e){
			console.log('body capturing', e.eventPhase);
			alert('body capturing');
		}, true);
		  
		// body ���_�w
		document.getElementsByTagName("body")[0].addEventListener('click', function(e) {
		    console.log('body bubbling', e.eventPhase);
			alert('body bubbling');
		}, false);
		  
		// table ������
		document.getElementsByTagName("table")[0].addEventListener('click', function(e) {
		    console.log('table capturing', e.eventPhase);
		    alert('table capturing');
// 		    e.stopPropagation();  // ***�����ƥ��~�򩹤U�ǻ�
// 		    e.stopImmediatePropagation(); // �Y�O�A�Q�n����L�P�@�h�Ū� listener �]���n�Q����
		}, true);
		
// 		// table ������2
// 		document.getElementsByTagName("table")[0].addEventListener('click', function(e) {
// 		    console.log('table capturing2', e.eventPhase);
// 		    alert('table capturing2');
// 		}, true);
		  
		// table ���_�w
		document.getElementsByTagName("table")[0].addEventListener('click',function(e) {
		    console.log('table bubbling', e.eventPhase);
		    alert('body bubbling');
		}, false);
		  
		// tr ������
		document.getElementsByTagName("tr")[0].addEventListener('click', function(e) {
		    console.log('tr capturing', e.eventPhase);
		    alert('tr capturing');
		}, true);
		  
		// tr ���_�w
		document.getElementsByTagName("tr")[0].addEventListener('click', function(e) {
		    console.log('tr bubbling', e.eventPhase);
		    alert('tr bubbling');
		}, false);
		
		// td ������
		document.getElementsByTagName("td")[1].addEventListener('click', function(e) {
		    console.log('td capturing', e.eventPhase);
		    alert('td capturing');
		}, true);
		  
		// td ���_�w
		document.getElementsByTagName("td")[1].addEventListener('click', function(e) {
		    console.log('td bubbling', e.eventPhase);
		    alert('td bubbling');
		}, false);
		
		// a ������
		document.getElementsByTagName("a")[0].addEventListener('click', function(e) {
		    console.log('a capturing', e.eventPhase);
		    alert('a capturing');
// 		    e.preventDefault(); // ***�����s�������w�]�欰, ex. ����W�s��, form���submit
		}, true);
		  
		// a ���_�w
		document.getElementsByTagName("a")[0].addEventListener('click', function(e) {
		    console.log('a bubbling', e.eventPhase);
		    alert('a bubbling');
		}, false);
	}
	window.addEventListener("load", init, true);
	
	/* ref: https://blog.techbridge.cc/2017/07/15/javascript-event-propagation/ */
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>������A�A�_�w</h2>
	<table class="table" style="background-color:#eee;">
		<thead>
			<tr>
				<th>�����D</th>
				<th>�����D</th>
				<th>�����D</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>���</td>
				<td><a id="clickMe" href="success.html">���</a></td>
				<td>���</td>
			</tr>
			<tr>
				<td>���</td>
				<td>���</td>
				<td>���</td>
			</tr>
		</tbody>
	</table>
</body>
</html>