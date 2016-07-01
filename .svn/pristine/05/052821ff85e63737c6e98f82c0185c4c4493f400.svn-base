<%@page import="com.GoalMate.www.DTO.ClubDTO"%>
<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String club_id="";
	if(session.getAttribute("club_id")!=null){
		club_id=(String)session.getAttribute("club_id");
	}
	ClubDTO clubDTO=(ClubDTO)request.getAttribute("clubDTO");
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
*:not(h2){font-size: 13px;}
.matchUpDetailTab{width:550px; border-collapse: collapse;}
.emblem{margin-bottom: -25px;}
.index,.items{text-align: center;}
.index{background-color: lightgray;}
.mat_place{width:150px;}
.name4detail{
	padding:5px;
	border-radius:20%;
	border-right:1px solid gray;
	border-bottom:1px solid gray;
}
.name4detail:hover{
	cursor:pointer;
	background-color:pink;
	-webkit-transition:all 0.2s ease-in-out;
}
.askDiv,.closeDiv{
	font-size:20px;
	background-color: white;
	width:100px;
	height:50px;
	margin:auto;
	text-align: center;
	line-height: 50px;
	border-radius:10%;
	border:1px solid;
	border-right:1px solid black;
	border-bottom:1px solid black;
}
.askDivEnter{
	border:none;
	border-right:5px solid gray;
	border-bottom:5px solid gray;
   	-webkit-transition: all 0.2s ease-in-out;
	transition: all 0.2s ease-in-out;
	cursor: pointer;
}
.askDivClick{
	border:none;
	border-left:5px solid gray;
	border-top:5px solid gray;
	cursor: pointer;
}
.mat_content{resize:none;text-align: center;border:none;
}
.hiddenId{display: none;}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".askDiv,.closeDiv").mouseenter(function(){
		$(this).addClass("askDivEnter");
	});
	$(".askDiv,.closeDiv").mouseleave(function(){
		$(this).removeClass("askDivEnter");
	});
	$(".askDiv,.closeDiv").mousedown(function(){
		$(this).removeClass("askDivEnter");
		$(this).addClass("askDivClick");
	});
	$(".askDiv,.closeDiv").mouseup(function(){
		$(this).removeClass("askDivClick");
	});
	$(".askDiv").click(function(){
		<%if(club_id.equals("")){%>
			alert("클럽 로그인이 필요한 작업입니다.");
			return;
		<%}%>
		<%if(club_id.equals(clubDTO.getClub_id())){%>
			alert("자신과의 싸움은 불가능 합니다.");
			return;
		<%}%>
		location.href="challengeAsk?mat_num="+$(".mat_num:eq(1)").text()+"&teamName=${clubDTO.club_name}&mat_home=${matchDTO.mat_home}";
	});
	$(".closeDiv").click(function(){
		opener.location.href="template?page=/matchUpList?date="+opener.$(".date").text()+"&area="+opener.$("select[name=area]").val();
		self.close();
	});
	$(".name4detail").click(function(){
		var club_id=$(this).find(".hiddenId").text();
		
		var width = 800;
		var height = 600;
		var left = screen.width/2 - width/2;
		var top = screen.height/2 - height/2
		var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
		option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
		window.open("clubDetail?club_id="+club_id,"clubDetail",option);
		
	});
	
});//ready
</script>

</head>
<body>
	<table class="matchUpDetailTab" align="center" border=1>
		<tr>
			<td class="items" colspan=4><img class="emblem"	src="resources/img/emblem/${clubDTO.club_path }"
				width=100>
			<h2>${clubDTO.club_name }</h2></td>
		</tr>
		<tr>
			<td class="index">클럽아이디</td>
			<td class="items">${clubDTO.club_id }</td>
			<td class="index">전적</td>
			<td class="items">${clubDTO.club_win }승 ${clubDTO.club_draw }무 ${clubDTO.club_lose }패</td>
		</tr>
		<tr>
			<td class="index">지역</td>
			<td class="items">${clubDTO.club_area }</td>
			<td class="index">연령대</td>
			<td class="items">${clubDTO.club_age }</td>
		</tr>
		<tr>
			<td class="index">팀유형</td>
			<td class="items">${clubDTO.club_type }</td>
			<td class="index">맴버수</td>
			<td class="items">${memberCnt }</td>
		</tr>
	</table>
	<p>
	<table class="matchUpDetailTab" align="center" border=1>
		<tr class="index">
			<td class="status">상태</td>
			<td class="mat_num">매치번호</td>
			<td class="mat_date">일시</td>
			<td class="teamName">팀명</td>
			<td class="mat_place">장소</td>
			<td class="mat_number">인원</td>
			<td class="mat_price">구장비</td>
		</tr>
		<tr class="items">
			<!-- status - away나 home 둘중에 하나가 비었을때 '대기'-->
			<c:choose>
				<c:when test="${matchDTO.mat_away==null || matchDTO.mat_home==null}">
					<td class="status"><font color="red">대기</font></td>
				</c:when>
				<c:otherwise>
					<td class="status">매치성사</td>
				</c:otherwise>
			</c:choose>
			<!-- mat_num -->
			<td class="mat_num">${matchDTO.mat_num }</td>
			<!-- mat_date -->
			<td class="mat_date">${matchDTO.mat_date }<br>${matchDTO.mat_time }</td>
			<!-- teamName -   -->
			<c:choose>
				<c:when test="${matchDTO.mat_away==null}">
					<td class="teamName"><span class="name4detail">${matchDTO.mat_home }<span class="hiddenId">${clubID_home }</span></span></td>
				</c:when>
				<c:when test="${matchDTO.mat_home==null}">
					<td class="teamName"><span class="name4detail">${matchDTO.mat_away }<span class="hiddenId">${clubID_away }</span></span></td>
				</c:when>
				<c:otherwise>
					<td class="teamName"><span class="name4detail">${matchDTO.mat_home }<span class="hiddenId">${clubID_home }</span></span>
						vs <span class="name4detail">${matchDTO.mat_away }<span class="hiddenId">${clubID_away }</span></span></td>
				</c:otherwise>
			</c:choose>
			<td class="mat_place">${matchDTO.mat_place }</td>
			<td class="mat_number">${matchDTO.mat_number }</td>
			<td class="mat_price">${matchDTO.mat_price }원</td>
		</tr>
		<tr>
			<td colspan=7><p>
				<textarea rows="4" cols="73" class="mat_content" readonly="readonly">${matchDTO.mat_content }</textarea>
			</td>
		</tr>
	</table>
	<p>
	 <!-- '대기' : 매치신청 / '매치성사' : 닫기 -->
	<c:choose>
		<c:when test="${matchDTO.mat_away==null || matchDTO.mat_home==null}">
			<div class="askDiv">매치신청</div>
		</c:when>
		<c:otherwise>
			<div class="closeDiv">닫기</div>
		</c:otherwise>
	</c:choose>
	</body>
</html>