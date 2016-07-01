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

.dateDiv{
	margin-top:20px;
	margin-bottom:20px;
	font-size:20px;
	text-align: center;
}
.date{
	padding:20px;
}
.prevDay:hover,.nextDay:hover{
	color:pink;
	cursor: pointer;
}
.searchDiv {
	margin:auto;
	text-align: center;
}
.matchUpListIndexDiv{
	min-width:800px;
	width:800px;
	margin:auto;
	margin-top:20px;
}
.matchUpListIndexDiv table{
	border-collapse: collapse;
}
.matchUpListItemsDiv {
	overflow: auto;
	min-width:800px;
	width: 800px;
	height:400px;
	margin: auto;
	margin-bottom:30px;
}
.matchUpListItemsDiv table{
	border-spacing: 0px;
}

.hidden{width:0px;}
.status{width:80px;}
.mat_date{width:100px;}
.teamName{width:150px;}
.mat_place{width:300px;}
.mat_number{width:50px;}
.mat_price{width:100px;}

.index{
	text-align:center;
	font-weight:bold;
	background-color: lightgray;
	height: 50px;
	font-size: 17px;
}
.matchUpListItemsDiv td{
	text-align: center;
	height: 50px;
	font-size:13px;
}
</style>
<script type="text/javascript">
function matchUpDetail(teamName,mat_num){
	var width = 600; 
 	var height = 500;
 	var top = (screen.availHeight / 2) - (height / 2); 
 	var left = (screen.availWidth / 2) - (width / 2);

	window.open("matchUpDetail?teamName="+teamName+"&mat_num="+mat_num,"","width="+width+", height="+height+", top=" + top + ", left=" + left);
}//mat_placemat_priceForm

$(document).ready(function(){
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var teamName=$(this).find(".teamName .name4detail").text();
		var mat_num=$(this).find(".mat_num").val();
		matchUpDetail(teamName,mat_num);
	});//click

	//--------------------------------------- 전날,다음날 넘기기 -----------------------------------------------
	var currentYear=${map_date.year};
	var currentMonth=${map_date.month};
	var currentDay=${map_date.day};
	
	var area=$('select[name=area]').val();
	
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	if( (currentYear % 4 === 0 && currentYear % 100 !== 0) || currentYear % 400 === 0 )
		lastDate[1] = 29;
	//각 달의 마지막 일을 계산, 윤년의 경우 년도가 4의 배수이고 100의 배수가 아닐 때 혹은 400의 배수일 때 2월달이 29일 임.
	var currentLastDay = lastDate[currentMonth-1];
	//--------------------------------------- 전날 -----------------------------------------------
	$(".prevDay").click(function(){
		if(currentDay != 1){//오늘이 1일이 아니면 - 그냥 -1 해준다.
			var prevDate = currentYear + '-' + currentMonth + '-' + (currentDay-1);
		}else{//오늘이 1일이면 - 1월일경우:12월,연도-1 / 아닌경우:-1월된다. -> 그달에 맞는 lastDate적용
			if (currentMonth==1) {//1월인 경우
				var prevYear=currentYear-1;//연도-1
				var prevMonth=12;//월=12
			}else{//1월 아닌경우
				var prevYear=currentYear;
				var prevMonth=currentMonth-1;
			}
			if( (prevYear % 4 === 0 && prevYear % 100 !== 0) || prevYear % 400 === 0 )
				lastDate[1] = 29;
			prevDay=lastDate[prevMonth-1];
			var prevDate = prevYear + '-' + prevMonth + '-' + prevDay;
		}
		location.href="template?page=/matchUpList?date="+prevDate+"&area="+area;
	});//prevDay
	//--------------------------------------- 다음날 -----------------------------------------------
	$(".nextDay").click(function(){
		if(currentDay != currentLastDay){//오늘이 마지막날이 아니면 그냥 +1해준다.
			var nextDate = currentYear + '-' + currentMonth + '-' + (currentDay+1);
		}else{//오늘이 마지막날이면 - 1.12월이면:월=1,일=1  / 2.12월아니면: 월+1,일=1
			if (currentMonth==12) {
				var nextYear=currentYear+1;
				var nextMonth=1;
				var nextDay=1;
			}else{
				var nextYear=currentYear;
				var nextMonth=currentMonth+1;
				var nextDay=1;
			}
			var nextDate = nextYear + '-' + nextMonth + '-' + nextDay;
		}
		location.href="template?page=/matchUpList?date="+nextDate+"&area="+area;
	});//nextDay
});//ready
function changeArea(){
	var area=$('select[name=area]').val();
	location.href="template?page=/matchUpList?date=${date}&area="+area;
}//chageArea()
</script>
</head>
<body>
	<div class="dateDiv">
		<span class="prevDay">◀</span>
		<span class="date">${date }</span>
		<span class="nextDay">▶</span>
	</div>
	<div class="searchDiv">
		<label for="searchText">팀명검색 : </label>
		<input type="text" name="search" id="searchText" onkeydown="javascript:if(event.keyCode==13){document.getElementById('searchBtn').click();}">
		<input type="button" value="검색" id="searchBtn" onclick="location.href='template?page=/matchUpSearch?name='+document.getElementById('searchText').value+'&date=${date}'">
	</div>
	<div class="matchUpListIndexDiv">
		<table>
			<tr>
			<!-- 지역선택 -->
				<td colspan=3 align="left">
					<div class="areaDiv">
						<select name="area" onchange="changeArea();">
							<c:forEach var="fors" items="${areas }">
								<c:choose>
									<c:when test="${fors.equals(area) }">
										<option selected>${fors }</option>
									</c:when>
									<c:otherwise>
										<option>${fors }</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</td>
				<!-- 매치등록 -->
				<td colspan=3 align="right">
					<input type="button" value="매치등록" onclick="location.href='template?page=/challengeRegForm?date=${date}'">
				</td>
			</tr>
			<tr class="index">
				<td class="status">상태</td>
				<td class="mat_date">일시</td>
				<td class="teamName">팀명</td>
				<td class="mat_place">장소</td>
				<td class="mat_number">인원</td>
				<td class="mat_price">구장비</td>
			</tr>
		</table>
	</div>
	<div class="matchUpListItemsDiv">
		<table>
			<c:forEach var="fors" items="${list }">
			<tr class="items" bgcolor="white">
				<td class="hidden"><input type="hidden" class="mat_num" value="${fors.mat_num }"></td>
				<!-- status - away나 home 둘중에 하나가 비었을때 '대기'--> 
				<c:choose>
				<c:when test="${fors.mat_away==null || fors.mat_home==null}">
					<td class="status"><font color="red">대기</font></td>
				</c:when>
				<c:otherwise>
					<td class="status">매치성사</td>
				</c:otherwise>
				</c:choose>
				<td class="mat_date">${fors.mat_date }<br>${fors.mat_time }</td>
				<!-- teamName -   -->
				<c:choose>
					<c:when test="${fors.mat_away==null}">
						<td class="teamName"><span class="name4detail">${fors.mat_home }</span></td>
						<td class="mat_place">(홈)<br>${fors.mat_place }</td>
					</c:when>
					<c:when test="${fors.mat_home==null}">
						<td class="teamName"><span class="name4detail">${fors.mat_away }</span></td>
						<td class="mat_place">(원정)<br>${fors.mat_place }</td>
					</c:when>
					<c:otherwise>
						<td class="teamName"><span class="name4detail">${fors.mat_home }</span> vs ${fors.mat_away }</td>
						<td class="mat_place">${fors.mat_place }</td>
					</c:otherwise>
				</c:choose>
				<td class="mat_number">${fors.mat_number }</td>
				<td class="mat_price">${fors.mat_price }원</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>