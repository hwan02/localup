<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--작성자 : rys-->
<title>투어 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		//날짜 유효성 검사
		var dateExp = /^\d{4}-\d{2}-\d{2}$/; //숫자 8자리(하이픈 포함)
		
		//공백 유효성 검사
		//var nullExp=/s$/;
		
		//투어금액 유효성 검사	
		var payExp=/^\d$/;
		
		$('#tour_submit').click(function() {
			if($("#tour_title").val().trim()==''){
				alert("투어명 입력하세요");
				$("#tour_title").val("");
				$("#tour_title").focus("");
			}else if(!dateExp.test($('#tour_sdate').val() )){ //숫자 유효성 검사
				alert("날짜 다시입력 하세요 ;)" );
				$('#tour_sdate').val("");
				$('#tour_sdate').focus();   
			}else if(!dateExp.test($('#tour_edate').val() )){
				alert("날짜 다시입력 하세요 ;)" );
				$('#tour_edate').val("");
				$('#tour_edate').focus();
			}else if(!payExp.test($("#tour_pay").val()) ){
				alert("투어금액 입력하세요");
				$("#tour_pay").val("");
				$("#tour_pay").focus("");
			}else if($("#tour_cont").val().trim()==''){
				alert("투어내용 입력하세요");
				$("#tour_cont").val("");
				$("#tour_cont").focus("");
			}else if($("#tour_imgs").val().trim()==''){
				alert("이미지가 없습니다.");
				$("#tour_imgs").val("");
				$("#tour_imgs").focus("");
			}else{
				alert("업로드 성공");
				$("form").attr("action","/guide/guideWrite");
				$('form').submit();		
			}
			
			
			
		});
		
	});
</script>
</head>
<body class="container">
<br><br><br>
<h1>투어 등록</h1>
<br>
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

	<form method="post"
		enctype="multipart/form-data">
		<!--투어명-->
		<input type="text" class="form-control" name="tour_title" id="tour_title" placeholder="투어명"> <br>
		<!--투어 시작일시(날짜)-->
		<input type="text"  class="form-control"name="tour_sdate" id="tour_sdate" placeholder="예) 투어 시작날짜 : 2018-08-15">
		<br>
		<!--투어 종료일시(날짜)-->
		<input type="text"  class="form-control" name="tour_edate" id="tour_edate" placeholder="예) 투어 끝나는날짜 : 2018-08-17">
		<br>
		<!--투어 금액-->
		<input type="text" class="form-control" name="tour_pay" id="tour_pay" placeholder="투어금액"> <br>
		<!--투어 내용-->
		<textarea class="form-control" rows="10" cols="10" name="tour_cont" id="tour_cont" placeholder="투어내용"></textarea>
		<br>
		<!--투어 이미지-->
		<input type="file" name="tour_imgs" id="tour_imgs" id="tour_imgs"> <br>
		<!--게시글 번호 TEST 후 hide 처리-->
			<input type="hidden" name="board_no" value="${board_no }" placeholder="모두 머지 할시 히든처리">
		<br>
		<!--투어 등록하기-->
		<!-- <button type="button" id="tour_submit" class="btn btn-danger">투어 등록하기</button> -->
		<input type="button" class="btn btn-danger" id="tour_submit" value="투어 등록하기">
	
		<br>
		<br>
	</form>

</body>
</html>