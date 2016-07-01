<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function club_detail(club_id){
	var id=club_id;
	var width = 800;
	var height = 600;
	var left = screen.width/2 - width/2;
	var top = screen.height/2 - height/2
	var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
	option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
	window.open("clubDetail?club_id="+id,"clubDetail",option);
}
$(document).ready(function(){
    $('.club_id').css("display","none");
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var club_id=$(this).children(".club_id").text();
		club_detail(club_id);
	});//click
	
});//ready

</script>
<!DOCTYPE html>


<style>

img{
height: 100px;
width:  100px; 
}	
.divs1>table{
	width:100%;
}
.divs2>table{
	width:100%;
	background-color: #B2EBF4;
}
.divs3>table{
	min-width:600px;
	width: 100%;
	margin: auto;
}
.divs1{
	text-align: center;
	min-width:90%;
	width:100%;
	margin-top:20px;
	text-align: left;
	font-size: 20px
	}

.divs2{
	text-align: center;
	min-width:90%;
	width:100%;
	margin:auto;
	margin-top:20px;
	
}
.divs3{
	text-align: center;
	min-width:90%;
	width:100%;
	margin:auto;
	margin-top:20px;
}
.tds{
	width:100px;
}
.index{
	text-align:center;
	font-weight:bold;
	height: 50px;
	font-size: 17px;
	font-style: 
}
.sub_tabmenu01 p		{float:left;text-align:center; font-weight:bold;letter-spacing:0;}
.sub_tabmenu01 a.tab01:link, a.tab01:visited, a.tab01:active	{margin:auto;float:center;padding:1px 20px; color:#555;
ground:url("http://www.baro-match.co.kr/site/korean/image/common/subtabmenu04.gif") no-repeat right top;}
.sub_tabmenu01 a.tab01:hover		{color:#B2EBF4;}
.sub_tabmenu01 a.tab01_on:link, a.tab01_on:visited, a.tab01_on:active	{margin:0 ;float:center;padding:8px 20px;background:url("resources/rank/find-bg.png") repeat-x left top;color:#5A5A5A;}
.sub_tabmenu01 a.tab01_on:hover		{color:#fff;}

</style>
<head>
<meta charset="UTF-8">
<title>랭킹</title>
</head>
<body>

			<table align="center">
 			<tr><td>
 			<div class="sub_tabmenu01">
			<c:choose>
 				<c:when test="${cat1=='전체'}">
	 			<p><a href="template?page=/rankList&cat1=전체&cat2=${cat2}&cat3=${cat3}" class="tab01_on">전체</a></p>			
 				</c:when><c:otherwise>
	 			<p><a href="template?page=/rankList&cat1=전체&cat2=${cat2}&cat3=${cat3}" class="tab01">전체</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose>
 				<c:when test="${cat1=='중구'}">
				<p><a href="template?page=/rankList&cat1=중구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">중구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=중구&cat2=${cat2}&cat3=${cat3}" class="tab01">중구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				
 	
 				<c:choose>
 			   <c:when test="${cat1=='동구'}">
				<p><a href="template?page=/rankList&cat1=동구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">동구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=동구&cat2=${cat2}&cat3=${cat3}" class="tab01">동구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				
 				<c:choose>
 				<c:when test="${cat1=='서구'}">
				<p><a href="template?page=/rankList&cat1=서구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">서구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=서구&cat2=${cat2}&cat3=${cat3}" class="tab01">서구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose>
 				<c:when test="${cat1=='남구'}">
				<p><a href="template?page=/rankList&cat1=남구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">남구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=남구&cat2=${cat2}&cat3=${cat3}" class="tab01">남구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose> 				
 				<c:when test="${cat1=='달서구'}">
				<p><a href="template?page=/rankList&cat1=달서구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">달서구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=달서구&cat2=${cat2}&cat3=${cat3}" class="tab01">달서구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose>
 				<c:when test="${cat1=='달성군'}">
				<p><a href="template?page=/rankList&cat1=달성군&cat2=${cat2}&cat3=${cat3}" class="tab01_on">달성군</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=달성군&cat2=${cat2}&cat3=${cat3}" class="tab01">달성군</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose>
 				<c:when test="${cat1=='북구'}">
				<p><a href="template?page=/rankList&cat1=북구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">북구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=북구&cat2=${cat2}&cat3=${cat3}" class="tab01">북구</a></p> 				
 				</c:otherwise>
 				</c:choose>
 				<c:choose>
 				<c:when test="${cat1=='수성구'}">
				<p><a href="template?page=/rankList&cat1=수성구&cat2=${cat2}&cat3=${cat3}" class="tab01_on">수성구</a></p>
 				</c:when>
 				<c:otherwise>
				<p><a href="template?page=/rankList&cat1=수성구&cat2=${cat2}&cat3=${cat3}" class="tab01">수성구</a></p> 				
 				</c:otherwise>
 				</c:choose> 
		</div>
		
			</td></tr>
			<tr><td>
		<div class="sub_tabmenu01">
		<c:choose>
			<c:when test="${cat2=='전체'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=전체&cat3=${cat3}" class="tab01_on">전체</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=전체&cat3=${cat3}" class="tab01">전체</a></p>			
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat2=='청소년'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=청소년&cat3=${cat3}" class="tab01_on">청소년</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=청소년&cat3=${cat3}" class="tab01">청소년</a></p>			
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat2=='대학생'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=대학생&cat3=${cat3}" class="tab01_on">대학생</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=대학생&cat3=${cat3}" class="tab01">대학생</a></p>			
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat2=='직장인'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=직장인&cat3=${cat3}" class="tab01_on">직장인</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=직장인&cat3=${cat3}" class="tab01">직장인</a></p>			
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat2=='동아리'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=동아리&cat3=${cat3}" class="tab01_on">동아리</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=동아리&cat3=${cat3}" class="tab01">동아리</a></p>			
			</c:otherwise>
		</c:choose>	
		</div>
			</td></tr>
			<tr><td>
		<div class="sub_tabmenu01" >
		<c:choose>
			<c:when test="${cat3=='전체'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=전체" class="tab01_on">전체</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=전체" class="tab01">전체</a></p>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat3=='10대'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=10대" class="tab01_on">10대</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=10대" class="tab01">10대</a></p>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat3=='20대'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=20대" class="tab01_on">20대</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=20대" class="tab01">20대</a></p>
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${cat3=='30대'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=30대" class="tab01_on">30대</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=30대" class="tab01">30대</a></p>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat3=='40대'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=40대" class="tab01_on">40대</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=40대" class="tab01">40대</a></p>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${cat3=='50대 이상'}">
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=50대 이상" class="tab01_on">50대 이상</a></p>
			</c:when>
			<c:otherwise>
			<p><a href="template?page=/rankList&cat1=${cat1}&cat2=${cat2}&cat3=50대 이상" class="tab01">50대 이상</a></p>
			</c:otherwise>
		</c:choose>	
		
		
		</div>
			</td></tr>
 			</table>
		<div class="divs2">
		<table align="center">
			<tr bgcolor="#B2EBF4" class="index">
				<th class="tds" height="50">순위</td>
				<th class="tds">엠블렘</td>
				<th class="tds">팀명</td>	
				<th class="tds">승</td>
				<th class="tds">무</td>
				<th class="tds">패</td>
				<th class="tds">팀원수</td>
				<th class="tds">지역</td>
				<th class="tds">연령대</td>
				<th class="tds">소속유형</td>
				<th class="tds">승률</td>
				<th class="club_id">클럽 아이디</td>
			</tr>
			</table>
		</div>
		<div class="divs3">
		<table align="center">	
			<c:forEach items="${list}" varStatus="num" var="rows" begin="0" end="${listSize}">
			<tr class="items">
			<td class="td1" width="100px">
			<c:choose>
				<c:when test="${(num.index+1)==1}"><img src="resources/trophy/gold.png"></c:when>
				<c:when test="${(num.index+1)==2}"><img src="resources/trophy/silver.png"></c:when>
				<c:when test="${(num.index+1)==3}"><img src="resources/trophy/dong.png"></c:when>
				<c:when test="${(num.index+1)<=10}">${num.index+1}</c:when>
			</c:choose>
			</td>
			<td class="tds"><img src="resources/img/emblem/${rows.club_path}"></td>
			<td class="tds">${rows.club_name}</td>
			<td class="tds">${rows.club_win}</td>
			<td class="tds">${rows.club_draw}</td>
			<td class="tds">${rows.club_lose}</td>
			<td class="tds">${player_list[num.index]}</td>
			<td class="tds">${rows.club_area}</td>
			<td class="tds">${rows.club_age}</td>
			<td class="tds">${rows.club_type}</td>
			<td class="tds"><fmt:formatNumber value="${rows.club_win/(rows.club_win+rows.club_draw+rows.club_lose)*100}" pattern=".0"/>%</td>
			<td class="club_id">${rows.club_id}</td>
			</tr>
			</c:forEach>
			</table>
		</div>
		</div>

</body>
</html>