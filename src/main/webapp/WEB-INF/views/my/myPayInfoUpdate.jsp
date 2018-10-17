<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역</title>
<!--구글 제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { 	
		$(".payCancel").click(function() { //결제취소 버튼 할시       
			var formObj = $("form[role='form']");
			alert("취소가 되었습니다.");
		var str = "결제완료";
		
		$(".pay_state").fadeToggle("slow");;
		$(".complete").fadeToggle("slow");;
		$(".pay_cdate").fadeToggle("slow");;

 		$('form').attr('action', '/pay/myPayInfoUpdate');
 		$('form').submit();
		});	
	});	
</script>
</head>
<body>
	<h1>결제내역 조회 수정</h1>
	<hr>
	<form action=""   method="post">	
<%-- 	<c:forEach items="${PayInfoVO}" var="PayInfoVO"> --%>
		<!--투어번호-->
		신청 이메일
		<input type="text" name="member_email" value="${PayInfoVO.member_email}">
		결제번호
		<input type="text" name="pay_no" value="${PayInfoVO.pay_no}">
		<table border="1" cellpadding="5" class="paypaypay">
			<tr>
				<th>투어 인원</th>
				<th>투어 금액</th>
				<th>투어 결제수단</th>
			</tr>
			<tr>
				<!--투어인원-->
				<td><input type="text" value="${PayInfoVO.pay_num}" readonly></td>

				<!--투어금액-->
				<td><input type="text" value="${PayInfoVO.pay_pay}" readonly></td>

				<!--투어 결제수단-->
				<td><input type="text" value="${PayInfoVO.pay_way}" readonly></td>
			</tr>
		</table>
		<table border="1" cellpadding="5" id="tourPay">
			<tr>
				<th>투어 결제상태</th>
				<th>투어 결제 승인</th>
				<th>투어 결제 취소</th>
				<th>투어 결제 취소 하기</th>
			</tr>
			<tr >
				<!--투어 결제상태-->
				<td>
					<input type="text" value="${PayInfoVO.pay_state}" class="complete" readonly>
					<input type="text" value="결제취소" class="pay_state" name="pay_state" style="display: none;" readonly>
				</td>

				<!--투어 결제 승인-->
				<td class="pay_pdate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${PayInfoVO.pay_pdate}"/></td>

				<!--투어 결제 취소-->
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${PayInfoVO.pay_cdate}"/></td>
				<td></td>
			</tr>
		</table>
<%-- 	</c:forEach> --%>
<%-- 	<a href="/pay/myPayInfo?tour_no=${GuideVO.tour_no}"><input type="button" class="payCancel" value="결제취소"></a>  --%>
	<input type="button" class="payCancel" value="결제취소">
	<div id="result" style="text-align: center;"></div>
	</form>
		
		

</body>
</html>