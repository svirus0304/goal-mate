<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<%-- <c:choose>
	<c:when test="${type.equals('admin') }">
		<c:redirect url="/adminMain"></c:redirect>
	</c:when>
</c:choose> --%>
<table border="0" align="center" width=1000 cellspacing=0 >
	<tr>
		<c:choose>
			<c:when test="${type.equals('admin') }">
			 <td colspan=2><jsp:include page="navigation/top1_admin.jsp"/></td>
			</c:when>
			<c:when test="${type.equals('user') }">
			 <td colspan=2><jsp:include page="navigation/top1_user.jsp"/></td>
			</c:when>
			<c:when test="${type.equals('club') }">
			 <td colspan=2><jsp:include page="navigation/top1_club.jsp"/></td>
			</c:when>
			<c:when test="${type==null}">
			 <td colspan=2><jsp:include page="navigation/top1_logout.jsp"/></td>
			</c:when>
		</c:choose>
	</tr>
	<tr>
		<td colspan=2><jsp:include page="navigation/top2.jsp"/><br><hr></td>
	</tr>
	<tr>
		<td><jsp:include page="${page }"/></td>
	</tr>
	<tr>
	</tr>
</table>
</body>
</html>
