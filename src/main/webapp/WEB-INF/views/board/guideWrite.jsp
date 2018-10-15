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
			}else if($("#tour_pay").val().trim()==''){
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
			}
			
			
			else{
				alert("업로드 성공");
				$("form").attr("action","/guide/guideWrite");
				$('form').submit();		
			}
			
			
			
		});
		
	});
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

	<form action="" method="post"
		enctype="multipart/form-data">
		<!--투어명-->
		<input type="text" name="tour_title" id="tour_title" placeholder="투어명"> <br>
		<!--투어 시작일시(날짜)-->
		<input type="text" name="tour_sdate" id="tour_sdate" placeholder="예) 2018-08-15">
		~
		<!--투어 종료일시(날짜)-->
		<input type="text" name="tour_edate" id="tour_edate" placeholder="예) 2018-08-17">
		<br>
		<!--투어 금액-->
		<input type="text" name="tour_pay" id="tour_pay" placeholder="투어금액"> <br>
		<!--투어 내용-->
		<textarea rows="10" cols="10" name="tour_cont" id="tour_cont" placeholder="투어내용"></textarea>
		<br>
		<!--투어 이미지-->
		<input type="file" name="tour_imgs" id="tour_imgs" id="tour_imgs"> <br>
		<!--게시글 번호 TEST 후 hide 처리-->
		<input type="text" name="board_no" placeholder="모두 머지 할시 히든처리">
		<br>
		<!--투어 등록하기-->
		<input type="button" id="tour_submit" value="투어 등록하기"> <br>
		<br>
	</form>

</body>
</html>