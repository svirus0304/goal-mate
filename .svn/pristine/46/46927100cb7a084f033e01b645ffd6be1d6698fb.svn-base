<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
h2{
	margin-top:50px;
	text-align: center;
}
.searchDiv {
	text-align: center;
}
.scoreListIndexDiv{
	min-width:600px;
	width:60%;
	margin:auto;
	margin-top:20px;
	background-color: lightgray;
}
.scoreListItemsDiv {
	overflow: auto;
	min-width:600px;
	width: 60%;
	height:400px;
	margin: auto;
}

.mat_num{width:100px;}
.home{width:100px;}
.away{width:100px;}
.score{width:100px;}
.date{width:100px;}
.confirm{width:100px;}

.index{
	text-align:center;
	font-weight:bold;
	background-color: lightgray;
	height: 50px;
	font-size: 17px;
}
.scoreListItemsDiv td{
	text-align: center;
	height: 50px;
	font-size:13px;
}
</style>
<script type="text/javascript">
function scoreConfirmForm(mat_num){
	var width = 700; 
 	var height = 810;
 	var top = (screen.availHeight / 2) - (height / 2); 
 	var left = (screen.availWidth / 2) - (width / 2);

	window.open("scoreConfirmForm?mat_num="+mat_num,"확정폼","width="+width+", height="+height+", top=" + top + ", left=" + left);
}//scoreConfirmForm

$(document).ready(function(){
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var mat_num=$(this).find(".mat_num").text();
		location.href="javascript:scoreConfirmForm("+mat_num+")";
	});//click
	
});//ready

</script>
</head>
<body>
	<h2>매치관리</h2><br>
	<div class="searchDiv">
		<label for="searchText">팀명검색 : </label>
		<input type="text" name="search" id="searchText" onkeydown="javascript:if(event.keyCode==13){document.getElementById('searchBtn').click();}">
		<input type="button" value="검색" id="searchBtn" onclick="location.href='adminMain?page=/scoreSearch?name='+document.getElementById('searchText').value">
	</div>
	<div class="scoreListIndexDiv">
		<table width=100% align="center">
			<tr class="index">
				<td class="mat_num">매치번호</td>
				<td class="home">HOME</td>
				<td class="away">AWAY</td>
				<td class="score">점수</td>
				<td class="date">매치일</td>
				<td class="confirm">확정여부</td>
			</tr>
		</table>
	</div>
		<div class="scoreListItemsDiv">
		<table width=100% align="center">
			<c:forEach var="fors" items="${list }">
			<tr class="items" bgcolor="white">
				<td class="mat_num">${fors.mat_num }</td>
				<td class="home">${fors.mat_home }</td> <!-- MatchDTO -->
				<td class="away">${fors.mat_away }</td>	<!-- MatchDTO -->
				<td class="score">${fors.re_home_score } : ${fors.re_away_score }</td>
				<td class="date">${fors.mat_date }</td> <!-- MatchDTO -->
				<c:choose>
				<c:when test="${fors.mat_confirm==0 }">
					<td class="confirm"><font color="red">미확정</font></td> <!-- scoreConfirmForm.jsp 새창 띄워준다. -->
				</c:when>
				<c:when test="${fors.mat_confirm==1 }">
					<td class="confirm">확정</td>
				</c:when>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>