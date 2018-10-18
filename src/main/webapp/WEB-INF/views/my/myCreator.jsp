<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 팔로우한 사용자</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/resources/my_css/myCreator.css">
<script type="text/javascript" src="/resources/my_js/myCreator.js"></script>
<style type="text/css">
	body{
		margin: 100px 20px 75px 200px;
		/*top right bottom left*/
	}
	table {
		width:40%;
		margin:20px 10px;
		border:1;
		
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
		<a href="/board/myWrite?member_email=${memberVO.member_email}">전체 게시글 보기</a> 
		<a href="/guide/myApplySchedule?member_email=${memberVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${memberVO.member_email}">투어 신청현황</a>  
		<a href="/guide/myApplyPast?member_email=${memberVO.member_email}">완료 투어</a>
		<a href="/member/myFan?member_email_guide=${member_email }">팔로워</a>
		<a href="/member/myCreate?member_email_sub=${member_email }">팔로잉</a>
	</div>
	
	<h4>내가 팔로우한 사용자</h4>
	
	<hr align="left" style="border: solid 2px #00ff80;" width="300px">
	<!-- <hr align="left" style="border: solid 2px #343a40;" width="200px"> -->
	<table cellpadding="3">
		<tr>
			<th colspan="2">팔로우</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${creator }" var="myGuide">
		<tr>
			<td>
				<img src="/resources/img/user_big.png" height="70" width="70">
			</td>
			<td>
				<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=${member_email}">${myGuide.member_email_guide }</a>
				<%-- <a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=localup@gmail.com">${myGuide.member_email_guide }</a> --%>
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<%-- <c:forEach items="${creator }" var="myGuide">
		<div>
			<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=${sessionScope.Id}">${myGuide.member_email_guide }</a>
			<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=localup@gmail.com">${myGuide.member_email_guide }</a>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
		</div>
	</c:forEach> --%>

</body>
</html>