<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가이드 상세페이지 수정폼</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//수정
		$("#update").click(function() {
			$("form").attr("action","/guide/guideUpdate");
			$("form").submit();
		});
		
		//삭제
		$("#delete").click(function() {
			$("form").attr("action","/guide/guideDelete");
			alert("삭제완료");
			$("form").submit();
		});
	});
</script>
</head>
<body class="container">
<br><br><br>
	<h1>투어 수정</h1>
	<br>

	<form action="" method="post">
		<!--투어 번호 TEST 후 hide 처리-->
		<input type="hidden" class="form-control" name="tour_no" value="${GuideVO.tour_no}">
		<label>투어명</label>
		<br>
		<input type="text" class="form-control" name="tour_title" value="${GuideVO.tour_title}">
		<br>
		<label>투어 시작일시</label> 
		<br>
		<!--투어 시작일시(날짜)-->
		<input type="text" class="form-control" name="tour_sdate" value="${GuideVO.tour_sdate}">
    	<br>
    	<label>투어 종료일시</label>
    	<br>
    	<!--투어 종료일시(날짜)-->
		<input type="text" class="form-control" name="tour_edate" value="${GuideVO.tour_edate}">
		<br>
		<!--투어 금액-->
		<label>투어 금액</label>
		<br>
		<input type="text" class="form-control" name="tour_pay" value="${GuideVO.tour_pay}">
		<br>
		<!--투어 내용-->
		<label>투어 내용</label>
		<br>
		<textarea class="form-control" rows="10" cols="10" name="tour_cont">${GuideVO.tour_cont}</textarea>
		<br>
<%-- 		<a href="/guide/guideDetailPage?board_no=${GuideVO.board_no}"><input type="button" id="update" value="수정"></a> <input type="button" id="delete" value="삭제"> --%>
		<input type="button" class="btn btn-warning" id="update" value="수정"> <input type="button" class="btn btn-danger" id="delete" value="삭제">
	</form>
	<br><br>
</body>
</html>