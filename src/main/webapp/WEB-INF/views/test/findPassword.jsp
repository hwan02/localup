<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기 Test</title>
</head>
<body>
<h1>비밀번호 찾기 Test</h1>
<hr>
	<form action="send" method="post">
		<input type="text" name="subject" placeholder="아이디 입력">
		<br>
		<input type="email" name="receiver" placeholder="abc@abc.com">
		<br>
		<input type="hidden" name="content" value="${key}">
		<input type="text" name="temporaryPW" placeholder="인증번호 입력">
		<br>
		<div><input type="submit" value="비번 업데이트"></div>
<!-- 		<div><input type="submit" value="비번찾기"></div> -->
	</form>
	
</body>
</html>