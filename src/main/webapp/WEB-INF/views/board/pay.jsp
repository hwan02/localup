<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>투어신청 결제</title>
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
	<!--DB에서 가져오기-->
	<input type="text" value="2000" readonly="readonly">
	<br>
	<!--DB입력 v-->
	<!--pay_num-->
	<input type="text" name="pay_num" placeholder="투어 인원">
	<br>
	<!--DB : 결제 수단으로 입력 v-->
	<!--pay_pay-->
	<!--pay_way-->
	<input type="button" value="결제 하기">
	<br>
	<input type="text" name="pay_pay" placeholder="결제금액">
	<br>
	<input type="text" name="pay_way" placeholder="결제수단">
	<br>
	<!--pay_state 결제 상태 TEST 후 hiden 처리 v-->
	<input type="hidden" name="pay_state" value="완료">
	<br>
	<!--게시글 번호 TEST후 hiden 처리(DB에서 가져오기)-->
	<!--board_no-->
	<input type="text" name="board_no" placeholder="게시글번호">
	<br>
	<input type="submit" value="확인">
	</form>
</body>
</html>