<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.scoreResultTab{text-align:center;}
table{text-align:center;}
tr{text-align: center;}
td{text-align: center;}
.homeaway{font-size:18px;}
.draw{font-size: 25px;}
.clubName{font-size: 30px;}
.date{height:100px;font-size: 20px;}
.date img{max-height: 100px;}
.score{font-size: 50px;}
button{margin-top:30px;font-size:20px;}
</style>
<script type="text/javascript">
function winClose(){
	opener.location.href="adminMain?page=/scoreList";
	self.close();
}//winClose()
</script>
</head>
<body>
<table class="scoreResultTab" width=650 align="center">
	<tr class="date"><!-- mat_reDTO -->
		<c:choose>
			<c:when test="${mat_reDTO.re_home_score>mat_reDTO.re_away_score }">
				<td><img src="resources/admin/img/winner4.png"></td><td>${mat_reDTO.mat_date }</td><td></td>
			</c:when>
			<c:when test="${mat_reDTO.re_home_score<mat_reDTO.re_away_score }">
				<td></td><td>${mat_reDTO.mat_date }</td><td><img src="resources/admin/img/winner4.png" width=100></td>
			</c:when>
			<c:when test="${mat_reDTO.re_home_score==mat_reDTO.re_away_score }">
				<td class="draw">무</td><td>${mat_reDTO.mat_date }</td><td class="draw">무</td>
			</c:when>
		</c:choose>
	</tr>
	<tr class="homeaway"><!-- HOME/AWAY -->
		<td>HOME</td>
		<td rowspan=4><img src="resources/admin/img/vs.png" width=100></td>
		<td>AWAY</td>
	</tr>
	<tr><!-- 엠블럼 --><!-- club명으로 ClubDTO 한개 더 불러온다 -->
		<td><img src="http://localhost/www/resources/img/emblem/${homeDTO.club_path}" width=200></td>
		<td><img src="http://localhost/www/resources/img/emblem/${awayDTO.club_path}" width=200></td>
	</tr>
	<tr class="clubName"><!-- 클럽명 -->
		<td>${mat_reDTO.mat_home }</td>
		<td>${mat_reDTO.mat_away }</td>
	</tr>
	<tr class="score"><!-- 점수  -->
		<td>${mat_reDTO.re_home_score }</td>
		<td>${mat_reDTO.re_away_score }</td>
	</tr>
</table><br><br>

<!-- 인증샷 -->
<table class="scoreSelfieTab" width=650>
	<tr>
		<td colspan=2 style="background-color: lightgray;">인증샷</td>
	</tr>
	<tr>
		<td><img src="http://localhost/www/resources/img/confirmImg/${mat_reDTO.re_path1 }" width=200></td>
		<td><img src="http://localhost/www/resources/img/confirmImg/${mat_reDTO.re_path2 }" width=200></td>
	</tr>
	<tr>
		<td colspan=2>
			<c:choose>
				<c:when test="${mat_reDTO.mat_confirm==0 }"><!-- 확정아닐 시  -->
					<button onclick="location.href='scoreConfirm?mat_num=${mat_reDTO.mat_num}'">확정</button><!-- re테이블의 MAT_CONFIRM을 1로 바꿔줘 -->
				</c:when>
				<c:when test="${mat_reDTO.mat_confirm==1 }"><!-- 확정일 시 -->
					<button onclick="winClose()">확인</button>
				</c:when>
			</c:choose>
			&nbsp;<button onclick="winClose()">취소</button>
		</td>
	</tr>
</table>

</body>
</html>