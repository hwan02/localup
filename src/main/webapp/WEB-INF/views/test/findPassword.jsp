<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã�� Test</title>
</head>
<body>
<h1>��й�ȣ ã�� Test</h1>
<hr>
	<form action="send" method="post">
		<input type="text" name="subject" placeholder="���̵� �Է�">
		<br>
		<input type="email" name="receiver" placeholder="abc@abc.com">
		<br>
		<input type="hidden" name="content" value="${key}">
		<input type="text" name="temporaryPW" placeholder="������ȣ �Է�">
		<br>
		<div><input type="submit" value="��� ������Ʈ"></div>
<!-- 		<div><input type="submit" value="���ã��"></div> -->
	</form>
	
</body>
</html>