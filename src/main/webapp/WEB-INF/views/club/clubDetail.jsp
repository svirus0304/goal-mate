<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script type="text/javascript">
function closes(){
	window.close();
} 	
</script>
<style>

.divs1 {
	text-align: center;
}
.divs2 {
	text-align: center;
	overflow: auto;
	width: 880px;
	height: 280px;
}

#star {
	width: 50px;
	height: 50px;
}
.tables{
	width:99%;
}

.widths1{
	width: 19%;
}
.widths2{
	width: 19%;
}
.widths3{
	width: 19%;
}
.widths4{
	width: 20%;
}
.widths5{
	width: 20%;
}

.divs{
	text-align: center;
}

</style>
<head>
<meta charset="UTF-8">
<title>클럽 정보</title>

</head>
<body>
	
	<table class="tables">
		<tr bgcolor="#B2EBF4" >
			<td colspan="5"><h1 align="center">클럽</h1></td>
		</tr>
		<tr width="100" height="100">
			<td rowspan="3" width="100" height="100"><img align="center" class="img"
				src="resources/img/emblem/${dto.club_path}"></td>
			<td bgcolor="#B2EBF4">클럽명</td>
			<td align="center">${dto.club_name}</td>
			<td bgcolor="#B2EBF4">전적</td>
			<td align="center">${dto.club_win}승&nbsp&nbsp${dto.club_draw}무&nbsp&nbsp${dto.club_draw}패</td>
		</tr>
		<tr>
			<td bgcolor="#B2EBF4">지역</td>
			<td align="center">${dto.club_area}</td>
			<td bgcolor="#B2EBF4">평균 연령</td>
			<td align="center">${dto.club_age}</td>
		</tr>
		<tr>
			<td bgcolor="#B2EBF4">클럽유형</td>
			<td align="center">${dto.club_type}</td>
			<td bgcolor="#B2EBF4">인 원</td>
			<td align="center">${number}</td>
		</tr>

	</table>
	<div class="divs1">
	<table class="tables">
		<tr>
			<td bgcolor="#B2EBF4" colspan="5" align="center"><h1>클럽 멤버</h1></td>
		</tr>
		<tr bgcolor="#B2EBF4">
			<td class="widths1">이름</td>
			<td class="widths2">포지션</td>
			<td class="widths3">피지컬</td>
			<td class="widths4">개인기</td>
			<td class="widths5">스피드</td>
		</tr>
	</table>
	</div>
	
		<div class="divs2">
	<c:if test="${number!=0}">
			<table class="tables">
				<c:forEach var="rows" items="${list}" varStatus="num">
					<tr>
						<td class="widths1" >${rows.pl_name}</td>
						<td class="widths2">${rows.pl_position}</td>

						<td class="widths3">
							<c:choose>
								<c:when test="${rows.pl_weight<50}">
									<c:set var="weight" value="1" />
								</c:when>

								<c:when test="${rows.pl_weight<70||rows.pl_weight>=50}">
									<c:set var="weight" value="2" />
								</c:when>
								<c:when test="${rows.pl_weight>=70}">
									<c:set var="weight" value="3" />
								</c:when>
							</c:choose> 
							
							<c:choose>
								<c:when test="${rows.pl_increase<=170}">
									<c:set var="increase" value="1" />
								</c:when>
								<c:when test="${rows.pl_increase>170}">
									<c:set var="increase" value="2" />
								</c:when>
							</c:choose>
							
							 <c:forEach var="starts" begin="1" end="${weight+increase}">
								<img src="resources/starRate/img/star-on.png"/>
							</c:forEach> 
							
							<c:if test="${weight+increase!=5}">
								<c:forEach var="starts" begin="${weight+increase+1}" end="5">
								<img src="resources/starRate/img/star-off.png"/>
								</c:forEach>
							</c:if>
							</td>

						<td class="widths4">
							 <c:forEach var="starts" begin="1" end="${rows.pl_dribble}">
								<img src="resources/starRate/img/star-on.png"/>
							</c:forEach> 
							<c:if test="${rows.pl_dribble!=5}">
								<c:forEach var="starts" begin="${rows.pl_dribble+1}" end="5">
								<img src="resources/starRate/img/star-off.png"/>
								</c:forEach>
							</c:if>
						</td>
						
						<td class="widths5">
							 <c:forEach var="starts" begin="1" end="${rows.pl_speed}">
								<img src="resources/starRate/img/star-on.png"/>
							</c:forEach> 
							<c:if test="${rows.pl_speed!=5}">
								<c:forEach var="starts" begin="${rows.pl_speed+1}" end="5">
								<img src="resources/starRate/img/star-off.png"/>
								</c:forEach>
							</c:if>						
						</td>	
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
	<div id="foot" align="center">
			<c:if test="${sessionScope.mem_id!=null}">
			<a href="msgSendForm?recipient=${dto.club_id}"><input type="button" value="쪽지보내기"></a>
			</c:if>
			<c:if test="${sessionScope.club_id!=null}">
			<a href="msgSendForm?recipient=${dto.club_id}"><input type="button" value="쪽지보내기"></a>
			</c:if>
			<input type="button" onclick="closes()" value="닫기">
	</div>
</body>
</html>