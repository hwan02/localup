<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경 확인 TEST</title>
</head>
<body>
	<h1>회원정보 변경 확인 TEST</h1>
	<hr>
	<form action="" method="post">
		<c:forEach items="${listAll}" var="memberVO">
		이메일
		<div><input type="text" disabled="disabled" name="member_email" value="${memberVO.member_email}"></div>
		<br>
		비밀번호
		<div><input type="password" name="member_pw" value="${memberVO.member_pw}"></div>
		<br>
		이름
		<div><input type="text" disabled="disabled" name="member_name" value="${memberVO.member_name}"></div>
		<br>
		주소
<!-- 		<div> -->
<%-- 			<input type="text" name="member_zipcode"  value="${memberVO.member_zipcode}" id="sample6_postcode" placeholder="우편번호"> --%>
<!-- 		</div> -->
		<div>
			<input type="text"  name="member_addr"  value="${memberVO.member_addr}" id="sample6_address" size="30" placeholder="주소">
<%-- 			<input type="text"  name="member_detailedaddress" value="${memberVO.member_detailedaddress}" id="sample6_address2" placeholder="상세주소">		 --%>
		</div>
		<br>
		연락처
		<div><input type="tel" name="member_tel" value="${memberVO.member_tel}"></div>
		<br>
		선호지역
		<div><input type="text" name="member_pref" value="${memberVO.member_pref}"></div>
		<br>
		소개
<%-- 		<div><input type="text" name="member_intro" value="${mUpdateVO.member_intro}"></div> --%>
		<div><textarea rows="10" cols="30" name="member_intro">${memberVO.member_intro}</textarea> </div>
		</c:forEach>
		<br>
		<a href="myUpdate">확인</a>
	</form>
</body>
</html>