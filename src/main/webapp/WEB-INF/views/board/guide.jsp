<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--작성자 : rys-->
<title>가이드 상세페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
		
		$('#tourUpdate').click(function(){
			//alert('dddd');
			var email = $('#writeEmail').val();
			var login_email = $('#login_email').val();
			
			if(email != login_email){
				alert('이 게시글을 작성한 사용자만 수정할 수 있습니다');
			}else{
				self.location="/guide/guideUpdate?tour_no=${GuideVO.tour_no}"; //수정폼으로 이동
			}
 		}); //수정 버튼
	});
			
// 	$('#tourUpdate').click(function(){//('click','li button',function(){
// 		var member_email = $('#member_email').val();
// 		var login_email = $('#login_email').val();
// 		if(member_email != login_email){
// 			alert('이 댓글을 작성한 사용자만 수정할 수 있습니다');
// 			return;
// 		}
// 	});

</script>
</head>
<body class="container">
<br><br><br>
<h1>투어신청</h1>	
	<input type="hidden" name="writeEmail" value="${writeEmail }" id="writeEmail"><br>
	<input type="hidden" name="login_email" value="${member_email }" id="login_email"><br>

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
<%-- 	<input type="hidden" name="login_email" value="${member_email }" id="login_email"> --%>


	<!--투어 번호 TEST 후 hide 처리-->
	<input type="hidden" class="form-control" value="${GuideVO.tour_no}">
	<br>
	<!--투어명-->
	<label>투어명</label>
	<br>
	<input type="text"  class="form-control" readonly="readonly" value="${GuideVO.tour_title}">
	<br>
	<!--투어 시작일시(날짜)-->
	<label>투어 시작일시</label>
	<br>
	<input type="text"  class="form-control" readonly="readonly" value="${GuideVO.tour_sdate}">
    <br>
    <label>투어 종료일시</label>
    <!--투어 종료일시(날짜)-->
	<input type="text" class="form-control"  readonly="readonly" value="${GuideVO.tour_edate}">
	<br>
	<!--투어 금액-->
	<label>투어(1인) 금액</label>
	<br>
	<input type="text" class="form-control" readonly="readonly" value="${GuideVO.tour_pay}">
	<br>
	<!--투어 내용-->
	<label>투어 내용</label>
	<br>
	<textarea class="form-control" rows="10" cols="10" name="tour_cont">${GuideVO.tour_cont}</textarea>
	<br>
	<!--투어 이미지-->
	<input type="image" src="/resources/img/${GuideVO.tour_img }">
	<br>
	<!--투어 신청하기-->
	<a href="http://localhost/pay/pay?board_no=${GuideVO.board_no}"><input type="button" class="btn btn-danger" value="투어 결제"></a>
	<!--게시글 상페이지로 이동하기-->
	<a href="/board/read?board_no=${GuideVO.board_no }"><input type="button" class="btn btn-success" value="게시글 상세페이지"></a> 
	<!-- 게시글 상페이지 수정폼 이동하기 -->
	<%-- <a href="/guide/guideUpdate?tour_no=${GuideVO.tour_no}" id="tourUpdate"> --%>
		<input type="button" class="btn btn-warning"  value="투어 수정" id="tourUpdate">
	<!-- </a> -->
	<!--게시글 번호 TEST 후 hide 처리-->
	<input type="hidden" value="${GuideVO.board_no }">
	<br><br><br><br>
	
</body>
</html>