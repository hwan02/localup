<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%-- <%@include file="../main/index.jsp"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어신청 조회</title>

<!-- <script type="text/javascript"></script> -->
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--메뉴 클릭시 사이드바 생성-->
<script type="text/javascript" src="/resources/my_js/myApply.js"></script>



<!-- <link> -->
<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--전체 디자인 요소-->
<link rel= "stylesheet" type="text/css" href="/resources/my_css/myApply.css">

</head>


<body class="container">
	<br><br>
	<!--맨위로 클릭-->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<c:forEach items="${payList2}" var="PayInfoVO">
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
	
	<div class="container">
		<h1><a href="/index">투어신청 조회</a></h1>
	</div>	
	
	<!--검색-->
	<div class="col-4">
		<input id="myType" class="form-control" type="text"
			placeholder="Search..">
	</div>
	<br>

	<div class="container">
	<table class="table">
		<thead >
			<tr>
				<th>신청회원</th>
				<th>인원수</th>
				<th>투어 금액</th>
				<th>결제상태</th>
				<th>투어 올린글 확인하기</th>
			</tr>
		</thead>

		<tbody id="myTable">
			<c:forEach items="${payList2}" var="payList2"  varStatus="stat"> 
				<tr id="td_${stat.count }" style="display: none;">
					<td>${payList2.member_email}</td>
					<td>${payList2.pay_num }</td>
					<td>${payList2.pay_pay}</td>
					<td>${payList2.pay_state }</td>	
			
					
					<!--가이드 상세페이지 이동하기-->
					<td>
						<a href='/guide/guideDetailPage?board_no=${payList2.board_no}'>
							<button type="button" class="guideDetBT" style="vertical-align:middle"><span>가이드 상세페이지</span></button> 
						</a>
					</td>  
				</tr>
			</c:forEach>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="5" class="col-4">
					<a href="javascript:showMore();" class="btn btn-primary">더보기</a>
				</td>
			</tr>
		</tfoot>
		
	</table>
	</div>
</body>
</html>