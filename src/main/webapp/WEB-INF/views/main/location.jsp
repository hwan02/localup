<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
{
  "positions": [
<c:forEach var="loc" items="${list}" varStatus="status">
    {
      "lat": ${loc.board_alti},
      "lng": ${loc.board_long}
    }
	<%-- <c:if test="${!status.last}"> --%>
	<c:if test="${status.count<list.size()}">
	,
	</c:if>
</c:forEach>
  ]
}