<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
img {
	width: 150px;
	height: 150px;
}

.tr {
	text-align: center;
}

h1 {
	text-align: center;
}
.club_id{

}
</style>
<!DOCTYPE html>
<script type="text/javascript">
	function ageBox(patterns) {
		var patterns = patterns;
		if (patterns != 0) {
			location.href="template?page=/clubList?patterns="+patterns;
		} 
	}
	function findsBox() {
		var x = document.getElementById("findsBox").value;
		var y = document.getElementById("finds").value;
		if (y != null) {
			location.href="template?page=/clubList?patterns="+x+"&finds="+y;
		}
	}
	
	function findsBox(detail) {
		var x = document.getElementById("findsBox").value;
		var y = document.getElementById("finds").value;
		if (y != null) {
			location.href="template?page=/clubList?patterns="+x+"&finds="+y;
		}
	}
	
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
			var club_id=$(this).children().find('.club_id').text();
			club_detail(club_id);
		});//click
		
	});//ready
	
</script>
<head>
<meta charset="UTF-8">
<title>클럽 정보</title>
</head>
<body>
<table align="center">
	<tr>
	<td>
	<h2>클럽 정보</h2>
	(팀수:${size})
	<select name="ageBox" onchange="ageBox(this.value)">
		<option value="0"></option>
		<option value="1">전체</option>
		<option value="10">10대</option>
		<option value="20">20대</option>
		<option value="30">30대</option>
		<option value="40">40대</option>
		<option value="50">50대 이상</option>
	</select>

	<select name="findsBox" id="findsBox">
		<option value="60">팀명</option>
		<option value="70">지역</option>
	</select>	
	<input type="text" name="finds" id="finds" onkeydown="javascript:if(event.keyCode==13){findsBox();}"/>
	<input type="button" name="button_find" value="검색" onclick="findsBox()">
	</td>
	</tr>
</table>





	<table cellpadding="10" cellspacing="10" align="center" >
		<tr>
			<c:forEach var="rows" items="${list}" varStatus="num">
				<td class="items">
					<table border="5" >
						<tr class="tr">
							<td><img
								src="resources/img/emblem/${rows.club_path}"></td>
						</tr>
						<tr class="tr">
							<td>${rows.club_name}</td>
						</tr>
						<tr class="tr">
							<td class="td2">${rows.club_area}</td>
						</tr>
						<tr class="tr">
							<td class="td2">${rows.club_age}</td>
						</tr>
						<tr class="tr">
							<td class="td2">${rows.club_win}승${rows.club_draw}무
								${rows.club_lose}패</td>
						</tr>
						<tr>
							<td class="club_id">${rows.club_id}</td>
						</tr>
					</table>
				</td>
				<c:if test="${ num.count%4 eq 0 }">
					<tr>
						<td></td>
					</tr>
				</c:if>
				
			</c:forEach>
		</tr>
	</table>
				
	<table cellpadding="10" cellspacing="10" align="center" class="pageNums">
		<tr>
				<td>
			<c:if test="${page>1}">
				<c:if test="${patterns==null||patterns==1}">
				[<a href="template?page=/clubList&nowpage=1">◀◀</a>]
				[<a href="template?page=/clubList&nowpage=${page-1}">◀</a>]
				</c:if>
				<c:if test="${patterns==10||patterns==20||patterns==30||patterns==40||patterns==50}">
				[<a href="template?page=/clubList&nowpage=1&patterns=${patterns}">◀◀</a>]
				[<a href="template?page=/clubList&nowpage=${page-1}&patterns=${patterns}">◀</a>]				
				</c:if>
				<c:if test="${patterns==60}">
				[<a href="template?page=/clubList&nowpage=1&patterns=${patterns}&finds=${finds}">◀◀</a>]
				[<a href="template?page=/clubList&nowpage=${page-1}&patterns=${patterns}&finds=${finds}">◀</a>]				
				[</c:if>
				<c:if test="${patterns==70}">
				[<a href="template?page=/clubList&nowpage=1&patterns=${patterns}&finds=${finds}">◀◀</a>]
				[<a href="template?page=/clubList&nowpage=${page-1}&patterns=${patterns}&finds=${finds}">◀</a>]				
				</c:if>
			</c:if>
			
			<script type="text/javascript">
			$(document).ready(function(){
				$(".pageNums a").each(function(index,item){
					if ($(this).text()==("${page}")) {
						$(this).css("color","red");
					}//if
				})//each
				
				if("${page}"<"${allPage}"){
					setInterval(function(){
						location.href="template?page=/clubList&nowpage=${page+1}";
					},2000);
				}//if
				
				
			});
			</script>
			<script type="text/javascript">
			function changePage(page){
				
			}
			</script>
			
			<c:set var="doneLoop" value="false" />
			<c:forEach varStatus="num" begin="${startPage}" end="${endPage}">
				<c:if test="${not doneLoop}">
					
					<c:if test="${patterns==null||patterns==1}">
						<a href="template?page=/clubList&nowpage=${num.index}" onclick="">${num.index}</a>&nbsp&nbsp
					</c:if>
					<c:if test="${patterns==10||patterns==20||patterns==30||patterns==40||patterns==50}">
						<a href="template?page=/clubList?&nowpage=${num.index}&patterns=${patterns}">${num.index}</a>&nbsp&nbsp
					</c:if>
					<c:if test="${patterns==60||patterns==70}">
						<a href="template?page=/clubList?&nowpage=${num.index}&patterns=${patterns}&finds=${finds}">${num.index}</a>&nbsp&nbsp
					</c:if> 
					</c:if>
				
				<c:if test="${num.index==allPage}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:forEach>
			
			<c:if test="${page<allPage}">
				<c:if test="${patterns==null||patterns==1}">
			[<a href="template?page=/clubList&nowpage=${page+1}">▶</a>]
			[<a href="template?page=/clubList&nowpage=${allPage}">▶▶</a>]
				</c:if>
				<c:if test="${patterns==10||patterns==20||patterns==30||patterns==40||patterns==50}">
			[<a href="template?page=/clubList&nowpage=${page+1}&patterns=${patterns}">▶</a>]
			[<a href="template?page=/clubList&nowpage=${allPage}&patterns=${patterns}">▶▶</a>]
				</c:if>
				<c:if test="${patterns==60||patterns==70}">
			[<a href="template?page=/clubList&nowpage=${page+1}&patterns=${patterns}&finds=${finds}">▶</a>]
			[<a href="template?page=/clubList&nowpage=${allPage}&patterns=${patterns}&finds=${finds}">▶▶</a>]
				</c:if>
			</c:if>
			</td>
		</tr>
	</table>
</body>
</html>