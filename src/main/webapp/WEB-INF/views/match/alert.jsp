<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String op=(String)request.getAttribute("op");
	System.out.println("match/alert.jsp - op : "+op);
	
	String say="";
	String loc="back";
	if(op.equals("needLogin")){
		say="클럽 로그인이 필요한 작업입니다.";
		loc="loginForm";
	}else if(op.equals("challengeRegSuc")){
		say="매치를 성공적으로 등록하였습니다.";
		loc="template?page=/matchUpCal";
	}else if(op.equals("challengeAskSuc")){
		say="매치신청 후 상대팀에게 메시지를 보냈습니다.";
		loc="matchUpDetail?mat_num="+request.getAttribute("mat_num")+"&teamName="+request.getAttribute("teamName");
	}else if(op.equals("reRegSuc")){
		say="승인요청을 보냈습니다.";
		loc="reRegForm?mat_num="+request.getAttribute("mat_num")+"&result=결과승인대기";
	}
	System.out.println("match/alert.jsp - say : "+say);
	System.out.println("match/alert.jsp - loc : "+loc);
	
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("<%=say%>");
	
	<%if(loc.equals("selfClose")){%>/* 새창 닫기 */
		opener.location.href="adminMain?page=/bannerList";
		self.close();
	<%}%>
	
	<%if(loc.equals("back")){%>/* 뒤로가기 */
		history.back();
	<%}else{%>/* 새 장소로 가기 */
		location.href="<%=loc%>";
	<%}//else%>
</script>

</body>
</html>