<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나를 팔로우한 사용자들</title>
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
	<h3>나를 팔로우한 사용자들</h3>
	<hr align="left" style="border: solid 2px #00ff80;" width="200px">
	<!-- <hr align="left" style="border: solid 2px #343a40;" width="200px"> -->
	<table cellpadding="3">
		<tr>
			<th colspan="2">팔로우</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${member_email_sub }" var="myGuide">
		<tr>
			<td>
				<img src="/resources/img/user_big.png" height="70" width="70">
			</td>
			<td>
				${myGuide.member_email_sub }
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<%-- 
	<c:forEach items="${member_email_sub }" var="myGuide">
		<div>
			${myGuide.member_email_sub }
			<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
		</div>
	</c:forEach>
	 --%>
</body>
</html>