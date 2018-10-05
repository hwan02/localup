<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="overlaybox">
	<ul>
		<c:forEach items="${custom}" var="overlay" varStatus="status">
			<li class="up">
				<span class="number">${status.count }</span> 
				<span class="title">${overlay.board_title }</span>
				<span class="count">${overlay.board_like}</span>
			</li>
		</c:forEach>
	</ul>
</div>
