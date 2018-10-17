<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>랭킹</title>
<style type="text/css">
	body{
		margin: 70px 50px;
	}
	div{
		margin: 20px 30px;
	}
</style>
</head>
<body>
	<h2>랭킹</h2>
	맛집<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<c:forEach items="${restaurant }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="100" height="100" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	교통<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<c:forEach items="${traffic }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="100" height="100" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	편의시설<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<c:forEach items="${facilities }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="100" height="100" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	숙박<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<c:forEach items="${lodgment }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="100" height="100" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	랜드마크<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<c:forEach items="${randmark }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="100" height="100" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>

</body>
</html>