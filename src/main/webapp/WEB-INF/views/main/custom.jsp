<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="overlaybox">
	<ul> 
		<c:forEach items="${custom}" var="overlay" varStatus="status">
			<li class="up">
				<span class="number">${status.count }</span> 
				<a href="������ ��">
				<span class="title">${overlay.board_title }</span>
				</a>
				<span class="count">${overlay.board_like}</span>
			</li>
		</c:forEach>
		<li><a href="board/write?board_alti=${custom[0].board_alti}&board_long=${custom[0].board_long}">�Խñ� ����</a></li>
		<li><a href="javascript:customOverlay.setMap(null)">�ݱ�</a></li>
	</ul>
</div>
