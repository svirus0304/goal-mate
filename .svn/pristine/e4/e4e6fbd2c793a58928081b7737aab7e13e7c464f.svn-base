<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String op=(String)request.getAttribute("op");
	System.out.println("/alert.jsp - op : "+op);
	
	String say="";
	String loc="back";
	if(op.equals("pathNull")){
		say="파일의 경로값이 없습니다.";
	}else if(op.equals("fileUpSuc")){
		say="파일을 성공적으로 업로드 하였습니다.";
	}
	
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=say%>");
	<%if(loc.equals("back")){%>
		history.back();
	<%}else{%>
		location.href="<%=loc%>";
	<%}//else%>
</script>

</body>
</html>