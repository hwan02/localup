<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#addSub').click(function(){
			var member_email_guide = $('input[name=member_email]').val();
			alert(member_email_guide);
		});
	});
</script>
</head>
<body>
	<h1>사용자정보</h1>
	<hr>
	<!--회원아이디-->
	ID: <input type="text" name="member_email" readonly value="${memberVO.member_email }">
	<br>
	<!--랭킹-->
	랭킹(레벨/경험치) : <input type="text" name="levels_name" value="${myLevel }" readonly>
	<br>
	
	<!--팔로워-->
	팔로워 : <input type="text" name="member_email_sub" readonly>
		<!--팔로워 클릭시 팔로우로 변경하기-->
		<input type="button" name="addSub" value="팔로워" id="addSub">
		<br><br>
	
	<!--업로드한 게시글 가져오기-->
	<table border="1" cellpadding="3">
		<c:forEach items="${boardList }" var="boardVO">
		<tr>
			<td>${boardVO.board_no }</td>
			<td><img src="/resources/img/${boardVO.board_img }" height="70" width="70"></td>
			<td><a href="/board/read?board_no=${boardVO.board_no }">${boardVO.board_title }</a></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.board_date }"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>