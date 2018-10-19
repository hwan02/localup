<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-내가올린글</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!--메뉴 클릭시 사이드바 생성-->
<script src="/resources/my_js/myWrite.js"></script>

<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--메뉴 클릭시 사이드바 생성-->
<link rel="stylesheet" href="/resources/my_css/myWrite.css">


</head>
<body class="container">
	<br><br>
	<!--맨위로 클릭-->
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	
	<div class="container">
		<h1><a href="/index">마이페이지-내가올린글</a></h1>
	</div>

	<!--검색-->
	<div class="col-4">
		<input id="myType" class="form-control" type="text" placeholder="Search..">
	</div>
	<br>

	<c:forEach items="${boardList }" var="boardVO">
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
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
	</c:forEach>
	<br>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>게시글 유형별</th>
					<th>게시글 제목</th>
					<th>게시글 작성 날짜</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach items="${boardList }" var="boardVO" varStatus="stat">
					<tr id="td_${stat.count }" style="display: none;">
						<td>${boardVO.board_no }</td>
						<td>${boardVO.board_type }</td>
						<td><a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardVO.board_date }" /></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5"><a href="javascript:showMore();"
						class="btn btn-primary">더보기</a></td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>