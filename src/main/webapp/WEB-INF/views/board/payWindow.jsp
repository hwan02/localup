<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어 결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		//확인 버튼시 pay.jsp에 전달
// 		$("#payCheck").click(function(){
// 			if(KBcard==true){
// 				opener.document.getElementById("pay_way").value = 
// 					document.getElementById("KBcard").value				
// 			}
// 			window.close(); //닫기 동시에 전달하기!!!
// 		});
		$("#KBcheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("KBcard").value				

			window.close(); //닫기 동시에 전달하기!!!
		});
	});

	$(function() {
		$("#Kakocheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("Kakocard").value				

			window.close(); //닫기 동시에 전달하기!!!
		});
	});
		$("#KEBHanacheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("KEBHanacard").value				

			window.close(); //닫기 동시에 전달하기!!!
		});
	
		$("#Shinhancheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("Shinhancard").value				

			window.close(); //닫기 동시에 전달하기!!!
		});

		$("#nonghyupcheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("nonghyupcard").value				

			window.close(); //닫기 동시에 전달하기!!!
		});

		$("#Kbankcheck").click(function(){
			
				opener.document.getElementById("pay_way").value = 
					document.getElementById("Kbankcard").value				

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
		$("#KaKaoCard").click(function() {
			$("#KaKaoCardNumberInput").toggle(1000);
			$("#Kakobr").toggle(1000);
			$("#KaKaoCardNumber").toggle(1000);
			$("#Kakaocheck").toggle(1000);
		});

		//KEB하나카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KEBHanaCard").click(function() {
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
</script>
</head>
<body>
<label>카드</label>
<br>
<input type="button" id="KBcard" value="국민카드">
<input type="button" id="KaKaoCard" value="카카오카드">
<input type="button" id="KEBHanaCard" value="KEB하나카드">
<br>
<!--국민카드-->
<label id="KBcardNumberInput" style="display: none;">KB 카드번호 입력</label>
<br id="KBbr" style="display: none;">
<input type="text" id="KBcardNumber" size="50" style="display: none;">
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
</body>
</html>