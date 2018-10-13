<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가이드 신청 현황</title>

<!--메뉴 클릭시 사이드바 생성-->
<style>
body {
	font-family: "Lato", sans-serif;
	transition: background-color .5s;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>

<!--메뉴 클릭시 사이드바 생성-->
<script>
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft = "0";
		document.body.style.backgroundColor = "white";
	}
</script>
</head>
<body>
	<h1>투어 예정</h1>
	<hr>
	<c:forEach items="${PayInfoVO}" var="PayInfoVO">
	<c:forEach items="${GuideVO}" var="GuideVO">

	
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/guide/myApplySchedule?member_email=${PayInfoVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${PayInfoVO.member_email}">투어 신청현황</a> 
		<a href="/guide/myApplyPast?member_email=${PayInfoVO.member_email}">완료 투어</a> 
	</div>

	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	

	<table border="1" cellpadding="5">
<%-- 	<c:forEach items="${GuideVO}" var="GuideVO"> --%>
		<tr>
			<th>투어명</th>
			<th>시작 날짜</th>
			<th>마지막 날짜</th>
			<th>투어 올린글 확인하기</th>
		</tr>



		<tr>
<%-- 			<td>${PayInfoVO.member_email}</td> --%>
<%-- 			<td>${GuideVO.tour_title}</td> --%>
			<td>${GuideVO.tour_title }</td>
			
			<!--투어금액 -->
			<td>${GuideVO.tour_sdate}</td>
			
			<td>${GuideVO.tour_edate }</td>
			
			<!--가이드 상세페이지 이동하기-->
			<td>
				<a href='/guide/guideDetailPage?board_no=${PayInfoVO.board_no}'>	
					<input type="button"  class="guideDetailPage" value="가이드 상세페이지">
				</a>
			</td>
		</tr>
<%-- 	</c:forEach> --%>
	</table>
	</c:forEach>
	</c:forEach>
</body>
</html>