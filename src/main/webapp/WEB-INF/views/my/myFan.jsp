<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나를 팔로우한 사용자들</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/my_css/myFan.css">

<script type="text/javascript" src="/resources/my_js/myFan.js"></script>

<style type="text/css">
	body{
		margin: 100px 20px 75px 200px;
		/*top right bottom left*/
	}
	table {
		width:40%;
		margin:20px 10px;
		border:1;
		border-color: #00ff80;
	}
	th{
		text-align: left;
	}
</style>
</head>
<body>
	<br><br>
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/member/myUpdate?member_email=${member_email}">회원정보 변경</a> 
		<a href="/board/myWrite?member_email=${member_email}">전체 게시글 보기</a> 
		<a href="/guide/myApplySchedule?member_email=${member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${member_email}">투어 신청현황</a>  
		<a href="/guide/myApplyPast?member_email=${member_email}">완료 투어</a>
		<a href="/member/myFan?member_email_guide=${member_email }">팔로워</a>
		<a href="/member/myCreate?member_email_sub=${member_email }">팔로잉</a>
	</div>
	
	<h4>나를 팔로우한 사용자들</h4>
	<hr align="left" style="border: solid 2px #00ff80;" width="300px">
	<!-- <hr align="left" style="border: solid 2px #343a40;" width="200px"> -->
	<table cellpadding="3">
		<tr>
			<th colspan="2">팔로우</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${member_email_sub }" var="myGuide">
		<tr>
			<td>
				<img src="/resources/img/user_big.png" height="70" width="70">
			</td>
			<td>
				${myGuide.member_email_sub }
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<%-- 
	<c:forEach items="${member_email_sub }" var="myGuide">
		<div>
			${myGuide.member_email_sub }
			<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
		</div>
	</c:forEach>
	 --%>
</body>
</html>