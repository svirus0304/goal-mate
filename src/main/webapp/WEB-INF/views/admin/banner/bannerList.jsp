<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
h2 {
	margin-top: 50px;
	text-align: center;
}

.searchDiv {
	min-width: 600px;
	width: 60%;
	margin: auto;
}

.bannerListIndexDiv {
	min-width: 600px;
	width: 60%;
	margin: auto;
	margin-top: 20px;
	background-color: lightgray;
}

.bannerListItemsDiv {
	overflow: auto;
	min-width: 600px;
	width: 60%;
	height: 400px;
	margin: auto;
}

.bann_use {width: 100px;}
.bann_num {width: 100px;}
.bann_join {width: 100px;}
.bann_title {width: 50px;}
.bann_content {width: 100px;}
.bann_path {	width: 200px;}

.index {
	text-align: center;
	font-weight: bold;
	background-color: lightgray;
	height: 50px;
	font-size: 17px;
}

.bannerListItemsDiv td {
	text-align: center;
	height: 50px;
	font-size: 13px;
}
</style>

<script type="text/javascript">
function bannerDetail(bann_num){
	var width = 550; 
 	var height = 500;
 	var top = (screen.availHeight / 2) - (height / 2); 
 	var left = (screen.availWidth / 2) - (width / 2);

	window.open("bannerDetail?bann_num="+bann_num,"배너상세폼","width="+width+", height="+height+", top=" + top + ", left=" + left);
}//scoreConfirmForm

function bannerRegForm(){
	var width = 550; 
 	var height = 500;
 	var top = (screen.availHeight / 2) - (height / 2); 
 	var left = (screen.availWidth / 2) - (width / 2);

	window.open("bannerRegForm","배너등록폼","width="+width+", height="+height+", top=" + top + ", left=" + left);
}//bannerRegForm

$(document).ready(function(){
	
	$("#searchText").focus();
	
	//.items----------------------------------------------------------------------------------
	$(".items").hover(function(){
		$(this).parent().css("background-color","#EAEAEA").css("cursor","pointer");
	},function(){
		$(this).parent().css("background-color","white").css("cursor","pointer");
	});//hover

	$(".items:not(.bann_use)").click(function(){
			var bann_num=$(this).parent().find(".bann_num").text();
			location.href="javascript:bannerDetail("+bann_num+")";
	});//click
	
	//.switch-------------------------------------------------------------------------------------
	$(".switch").hover(function(){
		if ($(this).attr("src")==("resources/admin/img/off.jpg")){//bann_use==0
			$(this).attr("src","resources/admin/img/off_hover.jpg");
		}else if($(this).attr("src")==("resources/admin/img/on.jpg")){//bann_use==1
			$(this).attr("src","resources/admin/img/on_hover.jpg");
		}
	},function(){
		if ($(this).attr("src")==("resources/admin/img/off_hover.jpg")){//bann_use==0
			$(this).attr("src","resources/admin/img/off.jpg");
		}else if($(this).attr("src")==("resources/admin/img/on_hover.jpg")){//bann_use==1
			$(this).attr("src","resources/admin/img/on.jpg");
		}
	});//hover
	
	$(".switch").click(function(){
		var bann_num=$(this).parent().parent().find(".bann_num").text();
		var bann_use;
		
		if ($(this).attr("src")==("resources/admin/img/off_hover.jpg")){//bann_use==0
			$(this).attr("src","resources/admin/img/on.jpg");
			bann_use=1;
		}else if($(this).attr("src")==("resources/admin/img/on_hover.jpg")){//bann_use==1
			$(this).attr("src","resources/admin/img/off.jpg");
			bann_use=0;
		}//else
		
		location.href="bannerOnOff?bann_num="+bann_num+"&bann_use="+bann_use;
	});//click
	
});//ready

</script>

</head>
<body>
	<h2>배너관리</h2>
	<br>
	<div class="searchDiv">
		<table width=100%>
			<tr>
				<td width=100></td>
				<td width=200 align="center">
					<label for="searchText">제목검색 : </label>
					<input type="text" name="search" id="searchText" onkeydown="javascript:if(event.keyCode==13){document.getElementById('searchBtn').click();}">
					<input type="button" value="검색" id="searchBtn" onclick="location.href='adminMain?page=/bannerSearch?name='+document.getElementById('searchText').value">
				</td>
				<td width=100 align="right"><input type="button" value="배너 등록" onclick="bannerRegForm();"></td>
			</tr>
		</table>
	</div>
	<div class="bannerListIndexDiv">
		<table width=100% align="center">
			<tr class="index">
				<td class="bann_use">사용</td>
				<td class="bann_num">배너번호</td>
				<td class="bann_title">제목</td>
				<td class="bann_path">배너이미지</td>
				<td class="bann_content">내용</td>
				<td class="bann_join">등록일</td>
			</tr>
		</table>
	</div>
	<div class="bannerListItemsDiv">
		<table width=100% align="center">
			<c:forEach var="fors" items="${list }">
				<tr bgcolor="white"><!-- .items -->
					<c:choose>
						<c:when test="${fors.bann_use==0 }">
							<td class="bann_use items"><img src="resources/admin/img/off.jpg" width=70 class="switch"></td>
						</c:when>
						<c:when test="${fors.bann_use==1 }">
							<td class="bann_use items"><img src="resources/admin/img/on.jpg" width=70 class="switch"></td>
						</c:when>
					</c:choose>
					<td class="bann_num items">${fors.bann_num }</td>
					<td class="bann_title items">${fors.bann_title }</td>
					<td class="bann_path items"><img src="http://localhost/www/resources/img/bannerImg/${fors.bann_path }" width=200 height=50></td>
					<c:choose>
						<c:when test="${fn:length(fors.bann_content)>=10}">
							<td class="bann_content items">${fors.bann_content.substring(0,8) }...</td>
						</c:when>
						<c:otherwise>
							<td class="bann_content items">${fors.bann_content }</td>
						</c:otherwise>
					</c:choose>
					<td class="bann_join items">${fors.bann_join }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>