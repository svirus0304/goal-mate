<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String op=(String)request.getAttribute("op");
	System.out.println("admin/score/alert.jsp - op : "+op);
	
	String say="";
	String loc="back";
	if(op.equals("scoreConfirmSuc")){
		say="매치결과 확정을 완료하였습니다.";
		loc="scoreConfirmForm?mat_num="+request.getAttribute("mat_num");
	}else if(op.equals("null")){
		say="에라발생";
	}
	System.out.println("admin/score/alert.jsp - say : "+say);
	System.out.println("admin/score/alert.jsp - loc : "+loc);
	
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