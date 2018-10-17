<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 팔로우한 사용자</title>
<style type="text/css">
	body{
		margin: 70px 50px;
	}
	table {
		width:40%;
		margin:20px 10px;
		border:1;
		border-color: #00ff80;
	}
	th{
		text-align: left;
	}
</style>
</head>
<body>
<h3>내가 팔로우한 사용자</h3>
<hr align="left" style="border: solid 2px #00ff80;" width="200px">
<!-- <hr align="left" style="border: solid 2px #343a40;" width="200px"> -->
<table cellpadding="3">
	<tr>
		<th colspan="2">팔로우</th>
		<th>날짜</th>
	</tr>
	<c:forEach items="${creator }" var="myGuide">
	<tr>
		<td>
			<img src="/resources/img/user_big.png" height="70" width="70">
		</td>
		<td>
			<%-- <a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=${sessionScope.Id}">${myGuide.member_email_guide }</a> --%>
		<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=localup@gmail.com">${myGuide.member_email_guide }</a>
		</td>
		<td>
			<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
		</td>
	</tr>
	</c:forEach>
</table>

<%-- <c:forEach items="${creator }" var="myGuide">
	<div>
		<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=${sessionScope.Id}">${myGuide.member_email_guide }</a>
		<a href="/member/mInfo?member_email_guide=${myGuide.member_email_guide }&member_email_sub=localup@gmail.com">${myGuide.member_email_guide }</a>
		<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
	</div>
</c:forEach> --%>

</body>
</html>