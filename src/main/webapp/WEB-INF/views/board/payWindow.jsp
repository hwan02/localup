<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어 결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {

	//확인 버튼시 pay.jsp에 전달
		$("#KBcheck").click(
				function() {
					var cardNumExp = /^([0-9]{1,4})-?([0-9]{1,4})-?([0-9]{1,4})-?([0-9]{1,4})$/; //숫자 16자리(하이픈 제외)
					if(!cardNumExp.test($('#KBcardNumber').val() )){ //카드번호 유효성 검사
						alert("카드번호 다시입력 하세요 ;)" );
						$('#KBcardNumber').focus();
					}else{
						opener.document.getElementById("pay_way").value = 
							document.getElementById("KBcard").value
						window.close(); //닫기 동시에 전달하기!!!
					}
				
				});

		$("#Kakaocheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("Kakaocard").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		$("#KEBHanacheck").click(
				function() {

					opener.document.getElementById("pay_way").value = document
							.getElementById("KEBHanacard").value

					window.close(); //닫기 동시에 전달하기!!!
				});

		$("#Shinhancheck").click(
				function() {

					opener.document.getElementById("pay_way").value = document
							.getElementById("ShinhanCard").value

					window.close(); //닫기 동시에 전달하기!!!
				});

		$("#nonghyupcheck").click(
				function() {

					opener.document.getElementById("pay_way").value = document
							.getElementById("nonghyupCard").value

					window.close(); //닫기 동시에 전달하기!!!
				});

		$("#Kbankcheck").click(
				function() {

					opener.document.getElementById("pay_way").value = document
							.getElementById("KbankCard").value

					window.close(); //닫기 동시에 전달하기!!!
				});

		//국민카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KBcard").click(function() {
			$("#KBcardNumberInput").toggle(1000);
			$("#KBbr").toggle(1000);
			$("#KBcardNumber").toggle(1000);
			$("#KBcheck").toggle(1000);
		});

		//카카오카드 버튼 클릭시 카드번호 입력창 보이기
		$("#Kakaocard").click(function() {
			$("#KaKaoCardNumberInput").toggle(1000);
			$("#Kakobr").toggle(1000);
			$("#KaKaoCardNumber").toggle(1000);
			$("#Kakaocheck").toggle(1000);
		});

		//KEB하나카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KEBHanacard").click(function() {
			$("#KEBHanaNumberInput").toggle(1000);
			$("#KEBHanabr").toggle(1000);
			$("#KEBHanaNumber").toggle(1000);
			$("#KEBHanacheck").toggle(1000);
		});

		//신한카드 버튼 클릭시 카드번호 입력창 보이기
		$("#ShinhanCard").click(function() {
			$("#ShinhanNumberInput").toggle(1000);
			$("#Shinhanbr").toggle(1000);
			$("#ShinhanNumber").toggle(1000);
			$("#Shinhancheck").toggle(1000);
		});

		//농협카드 버튼 클릭시 카드번호 입력창 보이기
		$("#nonghyupCard").click(function() {
			$("#nonghyupNumberInput").toggle(1000);
			$("#nonghyupbr").toggle(1000);
			$("#nonghyupNumber").toggle(1000);
			$("#nonghyupcheck").toggle(1000);
		});

		//케이뱅크카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KbankCard").click(function() {
			$("#KbankNumberInput").toggle(1000);
			$("#Kbankbr").toggle(1000);
			$("#KbankNumber").toggle(1000);
			$("#Kbankcheck").toggle(1000);
		});


	//(계좌)확인 버튼시 pay.jsp에 전달
	//국민은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KBbankCheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("KBbank").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//국민은행 버튼 클릭시 카드번호 입력창 보이기
		$("#KBbank").click(function() {
			$("#KBbankNumberInput").toggle(1000);
			$("#KBbankbr").toggle(1000);
			$("#KBbankNumber").toggle(1000);
			$("#KBbankCheck").toggle(1000);
		});

		//카카오뱅크 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KakaobankCheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("Kakaobank").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//카카오뱅크 버튼 클릭시 카드번호 입력창 보이기
		$("#Kakaobank").click(function() {
			$("#KakaobankNumberInput").toggle(1000);
			$("#Kakaobankbr").toggle(1000);
			$("#KakaobankNumber").toggle(1000);
			$("#KakaobankCheck").toggle(1000);
		});

		//KEB하나은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KEBHanabankCheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("KEBHanabank").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//KEB하나은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#KEBHanabank").click(function() {
			$("#KEBHanabankNumberInput").toggle(1000);
			$("#KEBHanabankbr").toggle(1000);
			$("#KEBHanabankNumber").toggle(1000);
			$("#KEBHanabankCheck").toggle(1000);
		});

		//신한은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#ShinhanbankCheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("Shinhanbank").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//신한은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#Shinhanbank").click(function() {
			$("#ShinhanbankNumberInput").toggle(1000);
			$("#Shinhanbankbr").toggle(1000);
			$("#ShinhanbankNumber").toggle(1000);
			$("#ShinhanbankCheck").toggle(1000);
		});

		//농협은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#nonghyupbankCheck").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("nonghyupbank").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//농협은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#nonghyupbank").click(function() {
			$("#nonghyupbankNumberInput").toggle(1000);
			$("#nonghyupbankbr").toggle(1000);
			$("#nonghyupbankNumber").toggle(1000);
			$("#nonghyupbankCheck").toggle(1000);
		});

		//K뱅크 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#Kbank2Check").click(
				function() {
					opener.document.getElementById("pay_way").value = document
							.getElementById("Kbank2").value
					window.close(); //닫기 동시에 전달하기!!!
				});

		//K뱅크 버튼 클릭시 계좌번호 입력창 보이기
		$("#Kbank2").click(function() {
			$("#Kbank2NumberInput").toggle(1000);
			$("#Kbank2br").toggle(1000);
			$("#Kbank2Number").toggle(1000);
			$("#Kbank2Check").toggle(1000);
		});
		
		
		
		
	});
</script>
</head>
<body>
	<label>카드</label>
	<br>
	<input type="button" id="KBcard" value="국민카드">
	<input type="button" id="Kakaocard" value="카카오카드">
	<input type="button" id="KEBHanacard" value="KEB하나카드">
	<br>
	<!--국민카드-->
	<label id="KBcardNumberInput" style="display: none;">KB 카드번호 입력</label>
	<br id="KBbr" style="display: none;">
	<input type="text" id="KBcardNumber" placeholder="하이픈 사용하여 카드번호 입력" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="KBcheck" value="확인" style="display: none;">

	<!--카카오카드-->
	<label id="KaKaoCardNumberInput" style="display: none;">카카오 카드번호 입력</label>
	<br id="Kakobr" style="display: none;">
	<input type="text" id="KaKaoCardNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="Kakaocheck" value="확인" style="display: none;">

	<!--하나카드-->
	<label id="KEBHanaNumberInput" style="display: none;">KEB하나 카드번호 입력</label>
	<br id="KEBHanabr" style="display: none;">
	<input type="text" id="KEBHanaNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="KEBHanacheck" value="확인" style="display: none;">
	<br>

	<input type="button" id="ShinhanCard" value="신한카드">
	<input type="button" id="nonghyupCard" value="농협카드">
	<input type="button" id="KbankCard" value="케이뱅크카드">
	<br>
	
	<!--신한카드-->
	<label id="ShinhanNumberInput" style="display: none;">신한 카드번호 입력</label>
	<br id="Shinhanbr" style="display: none;">
	<input type="text" id="ShinhanNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="Shinhancheck" value="확인" style="display: none;">

	<!--농협카드-->
	<label id="nonghyupNumberInput" style="display: none;">농협 카드번호 입력</label>
	<br id="nonghyupbr" style="display: none;">
	<input type="text" id="nonghyupNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="nonghyupcheck" value="확인" style="display: none;">

	<!--Kbank카드-->
	<label id="KbankNumberInput" style="display: none;">케이뱅크 카드번호 입력</label>
	<br id="Kbankbr" style="display: none;">
	<input type="text" id="KbankNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="Kbankcheck" value="확인" style="display: none;">
	<br>





	<label>계좌</label>
	<br>	
	<input type="button" id="KBbank" value="국민은행">
	<input type="button" id="Kakaobank" value="카카오뱅크">
	<input type="button" id="KEBHanabank" value="KEB하나은행">
	<br>
	<!--국민은행-->
	<label id="KBbankNumberInput" style="display: none;">국민은행 계좌번호 입력</label>
	<br id="KBbankbr" style="display: none;">
	<input type="text" id="KBbankNumber"      size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="KBbankCheck" value="확인" style="display: none;">	

	<!--카카오뱅크-->
	<label id="KakaobankNumberInput" style="display: none;">카카오뱅크 계좌번호 입력</label>
	<br id="Kakaobankbr" style="display: none;">
	<input type="text" id="KakaobankNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="KakaobankCheck" value="확인" style="display: none;">

	<!--하나은행-->
	<label id="KEBHanabankNumberInput" style="display: none;">KEB하나은행 계좌번호 입력</label>
	<br id="KEBHanabankbr" style="display: none;">
	<input type="text" id="KEBHanabankNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="KEBHanabankCheck" value="확인" style="display: none;">
	<br>

	<input type="button" id="Shinhanbank" value="신한은행">
	<input type="button" id="nonghyupbank" value="농협은행">
	<input type="button" id="Kbank2" value="케이뱅크">	
	<br>
	<!--신한은행-->
	<label id="ShinhanbankNumberInput" style="display: none;">신한은행 계좌번호 입력</label>
	<br id="Shinhanbankbr" style="display: none;">
	<input type="text" id="ShinhanbankNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="ShinhanbankCheck" value="확인" style="display: none;">

	<!--농협은행-->
	<label id="nonghyupbankNumberInput" style="display: none;">농협은행 계좌번호 입력</label>
	<br id="nonghyupbankbr" style="display: none;">
	<input type="text" id="nonghyupbankNumber" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="nonghyupbankCheck" value="확인" style="display: none;">

	<!--Kbank-->
	<label id="Kbank2NumberInput" style="display: none;">케이뱅크 카드번호 입력</label>
	<br id="Kbank2br" style="display: none;">
	<input type="text" id="Kbank2Number" size="50" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="Kbank2Check" value="확인" style="display: none;">
</body>
</html>