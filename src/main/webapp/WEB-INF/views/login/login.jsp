<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>로그인</title>
<style type="text/css">
	input[type="text"], input[type="password"]{
		border-top: thin;
		border-left: thin;
		border-right: thin;
		/* border: 1px solid #dddddd; */
		height: 36px;
	}
	#login{
		width: 180px;
		background-color: lightgray;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script type="text/javascript">
if('${login}') {
	location.href = "/index";
}
if('${login_result}'=='fail'){
	alert('등록되지 않은 회원입니다.');
}

$(function(){
	$('#find').click(function(){
		window.open('/find', 'selectId', 'top=150px, left=90px, height=350px, width=500px, scrollbars=1');
		return false;
	});//ID/PW찾기 버튼
	
	$('#login').mouseenter(function(){ 
		$('#login').css("background-color","skyblue");
	});
	
	$("#login").mouseleave(function(){
        $("#login").css("background-color", "lightgray");
    });
});
</script>
</head>
<body class="container" style="text-align: center;">
	<h3 class="display-5">로그인</h3>
	<hr class="container">
	<%-- if(session.getAttribute("user") != null)
		<logic:present scope="session" name="user"> --%>
	<c:if test="${not empty sessionScope.id}">
		이미 로그인하셨습니다.<br>
		사용자<br>
		ID [ ${sessionScope.id } ]<br>
		<a href="/Funshop/login.do?action=logout">로그아웃</a>
	<%-- </logic:present> --%>
	</c:if>
	
	<c:if test="${empty sessionScope.id}">
		<form method="post" name="frm" id="frm">
			<input type="text" id="id" name="id" placeholder="Email"><br>
			<input type="password" id="pw" name="pw" placeholder="Password"><br>
			<br>
			<button id="login" class="btn">로그인</button><br><br>
		</form>
		<a href="" id="find">ID/PW 찾기</a>
		<a href="/member">회원가입</a>
	</c:if>
</body>
</html>