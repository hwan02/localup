<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-투어 예정</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--메뉴 클릭시 사이드바 생성-->
<script type="text/javascript" src="/resources/my_js/myApplySchedule.js"></script>

<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--메뉴 클릭시 사이드바 생성-->
<link rel="stylesheet" href="/resources/my_css/myApplySchedule.css">


</head>
<body class="container">
	<br><br>
	<!--맨위로 클릭-->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<c:forEach items="${PayInfoVO}" var="PayInfoVO">
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/member/myUpdate?member_email=${PayInfoVO.member_email}">회원정보 변경</a>
		<a href="/board/myWrite?member_email=${PayInfoVO.member_email}">전체 게시글 보기</a>
		<a href="/guide/myApplySchedule?member_email=${PayInfoVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${PayInfoVO.member_email}">투어신청 조회</a>  
		<a href="/guide/myApplyPast?member_email=${PayInfoVO.member_email}">완료 투어</a>
		<a href="/member/myFan?member_email_guide=${member_email }">팔로워</a>
		<a href="/member/myCreate?member_email_sub=${member_email }">팔로잉</a>
	</div>
	</c:forEach>
	
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	<br>
	<div class="container">
		<h1>
			<a href="/index">투어예정</a>
		</h1>
	</div>

	<!--검색-->
	<div class="col-4">
		<input id="myType" class="form-control" type="text" placeholder="Search..">
	</div>
	<br>
	

	<table class="table">
		<thead>
		<tr>
			<th>투어명</th>
			<th>시작 날짜</th>
			<th>마지막 날짜</th>
			<th>투어 올린글 확인하기</th>
		</tr>
		</thead>

		<tbody  id="myTable">
		<c:forEach items="${GuideVO}" var="GuideVO" varStatus="stat">
				<tr id="td_${stat.count }" style="display: none;">
					<td>${GuideVO.tour_title }</td>

					<!--투어금액 -->
					<td>${GuideVO.tour_sdate}</td>

					<td>${GuideVO.tour_edate }</td>

					<!--가이드 상세페이지 이동하기-->
					<td>
						<a href='/guide/guideDetailPage?board_no=${GuideVO.board_no}'>
							<button type="button" class="guideDetBT"
								style="vertical-align: middle">
								<span>확인</span>
							</button>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		
				<tfoot>
			<tr>
				<td colspan="5">
					<a href="javascript:showMore();" class="btn btn-primary">더보기</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
</body>
</html>