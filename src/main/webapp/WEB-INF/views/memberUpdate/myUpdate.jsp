<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경 TEST</title>
<!--<div id="checkPwd">동일한 비밀번호 입력하세요.</div> : 스타일-->
<style type="text/css">
/*(굳이 필요 없을듯)*/
/* span{ */
/*   font-size: 15px; */
/* } */
/* #checkMsg{ */
/*   font-size: 12px; */
/* } */
/* #checkPwd{ */
/*   color : red; */
/*   font-size: 12px; */
/* } */
</style>

<!--구글 스트립트-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	//비밀번호 일치 하는 작업 : 보류!(굳이 필요 없을듯)
// 	var checkFirst = false;
// 	var lastKeyword = '';
// 	var loopSendKeyword = false;

// 	function checkPwd() {
// 		var f1 = document.forms[0];
// 		var pw1 = f1.member_pw.value;
// 		var pw2 = f1.member_pwCheck.value;
// 		if (pw1 != pw2) {
// 			document.getElementById('checkPwd').style.color = "red";
// 			document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
// 		} else {
// 			document.getElementById('checkPwd').style.color = "black";
// 			document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";

// 		}

// 	}
</script>
</head>
<body>
	<h1>회원정보 변경 TEST</h1>
	<hr>
	<form action="memberUpdate" method="post">
<%-- 		<c:forEach items="${memberVO}" var="memberVO"> --%>
		이메일
		<div><input type="text" disabled="disabled" name="member_email" value="${memberVO.member_email}"></div>
		<input type="hidden"  name="member_email" value="${memberVO.member_email}">
		<br>
		비밀번호
		<div><input type="password" name="member_pw" value="${memberVO.member_pw}"></div>
<!-- 		<div><input type="password" name="member_pwCheck" onkeyup="checkPwd()" placeholder="비밀번호 입력"></div> -->
<!-- 		<div id="checkPwd">동일한 비밀번호 입력하세요.</div> -->
		<br>
		이름
		<div><input type="text" disabled="disabled" name="member_name" value="${memberVO.member_name}"></div>
		<div><input type="hidden"  name="member_name" value="${memberVO.member_name}"></div>
		<br>
		주소
<%-- 		<div><input type="text" name="member_addr" value="${mUpdateVO.member_addr}"> <button type="button">주소검색</button> </div> --%>
		<br>
<%-- 			<input type="text" name="member_zipcode"  value="${memberVO.member_zipcode}" id="sample6_postcode" placeholder="우편번호"> --%>
			<input type="text"  name="member_addr"  value="${memberVO.member_addr}" id="sample6_address" size="30" placeholder="주소">
			<input type="button"  onclick="sample6_execDaumPostcode()" value="주소 찾기">
<%-- 			<input type="text"  name="member_detailedaddress" value="${memberVO.member_detailedaddress}" id="sample6_address2" placeholder="상세주소"> --%>
			
			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				function sample6_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
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
									if (data.userSelectedType === 'R') {
										//법정동명이 있을 경우 추가한다.
										if (data.bname !== '') {
											extraAddr += data.bname;
										}
										// 건물명이 있을 경우 추가한다.
										if (data.buildingName !== '') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
										fullAddr += (extraAddr !== '' ? ' ('
												+ extraAddr + ')' : '');
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
 									//document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
									document.getElementById('sample6_address').value = fullAddr;

									// 커서를 상세주소 필드로 이동한다.
 									//document.getElementById('sample6_address2')
											// .focus();
								}
							}).open();
				}
			</script>
			<br>
		연락처
		<div><input type="tel" name="member_tel" value="${memberVO.member_tel}"></div>
		<br>
		선호지역
		<div><input type="text" name="member_pref" value="${memberVO.member_pref}"></div>
		<br>
		소개
<%-- 		<div><input type="text" name="member_intro" value="${mUpdateVO.member_intro}"></div> --%>
		<div><textarea rows="10" cols="30" name="member_intro">${memberVO.member_intro}</textarea> </div>
<%-- 		</c:forEach> --%>
		<br>
		<button>수정</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>