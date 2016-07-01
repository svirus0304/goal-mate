<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String op=(String)request.getAttribute("op");
	System.out.println("admin/banner/alert.jsp - op : "+op);
	
	String say="";
	String loc="back";
	if(op.equals("bannerDelSuc")){
		say="배너를 삭제하였습니다.";
		loc="selfClose";
	}else if(op.equals("bannerModiSuc")){
		say="배너 수정을 완료하였습니다.";
		loc="bannerDetail?bann_num="+request.getAttribute("bann_num");
	}else if(op.equals("bannerRegSuc")){
		say="배너를 성공적으로 등록하였습니다.";
		loc="selfClose";
	}else if(op.equals("bannerOnOffFail")){
		say="배너는 최대 5개까지 켤 수 있습니다.";
		loc="adminMain?page=/bannerList";
	}else if(op.equals(null)){
		say="에라발생";
	}
	System.out.println("admin/banner/alert.jsp - say : "+say);
	System.out.println("admin/banner/alert.jsp - loc : "+loc);
	
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