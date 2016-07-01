<%@page import="com.GoalMate.www.DTO.ClubDTO"%>
<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String result=(String)request.getAttribute("result");
	System.out.println("------------------------------------------------------");
	System.out.println("/reRegForm.jsp - result : "+result);
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.scoreResultTab{text-align:center;}
table{text-align:center;border-collapse:collapse;}
tr{text-align: center;}
td{text-align: center;}
.homeaway{font-size:15px;}
.draw{font-size: 20px;}
.clubName{font-size: 20px;}
.date{height:80px;font-size: 20px;}
.date img{max-height: 100px;}
.score{font-size: 40px;height:50px;}
.scoreinput{font-size:15px;}
.scoreinput input{font-size:30px;text-align: center;width:60px;}
.btnDiv{margin:auto;text-align: center;}
button{margin-top:30px;font-size:20px;}
</style>
<script type="text/javascript">
function winClose(){
	opener.location.href="template?page=/myMatch";
	self.close();
}//winClose()
$(document).ready(function(){
	$(".scoreinput input:eq(0)").focus();
});
</script>
</head>
<body>
<!-- 대기 / 경기시작전 / 점수미입력 / 결과승인대기 / 확정 -->
<form action="reReg" method="post" enctype="multipart/form-data" id="reRegForm">
<input type="hidden" name="mat_num" value="${mat_reDTO.mat_num }">
<table class="scoreResultTab" width=500 height=350 align="center">
	<tr class="date"><!-- mat_reDTO -->
		<%if(result.equals("확정")) {%>
		<c:choose>
			<c:when test="${mat_reDTO.re_home_score>mat_reDTO.re_away_score }">
				<td><img src="resources/admin/img/winner4.png" width=80></td><td>${mat_reDTO.mat_date }</td><td></td>
			</c:when>
			<c:when test="${mat_reDTO.re_home_score<mat_reDTO.re_away_score }">
				<td></td><td>${mat_reDTO.mat_date }</td><td><img src="resources/admin/img/winner4.png" width=80></td>
			</c:when>
			<c:when test="${mat_reDTO.re_home_score==mat_reDTO.re_away_score }">
				<td class="draw">무</td><td>${mat_reDTO.mat_date }</td><td class="draw">무</td>
			</c:when>
		</c:choose>
		<%}else{	%>
				<td></td><td>${mat_reDTO.mat_date }</td><td></td>
		<%}%>
	</tr>
	<tr class="homeaway"><!-- HOME/AWAY -->
		<td>HOME</td>
		<td rowspan=4><img src="resources/admin/img/vs.png" width=100></td>
		<td>AWAY</td>
	</tr>
	<tr><!-- 엠블럼 --><!-- club명으로 ClubDTO 한개 더 불러온다 -->
		<td width=150>
			<c:choose>
				<c:when test="${homeDTO.club_path!=null }">
					<img src="resources/img/emblem/${homeDTO.club_path }" width=150>
				</c:when>
			</c:choose>
		</td>
		<td width=150>
			<c:choose>
				<c:when test="${awayDTO.club_path!=null }">
					<img src="resources/img/emblem/${awayDTO.club_path }" width=150>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr class="clubName"><!-- 클럽명 -->
		<td>${mat_reDTO.mat_home }</td>
		<td>${mat_reDTO.mat_away }</td>
	</tr>
	<tr class="score"><!-- 점수  -->
	<%if(result.equals("확정")) {%>
		<td>${mat_reDTO.re_home_score }</td>
		<td>${mat_reDTO.re_away_score }</td>
	<%}else if(result.equals("점수미입력")){ %>
		<td class="scoreinput">홈팀 점수 입력<br><input type="number" name="re_home_score" maxlength="2"></td>
		<td class="scoreinput">어웨이팀 점수 입력<br><input type="number" name="re_away_score" maxlength="2"></td>
	<%}else{	%>
		<td></td>
		<td></td>
	<%}//else%>
	</tr>
</table>
<!-- 인증샷 -->
<table class="scoreSelfieTab" align="center" width=500 height=150>
<%if(result.equals("확정") || result.equals("결과승인대기")) {%>
	<tr>
		<td colspan=2 style="background-color: lightgray;">인증샷</td>
	</tr>
	<tr>
		<td width=150>
			<c:choose>
				<c:when test="${mat_reDTO.re_path1!=null }">
					<img src="resources/img/confirmImg/${mat_reDTO.re_path1 }" width=150>
				</c:when>
			</c:choose>
		</td>
		<td width=150>
			<c:choose>
				<c:when test="${mat_reDTO.re_path2!=null }">
					<img src="resources/img/confirmImg/${mat_reDTO.re_path2 }" width=150>
				</c:when>
			</c:choose>
		</td>
	</tr>
<%}else if(result.equals("점수미입력")){%>
	<tr>
		<td colspan=2 style="background-color: lightgray;" height=10>인증샷</td>
	</tr>
	<tr>
		<td><input type="file" name="file1"></td>
		<td><input type="file" name="file2"></td>
	</tr>
<% }else{//else%>
	<tr>
		<td colspan=2></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
<%}//else%>
</table>
</form>
<div class="btnDiv">
<%if(result.equals("점수미입력")) {%>
	<button onclick="document.getElementById('reRegForm').submit();">승인받기</button><!-- re테이블 insert -->
<%}%>
	&nbsp;<button onclick="winClose()">닫기</button>
</div>
</body>
</html>