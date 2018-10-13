<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-내가올린글</title>
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
	<h1>마이페이지-내가올린글</h1>
	<hr>
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>


	<c:forEach items="${boardList }" var="boardVO">
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/board/myWrite?member_email=${boardVO.member_email}">전체 게시글 보기</a> 
	</div>
	
	
	
	<!--업로드한 게시글 가져오기-->
	<table border="1" cellpadding="3">

<%-- 		<c:forEach items="${boardList }" var="boardVO"> --%>
		<tr>
			<th>게시글 번호</th>
			<th>게시글 제목</th>
			<th>게시글 작성 날짜</th>
		</tr>
		
		
		<tr>
			<td>${boardVO.board_no }</td>
<%-- 			<td><img src="/resources/img/${boardVO.board_img }" height="70" width="70"></td> --%>
			<td><a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.board_date }"/></td>
		</tr>
	</table>
	</c:forEach>
</body>
</html>