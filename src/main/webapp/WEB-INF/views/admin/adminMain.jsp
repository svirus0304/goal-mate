<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<table align="center" width=100%>
	<tr>
		<td colspan=2><jsp:include page="../navigation/top1_admin.jsp"/></td>
	</tr>
	<tr>
		<td><jsp:include page="admin_top.jsp"></jsp:include></td>
	</tr>
	<tr>
		<td><jsp:include page="${page }"></jsp:include></td>
	</tr>
</table>
</body>
</html>
