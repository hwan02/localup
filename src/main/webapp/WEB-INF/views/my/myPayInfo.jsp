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
	    $("#payCancel").click(function() { //결제취소 버튼 할시
	        alert("취소가 되었습니다.");
	    	$("#canCenl").fadeToggle("slow");
	    	$("#complete").fadeToggle("slow");
	    	//$("#pay_pdate").fadeToggle("slow");
	    	
	    	$("#pay_cdate").fadeToggle("slow");
	    	
	    	$('form').attr('action','/pay/myPayInfo');
 			$('form').submit();
	    });

// 	    $("#payCancelView").click(function() { //결제취소 버튼 할시
// 	    	$("#pay_cdate").fadeToggle("slow");

// 	    });

	});

</script>
</head>
<body>
	<h1>결제내역 조회</h1>
	<hr>

	<c:forEach items="${GuideVO}" var="GuideVO">
		<!--가이드 번호-->
		<input type="text" value="가이드번호 : ${GuideVO.tour_no}">
		<br>
		<table border="1" cellpadding="5">
			<tr>
				<th>투어명</th>
				<th>투어 시작 날짜</th>
				<th>투어 종료 날짜</th>
			</tr>
			<tr>
				<!--투어명-->
				<td><input type="text" value="${GuideVO.tour_title}" readonly></td>
				
				<!--시작날짜-->
				<td><input type="text" value="${GuideVO.tour_sdate}" readonly></td>
				<!--종료날짜-->
				<td><input type="text" value="${GuideVO.tour_edate}" readonly></td>
			</tr>
		</table>
	</c:forEach>
	
	<form action="" method="post">
	<c:forEach items="${PayInfoVO}" var="PayInfoVO">
		<!--투어번호-->
		투어번호
		<input type="text" name="pay_no" value="${PayInfoVO.pay_no}">
		<table border="1" cellpadding="5">
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
		<table border="1" cellpadding="5">
			<tr>
				<th>투어 결제상태</th>
				<th>투어 결제 승인</th>
				<th>투어 결제 취소</th>
			</tr>
			<tr>
				<!--투어 결제상태-->
				<td>
					<input type="text" value="${PayInfoVO.pay_state}" id="complete" readonly>
					<input type="text" value="결제취소" name="pay_state" id="canCenl" style="display: none;" readonly>
				</td>

				<!--투어 결제 승인-->
				<td id="pay_pdate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${PayInfoVO.pay_pdate}"/> </td>

				<!--투어 결제 취소-->
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${PayInfoVO.pay_cdate}"/></td>
			</tr>
		</table>
	</c:forEach>
	
	<br><br>
	<input type="button" id="payCancel" value="결제취소">
<!-- 	<input type="button" id="payCancelView" value="결제취소 날짜보기"> -->
	</form>
		
		

</body>
</html>