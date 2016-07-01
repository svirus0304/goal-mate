<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
<script type="text/javascript">
	alert("로그아웃 되었습니다");
	location.href = "http://localhost/www/template";
</script>
</head>
<body>

</body>
</html>