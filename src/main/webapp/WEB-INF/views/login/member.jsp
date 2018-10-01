<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel= "stylesheet" type="text/css" href="/resources/login/index.css">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>회원가입</title>
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<style type="text/css">
	input[type="text"], input[type="password"],select{
		display: inline-block;
		/* border: 1px solid #ccc; */
		border-left: thin;
		border-right: thin;
		border-top: thin;
		border-radius: 4px;
		box-sizing: border-box;
    	-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
    	resize: vertical;
    	size: 50px;
		height: 37px;
		width: 400px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('#site').change(function(){ //이메일 입력
		var site = $('#site').val();
		console.log(site);
		if(site!='직접입력'){
			$("input[name=email2]").val(site);
			$("input[name=email2]").attr('readonly', true); //readonly로 직접입력 막기.
		}else{
			$("input[name=email2]").val('');
			$("input[name=email2]").attr('readonly', false);
		}
	});
	
	$('#insert').click(function(){ //회원가입 폼 유효성 검사
		$('#frm').submit(); //for test
		//var nameExp = /^[가-힣a-zA-Z]{2,15}$/; //이름 유효성 검사식
		var emailExp = /^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$/;
		var phoneExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(!emailExp.test($('#eamil1').val()+'@'+$('#email2').val())){
			alert('알맞지 않은 이메일형식입니다.');
			$('#email1').val('');
			$('#email2').val('');
			$('#email1').focus();
		}else if($('#id').val()==''){
			alert('중복확인을 통해 id를 입력해주세요.');
			$('#id').focus();
		}else if($('#pw').val().trim()==''){
			alert('비밀번호를 입력해주세요.');
			$('#pw').focus();
		}else if($('#pw2').val().trim()==''){
			alert('비밀번호를 입력해주세요.');
			$('#pw2').focus();
		}else if($('#pw').val() != $('#pw2').val()){
			alert('비밀번호가 일치하지 않습니다');
			$('#pw2').val('');
			$('#pw2').focus();
		}else if($('#name').val().trim()==''){ //(!nameExp.test($('#name').val())){
			alert('이름을 정확히 입력해주세요.');
			//alert('이름에는 숫자가 들어갈 수 없습니다.');
			$('#name').focus();
		}else if(!phoneExp.test($('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val())){
			alert('알맞지 않은 핸드폰 번호입니다.');
		}else if($('#addr').val().trim()==''){
			alert('주소를 입력해주세요.');
			$('addr').focus();
		}else{
			//올바른 데이터 입력시
			$('#frm').submit();
		}
	}); //등록 버튼 클릭
	
	$('#phone1').keyup(function(){ //핸드폰 입력 focus 자동 넘기기
		var limit = $(this).attr('maxlength');
		if(this.value.length >= limit){
			$('#phone2').focus();
			return false;
		}
	});
	
	$('#phone2').keyup(function(){
		var limit = $(this).attr('maxlength');
		if(this.value.length >= limit){
			$('#phone3').focus();
			return false;
		}
	});
	
	$("#addr").click(function() {
		sample6_execDaumPostcode();
	});
	
	$("#addr").keydown(function() {
		sample6_execDaumPostcode();
	});
});
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr').value = fullAddr;
            }
        }).open();
    }
</script>
<body class="container" style="text-align: center;">
	<br>
	<h3>회원가입</h3>
	<hr>
	<!-- <form name="frm" method="post" id="frm"> -->
	<form action="member_wait" name="frm" id="frm" method="post">
		<div class="container" id="cont">
			<table style="text-align: center;" class="container">
				<tr>
					<td>
						<input type="text" id="email1" name="email1" placeholder="아이디" style="width:120px">@
						<input type="text" id="email2" name="email2" placeholder="이메일 주소" style="width:125px">
						<select name="site" id="site" style="width: 130px;">
							<option value="직접입력">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="password" id="pw2" name="pw2" placeholder="한 번 더 입력해주세요"></td>
				</tr>
				<tr>
					<td><input type="text" id="name" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td>
						<input type="text" id="phone1" name="phone1" maxlength="3" placeholder="핸드폰"  style="width:125px">-
						<input type="text" id="phone2" name="phone2" maxlength="4"  style="width:125px">-
						<input type="text" id="phone3" name="phone3" maxlength="4"  style="width:125px">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="addr" id="addr" placeholder="주소">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="inputBox" placeholder="선호 지역">
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div class="container">
			<button id="insert" type="button" class="btn">계속</button>
		</div>
	</form>
	<script src="/resources/login/index.js"></script>
</body>
</html>