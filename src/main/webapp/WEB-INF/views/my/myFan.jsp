<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나를 팔로우한 사용자들</title>
</head>
<body>
	나를 팔로우한 사용자들
	<hr>
	<c:forEach items="${member_email_sub }" var="myGuide">
	<div>
		${myGuide.member_email_sub }
		<fmt:formatDate pattern="yyyy-MM-dd" value="${myGuide.sub_date }"/>
	</div>
</c:forEach>
	
</body>
</html>