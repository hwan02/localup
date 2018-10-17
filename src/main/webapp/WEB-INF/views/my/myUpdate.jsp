<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경</title>
<!--더보기-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="/resources/my_css/myUpdate.css">

<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="/resources/my_js/myUpdate.js"></script>


</head>
<body class="container">
	<form action="/member/myUpdate" method="post">
	<!--메뉴 클릭시 사이드바 생성-->
	<div id="main">
		<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; 메뉴</span>
	</div>
	
	<div class="container" >
		<h1><a href="/index">회원정보 변경 </a></h1>
	</div>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="/member/myUpdate?member_email=${memberVO.member_email}">회원정보 변경</a> 
		<a href="/board/myWrite?member_email=${memberVO.member_email}">전체 게시글 보기</a> 
		<a href="/guide/myApplySchedule?member_email=${memberVO.member_email}">투어예정</a>
		<a href="/guide/myApply?member_email=${memberVO.member_email}">투어 신청현황</a>  
		<a href="/guide/myApplyPast?member_email=${memberVO.member_email}">완료 투어</a> 
	</div>
	<br>
	<div class="container">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
        		<span class="input-group-text">이메일&nbsp;&nbsp;&nbsp;</span>
      		</div>
			<input type="text" class="form-control" readonly="readonly" name="member_email" value="${memberVO.member_email}">
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
        		<span class="input-group-text">비밀번호</span>
      		</div>
			<input type="password" class="form-control" name="member_pw" value="${memberVO.member_pw}">
		</div>
		
		<div class="input-group mb-3">
			<div class="input-group-prepend">
        		<span class="input-group-text">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      		</div>
			<input type="text" class="form-control" readonly="readonly" name="member_name" value="${memberVO.member_name}">
		</div>
  
			<div class="input-group mb-3">
				<div class="input-group-prepend">
        			<span class="input-group-text" onclick="sample6_execDaumPostcode()" >주소찾기</span> 
      			</div>
				<input type="text" class="form-control" name="member_addr"  value="${memberVO.member_addr}" id="sample6_address" size="30" placeholder="주소">
      		</div>
			
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
			
		<div class="input-group mb-3">
			<div class="input-group-prepend">
        		<span class="input-group-text">연락처&nbsp;&nbsp;&nbsp;</span>
      		</div>
		<input type="tel" class="form-control" name="member_tel" value="${memberVO.member_tel}">
		</div>
		
		<div class="input-group mb-3">
		<div class="input-group-prepend">
        		<span class="input-group-text">선호지역</span>
      		</div>
		<input type="text" class="form-control" name="member_pref" value="${memberVO.member_pref}">
		</div>
		
		<div class="form-group">
		<label for="comment">소개</label>
      	<textarea class="form-control" name="member_intro" rows="5" id="comment" name="text">${memberVO.member_intro}</textarea>
		
    	</div>
			
		
		<div class="btn-group">
  			<label style="display: none;" id="updateDIV"><button id="updateBT" class="btn btn-primary">수정</button></label> 
  			<label><button type="reset" class="btn btn-primary">취소</button></label> 
  			<label><button type="button" id="deleteBT" class="btn btn-primary">탈퇴</button></label> 
		</div>
		
	</div>
	</form>
</body>
</html>