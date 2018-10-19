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

<script type="text/javascript" src="/resources/my_js/myPayInfo.js"></script>

<!--메뉴 클릭시 사이드바 생성-->
<link rel="stylesheet" href="/resources/my_css/myPayInfo.css">

</head>
<body>
	<h1>결제내역 조회</h1>
	<hr>	
	<form action=""   method="post">	
	<c:forEach items="${PayInfoVO}" var="PayInfoVO">		
		게시글번호
		<input type="text" name="board_no" value="${PayInfoVO.board_no}">
		<br>
		신청 이메일
		<input type="text" name="member_email" value="${PayInfoVO.member_email}">
		결제번호 
		<input type="text" name="pay_no" class="pay_no" value="${PayInfoVO.pay_no}">
		<table border="1" cellpadding="5" class="paypaypay">		
			<tr>
				<th>투어 인원</th>
				<th>투어 금액</th>
				<th>투어 결제수단</th>
				<th>투어 결제상태</th>
			</tr>
			
			<tr>
				<!-- 투어인원 -->
				<td><input type="text" id="pay_num" value="${PayInfoVO.pay_num}" readonly></td>

				<!--투어금액 -->
				<td><input type="text" id="pay_pay" value="${PayInfoVO.pay_pay}" readonly></td>

				<!--투어 결제수단 -->
				<td><input type="text" value="${PayInfoVO.pay_way}" readonly></td>
				
				<!--투어 결제상태 -->
				<td>
					<input type="text" value="${PayInfoVO.pay_state}" class="complete" readonly>
					<input type="text" value="결제취소" class="pay_state" name="pay_state" style="display: none;" readonly>
				</td>
			</tr>
		</table>
		
		<table border="1" cellpadding="5" id="tourPay">
			<tr>			
				<th>투어 결제 승인</th>
				<th>투어 결제 취소</th>
				<th>투어 결제 취소 하기</th>
				<th>투어명 확인하기</th>
			</tr>
			
			<tr >
<!-- 				투어 결제 승인 -->
				<td class="pay_pdate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${PayInfoVO.pay_pdate}"/></td>

<!-- 				투어 결제 취소 -->
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"  value="${PayInfoVO.pay_cdate}"/></td>
				<td>	<a href='/pay/myPayInfoUpdate?pay_no=${PayInfoVO.pay_no}'>	<input type="button" class="payCancel" value="결제취소"></a></td>
				
				<!--가이드 상세페이지 이동하기-->
				<td>	<a href='/guide/guideDetailPage?board_no=${PayInfoVO.board_no}'>	<input type="button"  class="guideDetailPage" value="가이드 상세페이지"></a></td>
			</tr>
		</table>
		<br>
<%-- 	</c:forEach> --%>
	</c:forEach>
	</form>


	<!--현재 페이지 따라서 표시 해줌-->
	<c:if test="${maker.prev}"><a href="/pay/myPayInfo?page=${maker.startPage-1 }">◁◁</a></c:if>
	<ul class="pagination">
	<c:forEach begin="${maker.startPage }" end="${maker.endPage }" var="i">
		 <li 
        <c:out value="${(i==maker.cri.page)?'class=active':''}"/>
        >
			<a href="/pay/myPayInfo?page=${i} ">${i }</a> <!--$perPageNum=${maker.cri.perPageNum }-->
		</li>
	</c:forEach>
	</ul>
	<c:if test="${maker.next}"><a href="/pay/myPayInfo?page=${maker.endPage+1 }">▷▷</a></c:if>





</body>
</html>