<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--작성자 : rys-->
<title>가이드 상세페이지 등록</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
// 	$(function() {
// 		$('#submit').click(function() {
// 			//alert("업로드 성공");
// 			$('form').submit();
// 		});
		
// 	});
</script>
</head>
<body>
<h1>가이드 상세페이지 등록</h1>
<hr>
<!--
		DB
		투어번호
		투어명
		투어 시작일시(날짜)
		투어 종료일시(날짜)
		투어 금액
		투어 내용
		투어 이미지
		게시글 번호(FK : board_no)
-->

	<form action="/guide/guideWrite" method="post" enctype="multipart/form-data" target="zeroFrame">
	<!--투어명-->
	<input type="text" name="tour_title">
	<br>
	<!--투어 시작일시(날짜)-->
	<input type="text" name="tour_sdate" placeholder="예) 2018-08-15"> ~
	<!--투어 종료일시(날짜)-->
	<input type="text" name="tour_edate" placeholder="예) 2018-08-17">
	<br>
	<!--투어 금액-->
	<input type="text" name="tour_pay">
	<br>
	<!--투어 내용-->
	<textarea rows="10" cols="10" name="tour_cont"></textarea>
	<br>
	<!--투어 이미지-->
	<input type="file" name="tour_img">
	<br>
	<!--투어 등록하기-->
	<input type="submit" value="투어 등록하기">
	<br>
	</form>
	<iframe name="zeroFrame" style="display: none;"></iframe>
	<!--게시글 번호 TEST 후 hide 처리-->
	<input type="text"  name="board_no">
</body>
</html>