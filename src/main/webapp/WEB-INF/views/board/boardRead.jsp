<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로컬업</title>
</head>
<body>
	<form method="post">
		<input type="text" name="board_no" value="${boardVO.board_no }"><br>
		제목: <input type="text" name="board_title" value="${boardVO.board_title }"><br>
		이메일(작성자): <input type="text" name="member_email" value="${boardVO.member_email }"><br>
		이미지: <img src="C:\\localup\\img\\${boardVO.board_img }"><br>
		이미지: <img src="<c:url value='/img/${boardVO.board_img }'/>"><br>
		이미지: <img src="${path }/img/${boardVO.board_img}"><br>
		내용: <textarea rows="20" cols="50">${boardVO.board_cont }</textarea><br>
	</form>
	<br><br>
	<hr>
	<form method="post">
		댓글: <textarea rows="5" cols="70"></textarea><br>
		이메일: <input type="text" name="member_email"><br>
	</form>
</body>
</html>