<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>랭킹</title>
</head>
<body>
<h3>랭킹</h3>
	맛집<hr>
	<c:forEach items="${restaurant }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="50" height="50" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	교통<hr>
	<c:forEach items="${traffic }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="50" height="50" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	편의시설<hr>
	<c:forEach items="${facilities }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="50" height="50" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	숙박<hr>
	<c:forEach items="${lodgment }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="50" height="50" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>
	
	랜드마크<hr>
	<c:forEach items="${randmark }" var="boardVO" varStatus="status">
		<div>
			${status.count}
			<img src="/resources/img/${boardVO.board_img }" width="50" height="50" >
			<a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a>
			${boardVO.member_email }
			<img src="/resources/img/like.png" width="15" height="15">[${boardVO.board_like }]
			<fmt:formatDate pattern="yyyy-MM-dd" value="${boardVO.board_date }"/>
		</div>
	</c:forEach>
	<br>

</body>
</html>