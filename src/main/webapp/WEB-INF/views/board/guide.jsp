<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--작성자 : rys-->
<title>가이드 상세페이지</title>

<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		if (msg == "success") {
			alert("등록완료 ;)");
		}else if(msg == "upfail"){
			alert("등록 실패 :(");
		}
	});
</script>
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
	<!--투어 내용-->
	<label>투어 내용</label>
	<br>
	<textarea rows="10" cols="10" name="tour_cont">${GuideVO.tour_cont}</textarea>
	<br>
	<!--투어 이미지-->
	<input type="image" src="/resources/img/${GuideVO.tour_img }">
	<br>
	<!--투어 신청하기-->
	<a href="http://localhost/pay/pay"><input type="button" value="투어 신청"></a>
	<br>
	<!--게시글 상페이지로 이동하기-->
	<a href="http://localhost/board/read?board_no=1"><input type="button" value="게시글 작성"></a> 
	<!--게시글 번호 TEST 후 hide 처리-->
	<input type="hidden" value="${GuideVO.board_no }">
</body>
</html>