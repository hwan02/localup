<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!-- 게시글 내용 -->
	<form name="boardCont" id="boardCont" enctype="multipart/form-data" action="/board/update" method="post">
		<input type="text" name="board_no" value="${boardVO.board_no }" id="board_no"><br>
		제목: <input type="text" name="board_title" value="${boardVO.board_title }"><br>
		이메일(작성자): <input type="text" name="member_email" value="${boardVO.member_email }"><br>
		이미지: <img src="/resources/img/${boardVO.board_img }" width="300" height="300"><br>
		<%-- <input type="text" value="${boardVO.board_img }" size="50"><br> --%>
		<input type="file" name="board_imgs" id="board_imgs"><br>
		내용: <textarea rows="20" cols="50" name="board_cont">${boardVO.board_cont }</textarea><br>
		<a href="/board/update?board_no=${boardVO.board_no }"><button id="updateBoard">수정등록</button></a> 
		<button type="reset" id="reset">취소</button>
	</form>
</body>
</html>