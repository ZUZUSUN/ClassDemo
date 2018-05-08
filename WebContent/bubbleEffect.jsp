<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	function init(){
		// eventPhase: 1 是CAPTURING_PHASE，2 是AT_TARGET，3 是BUBBLING_PHASE
		// body 的捕獲
		document.getElementsByTagName("body")[0].addEventListener("click", function(e){
			console.log('body capturing', e.eventPhase);
			alert('body capturing');
		}, true);
		  
		// body 的冒泡
		document.getElementsByTagName("body")[0].addEventListener('click', function(e) {
		    console.log('body bubbling', e.eventPhase);
			alert('body bubbling');
		}, false);
		  
		// table 的捕獲
		document.getElementsByTagName("table")[0].addEventListener('click', function(e) {
		    console.log('table capturing', e.eventPhase);
		    alert('table capturing');
// 		    e.stopPropagation();  // ***取消事件繼續往下傳遞
// 		    e.stopImmediatePropagation(); // 若是你想要讓其他同一層級的 listener 也不要被執行
		}, true);
		
// 		// table 的捕獲2
// 		document.getElementsByTagName("table")[0].addEventListener('click', function(e) {
// 		    console.log('table capturing2', e.eventPhase);
// 		    alert('table capturing2');
// 		}, true);
		  
		// table 的冒泡
		document.getElementsByTagName("table")[0].addEventListener('click',function(e) {
		    console.log('table bubbling', e.eventPhase);
		    alert('body bubbling');
		}, false);
		  
		// tr 的捕獲
		document.getElementsByTagName("tr")[0].addEventListener('click', function(e) {
		    console.log('tr capturing', e.eventPhase);
		    alert('tr capturing');
		}, true);
		  
		// tr 的冒泡
		document.getElementsByTagName("tr")[0].addEventListener('click', function(e) {
		    console.log('tr bubbling', e.eventPhase);
		    alert('tr bubbling');
		}, false);
		
		// td 的捕獲
		document.getElementsByTagName("td")[1].addEventListener('click', function(e) {
		    console.log('td capturing', e.eventPhase);
		    alert('td capturing');
		}, true);
		  
		// td 的冒泡
		document.getElementsByTagName("td")[1].addEventListener('click', function(e) {
		    console.log('td bubbling', e.eventPhase);
		    alert('td bubbling');
		}, false);
		
		// a 的捕獲
		document.getElementsByTagName("a")[0].addEventListener('click', function(e) {
		    console.log('a capturing', e.eventPhase);
		    alert('a capturing');
// 		    e.preventDefault(); // ***取消瀏覽器的預設行為, ex. 阻止超連結, form表單submit
		}, true);
		  
		// a 的冒泡
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
	<h2>先捕獲，再冒泡</h2>
	<table class="table" style="background-color:#eee;">
		<thead>
			<tr>
				<th>表格標題</th>
				<th>表格標題</th>
				<th>表格標題</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>資料</td>
				<td><a id="clickMe" href="success.html">資料</a></td>
				<td>資料</td>
			</tr>
			<tr>
				<td>資料</td>
				<td>資料</td>
				<td>資料</td>
			</tr>
		</tbody>
	</table>
</body>
</html>