<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	body{
		/* margin: 70px 50px; */
		width: 480px;
		margin: 0 auto;
	}
	/* div{
		margin: 20px 30px;
	} */
	input[type="text"]{
		display: inline-block;
		/* border: 1px solid #ccc; */
		border-left: thin;
		border-right: thin;
		border-top: thin;
		border-radius: 4px;
		box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
    	size: 50px;
		height: 37px;
		width: 300px;
	}
	button{
		background-color: #00ff80;
		border: thin;
		border-radius: 10px;
		height: 40px;
		width: 90px;
	}
	input[type="button"]{
		background-color: #00ff80;
		border: thin;
		border-radius: 10px;
		height: 40px;
		width: 90px;
	}
	textarea{
		border-radius: 5px;
		height: 350px;
	}
</style>
</head>
<body>
	<!-- 게시글 내용 -->
	<form name="boardCont" id="boardCont" enctype="multipart/form-data" action="/board/update" method="post">
		<input type="text" name="board_no" value="${boardVO.board_no }" id="board_no"><br>
		<input type="text" name="board_title" value="${boardVO.board_title }" placeholder="제목"><br>
		<input type="text" name="member_email" value="${boardVO.member_email }" placeholder="이메일"><br>
		<img src="/resources/img/${boardVO.board_img }" width="420" height="300"><br>
		<%-- <input type="text" value="${boardVO.board_img }" size="50"><br> --%>
		<!-- <input type="file" name="board_imgs" id="board_imgs"><br> -->
		<textarea rows="20" cols="50" name="board_cont">${boardVO.board_cont }</textarea><br>
		<a href="/board/update?board_no=${boardVO.board_no }"><button id="updateBoard">수정등록</button></a> 
		<button type="reset" id="reset">취소</button>
	</form>
</body>
</html>