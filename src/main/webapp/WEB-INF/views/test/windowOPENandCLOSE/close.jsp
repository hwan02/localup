<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자식창 값 전달  TEST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#sumit").click(function(){
			opener.document.getElementById("pInput").value = document.getElementById("cInput").value
			window.close() //닫기 동시에 전달하기!!!
		});
		$("#sumit2").click(function(){
			opener.document.getElementById("pInput").value = document.getElementById("cInput2").value
			window.close() //닫기 동시에 전달하기!!!
		});

	});
</script>


</head>
<body>
  <br>
    <b><font size="5" color="gray">자식창</font></b>
    <br><br>
 
    <input type="text" id="cInput"> <input type="button" id="sumit" value="전달하기">
    <input type="text" id="cInput2"> <input type="button" id="sumit2" value="전달하기2">
</body>
</html>