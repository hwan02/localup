<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어신청 결제</title>
<!-- <style> -->
<!-- /*모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기*/ -->
<!-- #dialog-background { -->
<!--     display: none; -->
<!--     position: fixed; -->
<!--     top: 0; left: 0; -->
<!--     width: 100%; height: 100%; -->
<!--     background: rgba(0,0,0,.3); -->
<!--     z-index: 10; -->
<!-- } -->
<!-- #my-dialog { -->
<!--     display: none; -->
<!--     position: fixed; -->
<!--     left: calc( 50% - 160px ); top: calc( 50% - 70px ); -->
<!--     width: 320px; height: 140px;  -->
<!--     background: #fff; -->
<!--     z-index: 11; -->
<!--     padding: 10px; -->
<!-- } -->
<!-- </style> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#payGO").click(function() {
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			window.open("http://localhost/pay/payWindow", "pay",
					"width=570, height=350, resizable = no, scrollbars = no");
		});
		
		//모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기
// 		$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
// 			$("#my-dialog,#dialog-background").toggle();
// 		});
	});
</script>
</head>
<body>
	<h1>결제 페이지</h1>
	<hr>
	<form action="/pay/pay" method="post">
	<br>
	<!--DB가져오기-->
	<!--member_email-->
	<input type="text" name="member_email" placeholder="신청회원 이메일">
	<br>
	<!--DB입력 v-->
	<!--pay_num-->
	<input type="text" name="pay_num" placeholder="투어 인원">
	<br>
	<!--DB : 결제 수단으로 입력 v-->
	<!--pay_pay-->
	<!--pay_way-->
	<input type="text" name="pay_pay"  placeholder="결제금액">
	<br>
	<input type="button" id="payGO" value="결제 하기">
	<br>
	<input type="text" name="pay_way" id="pay_way" placeholder="결제수단">
	<br>
	<!--pay_state 결제 상태 TEST 후 hiden 처리 v-->
	<input type="hidden" name="pay_state" value="완료">
	<!--게시글 번호 TEST후 hiden 처리(DB에서 가져오기)-->
	<!--board_no-->
	<input type="text" name="board_no" placeholder="게시글번호">
	<br>
	<input type="submit"  value="확인">
	
	<!--모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기-->
<!-- 	<input type="button" id="btn-open-dialog" value="확인"> -->
<!-- 	<div id="my-dialog"> -->
<!--     	결제완료 ^^ -->
<!--     	<br> -->
<!--     	<a href="http://localhost/main"><button id="btn-close-dialog">메인 페이지</button></a>  -->
<!-- 	</div> -->
<!-- 	<div id="dialog-background"></div> -->
		</form>
</body>
</html>