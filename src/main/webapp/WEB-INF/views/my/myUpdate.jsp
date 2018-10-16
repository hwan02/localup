<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경 TEST</title>
<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

	$(function() { 
		$('#updateBT').click(function() { //수정 버튼 클릭시
			alert("수정 완료");
		});
		
	    $("input").keydown(function() { //수정 할시 버튼 생김
	        $("#updateDIV").show(1000);
	    });

	    $("textarea").keydown(function() {//수정 할시 버튼 생김
	        $("#updateDIV").show(1000);
	    });
	});
	
	$(function() {
		$("#deleteBT").click(function() {
			$('form').attr('action','/member/delete');
			$('form').submit();
		});
	});
	
	<!--메뉴 클릭시 사이드바 생성-->
	function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft = "0";
		document.body.style.backgroundColor = "white";
	}
</script>

<style>
<!--메뉴 클릭시 사이드바 생성-->
body {
	font-family: "Lato", sans-serif;
	transition: background-color .5s;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

#main {
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
</style>
</head>
<body class="container">
	<h1><a href="/index">회원정보 변경 </a></h1>
	<hr>
	<form action="/member/myUpdate" method="post">
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	
<%-- 	<c:forEach items="${memberVO}" var="memberVO2"> --%>
	<!--메뉴 클릭시 사이드바 생성 그리고 사이드바 메뉴 클릭시 이동-->
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/member/myUpdate?member_email=${memberVO.member_email}">회원정보 변경</a> 
		<a href="/board/myWrite?member_email=${memberVO.member_email}">전체 게시글 보기</a> 
		<a href="/guide/myApplySchedule?member_email=${memberVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${memberVO.member_email}">투어 신청현황</a>  
		<a href="/guide/myApplyPast?member_email=${memberVO.member_email}">완료 투어</a> 
	</div>
<%-- 	</c:forEach> --%>
	
<%-- 	<c:forEach items="${memberVO}" var="memberVO"> --%>
		이메일
		<div><input type="text" disabled="disabled" name="member_email" value="${memberVO.member_email}"></div>
		<input type="hidden"  name="member_email" value="${memberVO.member_email}">
		<br>
		비밀번호
		<div><input type="password" name="member_pw" value="${memberVO.member_pw}"></div>
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
		<div style="display: none;" id="updateDIV"><button id="updateBT">수정</button></div>
		<div><button type="reset">취소</button></div>
		<div><button type="button" id="deleteBT">탈퇴</button></div>
	</form>
</body>
</html>