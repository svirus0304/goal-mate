<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<script type="text/javascript">
function closes(){
	window.close();
} 
</script>
<style>
.divs{
	text-align: center;
	height: 80%
}	
</style>
<head>
<meta charset="UTF-8">
<title>용병 정보</title>

</head>
<body>
<div class="divs">
<table border="2" height=50%>
<tr>
	<td bgcolor="lightgray" width=10%>이름</td>
	<td width=10%>${dto.mem_name}</td>
	<td bgcolor="lightgray" width=10%>사진</td>
	<td><img src="#"></td>
<tr>
	<td bgcolor="lightgray" width=10%>지역</td>
	<td width=10%>${dto.cen_area}</td>
	<td bgcolor="lightgray" width=10%>연령</td>
	<td width=10%>${dto.cen_age}</td>
</tr>
<tr>
	<td bgcolor="lightgray"><p>출전범위</p><p>HOME:우리지역</p><p>AWAY:원정</p></td>
	<td>${dto.cen_scope}</td>
	<td bgcolor="lightgray">피지컬</td>
	<td><c:choose>
			<c:when test="${dto.cen_weight<50}">
					<c:set var="weight" value="1" />
			</c:when>
			<c:when test="${dto.cen_weight<70||dto.cen_weight>=50}">
					<c:set var="weight" value="2" />
			</c:when>
			<c:when test="${dto.cen_weight>=70}">
					<c:set var="weight" value="3" />
			</c:when>
		</c:choose> 
		<c:choose>
			<c:when test="${dto.cen_increase<=170}">
					<c:set var="increase" value="1" />
			</c:when>
			<c:when test="${dto.cen_increase>170}">
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
				</c:if></td>
</tr>
	<tr>
		<td bgcolor="lightgray">포지션</td>
		<td>${dto.cen_position}</td>
		<td bgcolor="lightgray">주로쓰는 발</td>
		<td>${dto.cen_foot}</td>
	</tr>
	<tr>
		<td bgcolor="lightgray">풋살가능 시간</td>
		<td>
		<p>${dto.cen_date}</p>
		
		<c:set var="time" value="${fn:split(dto.cen_time,',')}"></c:set>
		<c:forEach items="${time}" var="rows" varStatus="num">
		<c:if test="${num.index==0}">${rows}:00~</c:if>
		<c:if test="${num.index==1}">${rows}:00</c:if>
		
		</c:forEach>
		</td>
		<td bgcolor="lightgray">축구경력</td>
		<td>${dto.cen_career}년</td>
	</tr>
</table>
<table width=100% height=30% border="2">
<tr><td bgcolor="lightgray">출전 각오</td></tr>
<tr><td>${dto.cen_content}</td></tr>
</table>
</div>
	<div id="foot" align="center">
			<c:if test="${sessionScope.mem_id!=null}">
			<a href="msgSendForm?recipient=${dto.mem_id}"><input type="button" value="쪽지보내기"></a>
			</c:if>
			<c:if test="${sessionScope.club_id!=null}">
			<a href="msgSendForm?recipient=${dto.mem_id}"><input type="button" value="쪽지보내기"></a>
			</c:if>
			<input type="button" onclick="closes()" value="닫기">
	</div>
</body>
</html>