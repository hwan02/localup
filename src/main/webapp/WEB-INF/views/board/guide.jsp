<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--작성자 : rys-->
<title>가이드 상세페이지</title>
</head>
<body>
<h1>가이드 상세페이지</h1>
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

	<!--투어 번호 TEST 후 hide 처리-->
	<input type="hidden" value="${GuideVO.tour_no}">
	<br>
	<!--투어명-->
	<label>투어명</label>
	<br>
	<input type="text" readonly="readonly" value="${GuideVO.tour_title}">
	<br>
	<!--투어 시작일시(날짜)-->
	<label>투어 시작일시</label> <label>투어 종료일시</label>
	<br>
	<input type="text" readonly="readonly" value="${GuideVO.tour_sdate}"> ~
    <!--투어 종료일시(날짜)-->
	<input type="text" readonly="readonly" value="${GuideVO.tour_edate}">
	<br>
	<!--투어 금액-->
	<label>투어 금액</label>
	<br>
	<input type="text" readonly="readonly" value="${GuideVO.tour_pay}">
	<br>
	<!--투어 이미지-->
	<input type="image" src="/resources/img/${GuideVO.tour_img }">
	<br>
	<!--투어 신청하기-->
	<a href="http://localhost/pay/pay"><input type="button" value="투어 신청"></a>
	<br>
	<!--게시글 번호 TEST 후 hide 처리-->
	<input type="hidden" value="${GuideVO.board_no }">
</body>
</html>