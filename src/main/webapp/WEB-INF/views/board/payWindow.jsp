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

	//카드 유효성 검사
	var cardNumExp = /^\d{4}-\d{4}-\d{4}-\d{4}$/; 	//숫자 16자리(하이픈 포함)
	var cardMonthYear = /^\d{2}-\d{2}$/; 			//숫자 4자리(하이픈 포함)

	//카드 : 확인 버튼시 pay.jsp에 전달
	//국민카드
	$("#KBcard_Check").click(
		function() {
			if(!cardNumExp.test($('#KBcard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#KBcard_Number').val("");
				$('#KBcard_Number').focus();   
			}else if(!cardMonthYear.test($('#KBcard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#KBcard_MonthYear').val("");
				$('#KBcard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("KBcard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//국민카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KBcard").click(function() {
			$("#KBcard_NumberInput").fadeToggle("slow");
			$("#KBcard_Number").fadeToggle("slow");
			$("#KBcard_MonthYear").fadeToggle("slow");
			$("#KBcard_Check").fadeToggle("slow");
		});

	//카카오 카드
	$("#Kakaocard_Check").click(
		function() {
			if(!cardNumExp.test($('#Kakaocard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#Kakaocard_Number').val("");
				$('#Kakaocard_Number').focus();   
			}else if(!cardMonthYear.test($('#Kakaocard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#Kakaocard_MonthYear').val("");
				$('#Kakaocard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("Kakaocard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//카카오 카드 버튼 클릭시 카드번호 입력창 보이기
		$("#Kakaocard").click(function() {
			$("#Kakaocard_NumberInput").fadeToggle("slow");
			$("#Kakaocard_Number").fadeToggle("slow");
			$("#Kakaocard_MonthYear").fadeToggle("slow");
			$("#Kakaocard_Check").fadeToggle("slow");
		});
	
	//KEB하나카드
	$("#KEBHanacard_Check").click(
		function() {
			if(!cardNumExp.test($('#KEBHanacard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#KEBHanacard_Number').val("");
				$('#KEBHanacard_Number').focus();   
			}else if(!cardMonthYear.test($('#KEBHanacard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#KEBHanacard_MonthYear').val("");
				$('#KEBHanacard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("KEBHanacard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//KEB하나카드 버튼 클릭시 카드번호 입력창 보이기
		$("#KEBHanacard").click(function() {
			$("#KEBHanacard_NumberInput").fadeToggle("slow");
			$("#KEBHanacard_Number").fadeToggle("slow");
			$("#KEBHanacard_MonthYear").fadeToggle("slow");
			$("#KEBHanacard_Check").fadeToggle("slow");
		});

	//신한카드
	$("#Shinhancard_Check").click(
		function() {
			if(!cardNumExp.test($('#Shinhancard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#Shinhancard_Number').val("");
				$('#Shinhancard_Number').focus();   
			}else if(!cardMonthYear.test($('#Shinhancard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#Shinhancard_MonthYear').val("");
				$('#Shinhancard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("Shinhancard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//신한카드 버튼 클릭시 카드번호 입력창 보이기
		$("#Shinhancard").click(function() {
			$("#Shinhancard_NumberInput").fadeToggle("slow");
			$("#Shinhancard_Number").fadeToggle("slow");
			$("#Shinhancard_MonthYear").fadeToggle("slow");
			$("#Shinhancard_Check").fadeToggle("slow");
		});	

	//농협카드
	$("#nonghyupcard_Check").click(
		function() {
			if(!cardNumExp.test($('#nonghyupcard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#nonghyupcard_Number').val("");
				$('#nonghyupcard_Number').focus();   
			}else if(!cardMonthYear.test($('#nonghyupcard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#nonghyupcard_MonthYear').val("");
				$('#nonghyupcard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("nonghyupcard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//농협카드 버튼 클릭시 카드번호 입력창 보이기
		$("#nonghyupcard").click(function() {
			$("#nonghyupcard_NumberInput").fadeToggle("slow");
			$("#nonghyupcard_Number").fadeToggle("slow");
			$("#nonghyupcard_MonthYear").fadeToggle("slow");
			$("#nonghyupcard_Check").fadeToggle("slow");
		});	


	//케이뱅크 카드
	$("#nonghyupcard_Check").click(
		function() {
			if(!cardNumExp.test($('#Kbankcard_Number').val() )){ //카드번호 유효성 검사
				alert("카드번호 다시입력 하세요 ;)" );
				$('#Kbankcard_Number').val("");
				$('#Kbankcard_Number').focus();   
			}else if(!cardMonthYear.test($('#Kbankcard_MonthYear').val() )){
				alert("만료일 다시입력 하세요 ;)" );
				$('#Kbankcard_MonthYear').val("");
				$('#Kbankcard_MonthYear').focus();
			}else{
				opener.document.getElementById("pay_way").value = 
				document.getElementById("Kbankcard").value
				window.close(); //닫기 동시에 전달하기!!!
			}
				
		});

		//케이뱅크 카드 버튼 클릭시 카드번호 입력창 보이기
		$("#Kbankcard").click(function() {
			$("#Kbankcard_NumberInput").fadeToggle("slow");
			$("#Kbankcard_Number").fadeToggle("slow");
			$("#Kbankcard_MonthYear").fadeToggle("slow");
			$("#Kbankcard_Check").fadeToggle("slow");
		});	



	//계좌번호 유효성 검사(자릿수가 은행 마다 달라서 숫자만 입력하게 함)
	var bankNumExp = /^[0-9]$/;
	
	//(계좌)확인 버튼시 pay.jsp에 전달
	//국민은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KBbankCheck").click(
			function() {
				if(!bankNumExp.test($('#KBbankNumber').val() )){ //카드번호 유효성 검사
					alert("계좌번호 다시입력 하세요 ;)" );
					$('#KBbankNumber').val("");
					$('#KBbankNumber').focus();   
				}else{
					opener.document.getElementById("pay_way").value = document
					.getElementById("KBbank").value
					window.close(); //닫기 동시에 전달하기!!!
				}

			});

		//국민은행 버튼 클릭시 카드번호 입력창 보이기
		$("#KBbank").click(function() {
			$("#KBbankNumberInput").fadeToggle("slow");
			$("#KBbankbr").fadeToggle("slow");
			$("#KBbankNumber").fadeToggle("slow");
			$("#KBbankCheck").fadeToggle("slow");
		});

		//카카오뱅크 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KakaobankCheck").click(
				function() {
					if(!bankNumExp.test($('#KakaobankNumber').val() )){ //카드번호 유효성 검사
						alert("계좌번호 다시입력 하세요 ;)" );
						$('#KakaobankNumber').val("");
						$('#KakaobankNumber').focus();   
					}else{
						opener.document.getElementById("pay_way").value = document
						.getElementById("Kakaobank").value
						window.close(); //닫기 동시에 전달하기!!!
					}

				});

		//카카오뱅크 버튼 클릭시 카드번호 입력창 보이기
		$("#Kakaobank").click(function() {
			$("#KakaobankNumberInput").fadeToggle("slow");
			$("#Kakaobankbr").fadeToggle("slow");
			$("#KakaobankNumber").fadeToggle("slow");
			$("#KakaobankCheck").fadeToggle("slow");
		});

		//KEB하나은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#KEBHanabankCheck").click(
				function() {
					if(!bankNumExp.test($('#KEBHanabankNumber').val() )){ //카드번호 유효성 검사
						alert("계좌번호 다시입력 하세요 ;)" );
						$('#KEBHanabankNumber').val("");
						$('#KEBHanabankNumber').focus();   
					}else{
						opener.document.getElementById("pay_way").value = document
						.getElementById("KEBHanabank").value
						window.close(); //닫기 동시에 전달하기!!!
					}				


				});

		//KEB하나은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#KEBHanabank").click(function() {
			$("#KEBHanabankNumberInput").fadeToggle("slow");
			$("#KEBHanabankbr").fadeToggle("slow");
			$("#KEBHanabankNumber").fadeToggle("slow");
			$("#KEBHanabankCheck").fadeToggle("slow");
		});

		//신한은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#ShinhanbankCheck").click(
				function() {
					if(!bankNumExp.test($('#ShinhanbankNumber').val() )){ //카드번호 유효성 검사
						alert("계좌번호 다시입력 하세요 ;)" );
						$('#ShinhanbankNumber').val("");
						$('#ShinhanbankNumber').focus();   
					}else{
						opener.document.getElementById("pay_way").value = document
						.getElementById("Shinhanbank").value
						window.close(); //닫기 동시에 전달하기!!!	
					}

				});

		//신한은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#Shinhanbank").click(function() {
			$("#ShinhanbankNumberInput").fadeToggle("slow");
			$("#Shinhanbankbr").fadeToggle("slow");
			$("#ShinhanbankNumber").fadeToggle("slow");
			$("#ShinhanbankCheck").fadeToggle("slow");
		});

		//농협은행 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#nonghyupbankCheck").click(
				function() {
					if(!bankNumExp.test($('#nonghyupbankNumber').val() )){ //카드번호 유효성 검사
						alert("계좌번호 다시입력 하세요 ;)" );
						$('#nonghyupbankNumber').val("");
						$('#nonghyupbankNumber').focus();   
					}else{
						opener.document.getElementById("pay_way").value = document
						.getElementById("nonghyupbank").value
						window.close(); //닫기 동시에 전달하기!!!
					}
		
				});

		//농협은행 버튼 클릭시 계좌번호 입력창 보이기
		$("#nonghyupbank").click(function() {
			$("#nonghyupbankNumberInput").fadeToggle("slow");
			$("#nonghyupbankbr").fadeToggle("slow");
			$("#nonghyupbankNumber").fadeToggle("slow");
			$("#nonghyupbankCheck").fadeToggle("slow");
		});

		//K뱅크 버튼 클릭시 확인 버튼 show 그리고 확인 버튼 클릭시 pay(부모창)으로 데이터 전달
		$("#Kbank2Check").click(
				function() {
					if(!bankNumExp.test($('#Kbank2Number').val() )){ //카드번호 유효성 검사
						alert("계좌번호 다시입력 하세요 ;)" );
						$('#Kbank2Number').val("");
						$('#Kbank2Number').focus();   
					}else{
						opener.document.getElementById("pay_way").value = document
						.getElementById("Kbank2").value
						window.close(); //닫기 동시에 전달하기!!!						
					}

				});

		//K뱅크 버튼 클릭시 계좌번호 입력창 보이기
		$("#Kbank2").click(function() {
			$("#Kbank2NumberInput").fadeToggle("slow");
			$("#Kbank2br").fadeToggle("slow");
			$("#Kbank2Number").fadeToggle("slow");
			$("#Kbank2Check").fadeToggle("slow");
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
	<table border="1" cellpadding="5"  id="KBcard_NumberInput" style="display: none;">
		<tr>
			<td>KB 카드번호</td>
			<td><input type="text" id="KBcard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="KBcard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="KBcard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>


	<!--카카오 카드-->
	<table border="1" cellpadding="5"  id="Kakaocard_NumberInput" style="display: none;">
		<tr>
			<td>카카오 카드번호</td>
			<td><input type="text" id="Kakaocard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="Kakaocard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="Kakaocard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>


	<!--KEB하나카드-->
	<table border="1" cellpadding="5"  id="KEBHanacard_NumberInput" style="display: none;">
		<tr>
			<td>KEB하나카드 번호</td>
			<td><input type="text" id="KEBHanacard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="KEBHanacard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="KEBHanacard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>
	<br>
	
	<input type="button" id="Shinhancard" value="신한카드">
	<input type="button" id="nonghyupcard" value="농협카드">
	<input type="button" id="Kbankcard" value="케이뱅크 카드">	
	<br>
	<!--신한카드-->
	<table border="1" cellpadding="5"  id="Shinhancard_NumberInput" style="display: none;">
		<tr>
			<td>신한카드 번호</td>
			<td><input type="text" id="Shinhancard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="Shinhancard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="Shinhancard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>


	<!--농협카드-->
	<table border="1" cellpadding="5"  id="nonghyupcard_NumberInput" style="display: none;">
		<tr>
			<td>농협카드 번호</td>
			<td><input type="text" id="nonghyupcard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="nonghyupcard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="nonghyupcard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>


	<!--케이뱅크 카드-->
		<table border="1" cellpadding="5"  id="Kbankcard_NumberInput" style="display: none;">
		<tr>
			<td>케이뱅크 카드 번호</td>
			<td><input type="text" id="Kbankcard_Number" autofocus="autofocus"  placeholder="'-' 하이픈 사용하여 카드번호 입력"  size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td>만료일</td>
			<td><input type="text" id="Kbankcard_MonthYear" required="required"  placeholder="MM-YY" size="25" style="display: none;"></td>
		</tr>
		<tr>
			<td colspan="2">
				<!--결제페이지 이동-->
				<input type="button" id="Kbankcard_Check" value="확인" style="display: none;">
			</td>
		</tr>
	</table>
	<br>












	<label>계좌</label>
	<br>	
	<input type="button" id="KBbank" value="국민은행">
	<input type="button" id="Kakaobank" value="카카오뱅크">
	<input type="button" id="KEBHanabank" value="KEB하나은행">
	<br>
	<!--국민은행-->
	<div>
		<label id="KBbankNumberInput" style="display: none;">국민은행 계좌번호 입력</label>
		<br id="KBbankbr" style="display: none;">
		<input type="text" id="KBbankNumber" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
		<!--결제페이지 이동-->
		<input type="button" id="KBbankCheck" value="확인" style="display: none;">	
	</div>

	<!--카카오뱅크-->
	<div>
		<label id="KakaobankNumberInput" style="display: none;">카카오뱅크 계좌번호 입력</label>
		<br id="Kakaobankbr" style="display: none;">
		<input type="text" id="KakaobankNumber" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
		<!--결제페이지 이동-->
		<input type="button" id="KakaobankCheck" value="확인" style="display: none;">
	</div>
	
	<!--하나은행-->
	<div>
		<label id="KEBHanabankNumberInput" style="display: none;">KEB하나은행 계좌번호 입력</label>
		<br id="KEBHanabankbr" style="display: none;">
		<input type="text" id="KEBHanabankNumber" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
		<!--결제페이지 이동-->
		<input type="button" id="KEBHanabankCheck" value="확인" style="display: none;">
		</div>
	<br>

	<input type="button" id="Shinhanbank" value="신한은행">
	<input type="button" id="nonghyupbank" value="농협은행">
	<input type="button" id="Kbank2" value="케이뱅크">	
	<br>
	<!--신한은행-->
	<div>
		<label id="ShinhanbankNumberInput" style="display: none;">신한은행 계좌번호 입력</label>
		<br id="Shinhanbankbr" style="display: none;">
		<input type="text" id="ShinhanbankNumber" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
		<!--결제페이지 이동-->
		<input type="button" id="ShinhanbankCheck" value="확인" style="display: none;">
	</div>
	
	<!--농협은행-->
	<div>
		<label id="nonghyupbankNumberInput" style="display: none;">농협은행 계좌번호 입력</label>
		<br id="nonghyupbankbr" style="display: none;">
		<input type="text" id="nonghyupbankNumber" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
		<!--결제페이지 이동-->
		<input type="button" id="nonghyupbankCheck" value="확인" style="display: none;">
	</div>

	<!--Kbank-->
	<div>
	<label id="Kbank2NumberInput" style="display: none;">케이뱅크 카드번호 입력</label>
	<br id="Kbank2br" style="display: none;">
	<input type="text" id="Kbank2Number" placeholder="'-' 하이픈 없이 입력하세요" autofocus="autofocus" size="25" style="display: none;">
	<!--결제페이지 이동-->
	<input type="button" id="Kbank2Check" value="확인" style="display: none;">
	</div>
</body>
</html>