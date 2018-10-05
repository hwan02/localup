<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자식창 값 전달 받기 TEST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		// window.open("open할 window", "자식창 이름", "팝업창 옵션");
		window.open("http://localhost/close", "childForm",
				"width=570, height=350, resizable = no, scrollbars = no");
	}
</script>
</head>
<body>
<h1>부모창</h1>
 <br>
    <b><font size="5" color="gray">부모창</font></b>
    <br><br>
    <input type="button" value="자식창 열기" onclick="openChild()">
    <br>
        전달할 값 : <input type="text" id="pInput">
</body>
</html>