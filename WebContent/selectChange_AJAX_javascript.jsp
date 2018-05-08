<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<!-- <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script> -->
<title>三階層動態選單</title>
</head>
<script type="text/javascript">
	function init(){
		document.getElementById("grade").onchange = function(){
			var xhr = new XMLHttpRequest();
			//設定好回呼函數 
			xhr.onreadystatechange = function(){
			  	if(xhr.readyState == 4){
			  		if(xhr.status == 200){
			  			var data = JSON.parse(xhr.responseText);                     // parse to JSON format
						clearSelect();
			  			data.forEach(function(item) {
			  				var node = document.createElement("option");             // Create a <option> node
			  				node.value = item.classId;							     // Set the value
			  				var textnode = document.createTextNode(item.className);  // Set the text
			  				node.appendChild(textnode);                              // Append the text to <option>
			  				document.getElementById("class").appendChild(node);
			  			});
			  		} else{
			  			alert(xhr.status);
			  			alert("AJAX-grade發生錯誤囉!");
			  		}
			  	}
			}  
			//建立好Get連接與送出請求
			var url= "ajaxResponse.do?" + creatQueryString(this.value, "");
			xhr.open("get", url, true); // method, url, async
			xhr.send(null); 
		};
		
		document.getElementById("class").onchange = function(){
			var xhr = new XMLHttpRequest();
			//設定好回呼函數 
			xhr.onreadystatechange = function(){
			  	if(xhr.readyState == 4){
			  		if(xhr.status == 200){
			  			var data = JSON.parse(xhr.responseText);                     // parse to JSON format
						clearSelect2();
			  			data.forEach(function(item) {
			  				var node = document.createElement("option");             // Create a <option> node
			  				node.value = item.nameId;							     // Set the value
			  				var textnode = document.createTextNode(item.name);       // Set the text
			  				node.appendChild(textnode);                              // Append the text to <option>
			  				document.getElementById("name").appendChild(node);
			  			});
			  		} else{
			  			alert(xhr.status);
			  			alert("AJAX-grade發生錯誤囉!");
			  		}
			  	}
			}
		
			//建立好Post連接與送出請求
			var url= "ajaxResponse.do";
			xhr.open("post", url, true); //先open a connection
			xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded"); //再設定requestHeader為urlencoded (POST method)
			var data = creatQueryString(document.getElementById("grade").value, this.value);
			xhr.send(data);
		}
	}
	
	function creatQueryString(paramGrade, paramClass){
		console.log("paramGrade:"+paramGrade+"; paramClass:"+paramClass);
		var queryString= "action=getSelect&gradeId="+paramGrade+"&classId="+paramClass;
		return queryString;
	}
	function clearSelect(){
		document.getElementById("class").innerHTML = '';
		var node = document.createElement("option");           // Create a <option> node
		node.value = "-1";							      	   // Set the value
		var textnode = document.createTextNode("請選擇");       // Set the text
		node.appendChild(textnode);                            // Append the text to <option>
		document.getElementById("class").appendChild(node);
		
		document.getElementById("name").innerHTML = '';
		var node = document.createElement("option");           // Create a <option> node
		node.value = "-1";							      	   // Set the value
		var textnode = document.createTextNode("請選擇");       // Set the text
		node.appendChild(textnode);                            // Append the text to <option>
		document.getElementById("name").appendChild(node);
	}
	function clearSelect2(){
		document.getElementById("name").innerHTML = '';
		var node = document.createElement("option");           // Create a <option> node
		node.value = "-1";							      	   // Set the value
		var textnode = document.createTextNode("請選擇");       // Set the text
		node.appendChild(textnode);                            // Append the text to <option>
		document.getElementById("name").appendChild(node);
	}
	window.onload=init;
</script>
<body>
	年級：
	<select id="grade">
		<option value="-1">請選擇</option>
		<option value="grade3">三年級</option>
		<option value="grade2">二年級</option>
		<option value="grade1">一年級</option>
	</select>
	班別：
	<select id="class">
		<option value="-1">請選擇</option>
	</select>
	姓名:
	<select id="name">
		<option value="-1">請選擇</option>
	</select>
	<br><br>
	<iframe width="860" height="615" src="https://www.youtube.com/embed/aVmZpcrQBU4?autoplay=1" frameborder="0" allowfullscreen></iframe>
</body>
</html>