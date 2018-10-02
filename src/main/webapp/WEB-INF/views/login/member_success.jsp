<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel= "stylesheet" type="text/css" href="/resources/login/index.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>회원가입</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<style type="text/css">
	input[type="text"], input[type="password"],select{
		display: inline-block;
		/* border: 1px solid #ccc; */
		border-left: thin;
		border-right: thin;
		border-top: thin;
		border-radius: 4px;
		box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
    	size: 50px;
		height: 37px;
		width: 400px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
</head>
<body class="container" style="text-align: center;">
	<br>
	<h3>회원가입 완료</h3>
	<hr>
	<div class="container" id="cont">
		<h5>환영합니다  (๑˃؂˂๑)</h5><br>
		가입이메일 ▶ ${member_eamil } 
	</div><br>
	<a href="/login">로그인 페이지로 이동</a>
</body>
</html>