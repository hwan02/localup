<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 페이지</title>
<link rel= "stylesheet" type="text/css" href="/resources/login/index.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">
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
		width: 400px;
	}
</style>
</head>
<body>
	<h1>사용자정보</h1>
	<hr>
	<!--회원아이디-->
<%-- 	ID : <input type="text" readonly value="${memberVO.member_email }"> --%>
	<br>
	<!--랭킹-->
	랭킹(레벨/경험치) : <input type="text" name="" readonly>
	<br>
	<!--팔로워-->
	팔로워 :	<input type="text" name="" readonly>

			<!--팔로워 클릭시 팔로우로 변경하기-->
			<input type="button" name="" value="팔로워">
	<br><br>
	<!--업로드한 게시글 가져오기-->
	<table border="1" cellpadding="5">
		<tr>
<%-- 			<td><img src="/resources/img/${boardVO.board_img }"> </td> --%>
		</tr>
		<tr>
			<td><input type="text" name="" readonly></td>
		</tr>
	</table>
</body>
</html>