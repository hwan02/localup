<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어신청 결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
/*모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기*/
#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}
</style>

<script type="text/javascript">
	$(function() {
		//숫자 유효성 검사
		var numExp = /^\d+$/; 			//숫자 4자리(하이픈 포함)
		var emailExp = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/;
		
		$("#payGO").click(function() {
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			window.open("http://localhost/pay/payWindow", "pay",
					"width=570, height=350, resizable = no, scrollbars = no");
		});
		

		//모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기
		$("#btn-open-dialog,#dialog-background,#btn-close-dialog").click(function () {
			$("#my-dialog,#dialog-background").toggle();
			
		});	

		
		$("#btn-close-dialog-main").click(function() {

				
			$('form').attr('action','/pay/pay');
			$('form').submit();
			
			
		});

		
		
		//투어인원 입력시 자동 계산
		$("#pay_num").keyup(function() {
	        var vp1 = $(this).val();
	        if(vp1 > 0) {
	            //var paygogo = Math.round(vp1 * $("#pay_pay2"));
	            $("#pay_pay").val(Math.round(vp1 * ${GuideVO.tour_pay}));
	        }
		});
});		
			
			
			
			
			
	
		


</script>
</head>
<body class="container">
	<br><br><br>
	<h1>결제 페이지</h1>
	
	<form action="" method="post">
		<br>
		<!--DB가져오기-->
		<!--member_email-->
		<input type="text" class="form-control" name="member_email"  id="member_email" placeholder="신청회원 이메일" >
<!-- 		<input type="text" id="email1" name="email1" placeholder="아이디">@ -->
<!-- 						<input type="text" id="email2" name="email2" placeholder="이메일 주소"> -->
		<br>
		<!--DB입력 v-->
		<!--pay_num-->
		<input type="text" class="form-control" name="pay_num" id="pay_num"   placeholder="투어 인원">
		<br>
		<!--DB : 결제 수단으로 입력 v-->
		<!--pay_pay-->
		<!--pay_way-->
		<div>1인 금액</div>
		<input type="text" class="form-control" readonly="readonly" id="pay_pay2" value="${GuideVO.tour_pay }" placeholder="결제금액">
		<br>
		<input type="text" class="form-control" name="pay_pay" id="pay_pay" 
			readonly="readonly" placeholder="투어인원 입력시 결제금액 자동계산">
		<br>
		<div class="input-group mb-3">
  		<div class="input-group-append">
  		<input type="button" class="btn btn-success" id="payGO" value="결제 하기">
  		</div>
		<input type="text" class="form-control" name="pay_way" readonly="readonly" id="pay_way" placeholder="결제수단"> 
		</div>

		<!--pay_state 결제 상태 TEST 후 hiden 처리 v-->
		<input type="hidden" name="pay_state" value="결제완료">
		<!--게시글 번호 TEST후 hiden 처리(DB에서 가져오기)-->
		<!--board_no-->
		<input type="hidden" name="board_no" value="${GuideVO.board_no }" placeholder="게시글번호">
		<br>
<!-- 		<input type="submit" value="확인"> -->

		<!--모달창 : 메인 페이지로 가기, 마이페이지 내역으로 가기-->
		<input type="button" class="btn btn-success" id="btn-open-dialog" value="확인">
		<div id="my-dialog">
			<label>한번 더 확인 할 필요 없나요??</label>
			<br>
			<button type="button" class="btn" id="btn-close-dialog-main">메인 페이지</button>
<!-- 			<button type="button" id="btn-close-dialog-mypage">마이 페이지</button> -->
<!-- 			<br><br> -->
			<button type="button"  class="btn btn-danger" id="btn-close-dialog">닫기</button>
		</div>
		<div id="dialog-background"></div>
	</form>
</body>
</html>