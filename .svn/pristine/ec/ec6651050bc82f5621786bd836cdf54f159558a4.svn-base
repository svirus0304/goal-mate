<%@page import="java.text.ParsePosition"%>
<%@page import="com.GoalMate.www.DTO.Mat_ReDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%
	System.out.println("-------------------------------------------------------------");
	List<Mat_ReDTO> list=(List<Mat_ReDTO>)request.getAttribute("list");
	List<Mat_ReDTO> re_list=(List<Mat_ReDTO>)request.getAttribute("re_list");
	Date today=new Date();
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.searchDiv {
	margin:auto;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px;
}
.myMatchIndexDiv {
	background-color: lightgray;
	min-width:630px;
	width: 630px;
	margin:auto;
}
.myMatchItemsDiv {
	overflow: auto;
	min-width:630px;
	width: 630px;
	height:300px;
	margin: auto;
	text-align: center;
	margin-bottom: 30px;
}
.myMatchIndexDiv table,.myMatchItemsDiv table{
	border-collapse: collapse;
}

.mat_num{width:50px;}
.mat_date{width:100px;}
.teamName{width:150px;}
.mat_place{width:150px;}
.mat_number{width:50px;}
.result{width:100px;}

.index{
	text-align:center;
	font-weight:bold;
	background-color: lightgray;
	height: 50px;
	font-size: 12px;
}
.fixed{position: fixed;}
.items{
	text-align: center;
	height: 50px;
	font-size:12px;
}
</style>
<script type="text/javascript">
function reRegForm(mat_num,result){
	var width = 600; 
 	var height = 605;
 	var top = (screen.availHeight / 2) - (height / 2); 
 	var left = (screen.availWidth / 2) - (width / 2);

	window.open("reRegForm?mat_num="+mat_num+"&result="+result,"","width="+width+", height="+height+", top=" + top + ", left=" + left);
}//mat_placemat_numForm

$(document).ready(function(){
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var mat_num=$(this).find(".mat_num").text();
		var result=$(this).find(".result").text();
		reRegForm(mat_num,result);
	});//click
});//ready

</script>
</head>
<body>
	<div class="searchDiv">
		<label for="searchText">팀명검색 : </label>
		<input type="text" name="search" id="searchText" onkeydown="javascript:if(event.keyCode==13){document.getElementById('searchBtn').click();}">
		<input type="button" value="검색" id="searchBtn" onclick="location.href='template?page=/myMatchSearch?searchName='+document.getElementById('searchText').value">
	</div>
	<div class="myMatchIndexDiv">
		<table>
			<tr class="index">
				<td class="mat_num">경기<br>번호</td>
				<td class="mat_date">일시</td>
				<td class="teamName">홈 vs 어웨이</td>
				<td class="mat_place">장소</td>
				<td class="mat_number">인원</td>
				<td class="result">경기결과</td>
			</tr>
		</table>
	</div>
	<div class="myMatchItemsDiv">
		<table>
			<%for(int i=0;i<list.size();i++){
				Date mat_date=new SimpleDateFormat("yyyy-MM-dd").parse(list.get(i).getMat_date(), new ParsePosition(0));//String -> Date
				if(list.get(i).getMat_home()==null){list.get(i).setMat_home("");}
				if(list.get(i).getMat_away()==null){list.get(i).setMat_away("");}%>
			<tr class="items">
				<td class="mat_num"><%=list.get(i).getMat_num()%></td>
				<td class="mat_date"><%=list.get(i).getMat_date()%><br><%=list.get(i).getMat_time()%></td>
				<td class="teamName"><%=list.get(i).getMat_home()%> vs <%=list.get(i).getMat_away()%></td>
				<td class="mat_place"><%=list.get(i).getMat_place()%></td>
				<td class="mat_number"><%=list.get(i).getMat_number()%></td>
				<%if(list.get(i).getMat_home()=="" || list.get(i).getMat_away()==""){%>
					<td class="result">대기</td>
				<%}else if(mat_date.after(today)){%><!-- 경기시작전 (mat_date<sysdate)-->
				<%System.out.println("/myMatch.jsp - mat_date : "+mat_date+" / today : "+today+" / mat_date.after(today) : "+mat_date.after(today)); %>
					<td class="result">경기시작전</td>
				<%}else{%>
					<%boolean flag=false; %>
					<%for(int j=0;j<re_list.size();j++){%><!-- 점수미입력 matDTO와 reDTO 의 mat_num 일치 x-->
						<%if(list.get(i).getMat_num()==re_list.get(j).getMat_num()){ %><!-- matchDTO mat_num 과 reDTO mat_num 일치 찾기 -->
							<%flag=true; %>
							<%if(re_list.get(j).getMat_confirm()==0){%><!-- 결과승인대기 (re_home_score!=null && mat_confirm==0)-->
								<td class="result">결과승인대기</td>
							<%}else if(re_list.get(j).getMat_confirm()==1){%><!-- 매치결과 (mat_confirm==1) -->
									<td class="result">
										<span class="homeScore"><%=re_list.get(j).getRe_home_score() %></span> : <span class="awayScore"><%=list.get(i).getRe_away_score() %></span>
										<span class="resultScore"></span>
									</td>
								<%}//if%>
						<%}//if %>
					<%}//for %>
					<%if(flag==false){ %>
						<td class="result"><font color="red">점수미입력</font></td>
					<% }//if%>
				<% }//else%>
			</tr>
			<% }//for%>
		</table>
	</div>
</body>
</html>