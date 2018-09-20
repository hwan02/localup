<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경 TEST</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h1>회원정보 변경 TEST</h1>
	<hr>
	<form action="memberUpdate" method="post">
		<c:forEach items="${memberUpdateVO}" var="mUpdateVO">
		이메일
		<div><input type="text" disabled="disabled" name="member_email" value="${mUpdateVO.member_email}"></div>
		<input type="hidden"  name="member_email" value="${mUpdateVO.member_email}">
		<br>
		비밀번호
		<div><input type="password" name="member_pw" value="${mUpdateVO.member_pw}"></div>
		<br>
		이름
		<div><input type="text" disabled="disabled" name="member_name" value="${mUpdateVO.member_name}"></div>
		<br>
		주소
		<div><input type="text" name="member_addr" value="${mUpdateVO.member_addr}"> <button type="button">주소검색</button> </div>
		<br>
		연락처
		<div><input type="tel" name="member_tel" value="${mUpdateVO.member_tel}"></div>
		<br>
		선호지역
		<div><input type="text" name="member_pref" value="${mUpdateVO.member_pref}"></div>
		<br>
		소개
		<div><input type="text" name="member_intro" value="${mUpdateVO.member_intro}"></div>
		</c:forEach>
		<br>
		<button>수정</button>
	</form>
</body>
</html>