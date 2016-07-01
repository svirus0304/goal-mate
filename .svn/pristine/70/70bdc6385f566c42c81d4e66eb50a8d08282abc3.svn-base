<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>


.sub_tabmenu01 p {
	float: left;
	text-align: center;
	font-weight: bold;
	letter-spacing: 0;
}

.sub_tabmenu01 a.tab01:link, a.tab01:visited, a.tab01:active {
	margin: auto;
	float: center;
	padding: 1px 20px;
	color: #555;
	ground:
		url("http://www.baro-match.co.kr/site/korean/image/common/subtabmenu04.gif")
		no-repeat right top;
}

.sub_tabmenu01 a.tab01:hover {
	color: #B2EBF4;
}

.sub_tabmenu01 a.tab01_on:link, a.tab01_on:visited, a.tab01_on:active {
	margin: 0;
	float: center;
	padding: 8px 20px;
	background: url("resources/rank/find-bg.png")
		repeat-x left top;
	color: #5A5A5A;
}

.sub_tabmenu01 a.tab01_on:hover {
	color: #fff;
}
.divs{
	text-align: center;
	min-width:100%;
	width:100%;
	margin:auto;
	margin-top:20px;
}
.divs>table{
	min-width:100%;
	width: 100%;
	margin: auto;
}
</style>
<script type="text/javascript">
function mer_detail(mer_id){
	var id=mer_id;
	var width = 800;
	var height = 600;
	var left = screen.width/2 - width/2;
	var top = screen.height/2 - height/2
	var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
	option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
	window.open("merDetail?mer_id="+id,"merDetail",option);
}

function merReg(){
	var width = 800;
	var height = 600;
	var left = screen.width/2 - width/2;
	var top = screen.height/2 - height/2
	var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
	option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
	window.open("merRegForm","merRegForm",option);
}

function merModify(){
	var width = 800;
	var height = 600;
	var left = screen.width/2 - width/2;
	var top = screen.height/2 - height/2
	var option = 'width = ' + 800 + ', ' + 'height = ' + 600;
	option += ', ' + 'top = ' + top + ', ' + 'left = ' + left;
	window.open("merModifyForm","merModifyForm",option);
}

function merDel(){
	location.href=""
}

$(document).ready(function(){
	$('.mer_id').css("display","none");
	$("#searchText").focus();
	$(".items").hover(function(){
		$(this).css("background-color","#B2EBF4").css("cursor","pointer");
	},function(){
		$(this).css("background-color","white").css("cursor","pointer");
	});//hover
	
	$(".items").click(function(){
		var mer_id=$(this).children('.mer_id').text();
		alert(mer_id);
		mer_detail(mer_id);
	});//click
	
});//ready
</script>
<head>
<meta charset="UTF-8">
<title></title>
<table align="center">
	<tr>
		<td>
			<div class="sub_tabmenu01">
				<c:choose>
					<c:when test="${cat1 eq'전체'}">
						<p>
							<a
								href="template?page=/merList&cat1=전체&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">전체</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=전체&cat2=${cat2}&cat3=${cat3}"
								class="tab01">전체</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1 == '중구'}">
						<p>
							<a
								href="template?page=/merList&cat1=중구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">중구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=중구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">중구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='동구'}">
						<p>
							<a
								href="template?page=/merList&cat1=동구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">동구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=동구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">동구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='서구'}">
						<p>
							<a
								href="template?page=/merList&cat1=서구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">서구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=서구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">서구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='남구'}">
						<p>
							<a
								href="template?page=/merList&cat1=남구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">남구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=남구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">남구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='달서구'}">
						<p>
							<a
								href="template?page=/merList&cat1=달서구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">달서구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=달서구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">달서구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='달성군'}">
						<p>
							<a
								href="template?page=/merList&cat1=달성군&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">달성군</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=달성군&cat2=${cat2}&cat3=${cat3}"
								class="tab01">달성군</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='북구'}">
						<p>
							<a
								href="template?page=/merList&cat1=북구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">북구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=북구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">북구</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat1=='수성구'}">
						<p>
							<a
								href="template?page=/merList&cat1=수성구&cat2=${cat2}&cat3=${cat3}"
								class="tab01_on">수성구</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=수성구&cat2=${cat2}&cat3=${cat3}"
								class="tab01">수성구</a>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="sub_tabmenu01">
				<c:choose>
					<c:when test="${cat2 eq '전체'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=전체&cat3=${cat3}"
								class="tab01_on">전체</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=전체&cat3=${cat3}"
								class="tab01">전체</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat2 eq 'PIVO'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=PIVO&cat3=${cat3}"
								class="tab01_on">PIVO</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=PIVO&cat3=${cat3}"
								class="tab01">PIVO</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat2=='ALA'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=ALA&cat3=${cat3}"
								class="tab01_on">ALA</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=ALA&cat3=${cat3}"
								class="tab01">ALA </a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat2=='FIXO'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=FIXO&cat3=${cat3}"
								class="tab01_on">FIXO</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=FIXO&cat3=${cat3}"
								class="tab01">FIXO</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat2=='GOLEIRO'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=GOLEIRO&cat3=${cat3}"
								class="tab01_on">GOLEIRO</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=GOLEIRO&cat3=${cat3}"
								class="tab01">GOLEIRO</a>
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</td>
	</tr>
	<tr>
		<td>
		<div class="sub_tabmenu01">
				<c:choose>
					<c:when test="${cat3=='전체'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=전체"
								class="tab01_on">전체</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=전체"
								class="tab01">전체</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat3=='오른발'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=오른발"
								class="tab01_on">오른발</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=오른발"
								class="tab01">오른발</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat3=='왼발'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=왼발"
								class="tab01_on">왼발</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=왼발"
								class="tab01">왼발</a>
						</p>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${cat3=='양발'}">
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=양발"
								class="tab01_on">양발</a>
						</p>
					</c:when>
					<c:otherwise>
						<p>
							<a
								href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=양발"
								class="tab01">양발</a>
						</p>
					</c:otherwise>
				</c:choose>
		</div>
		</td>
	</tr>
</table>
<div class="divs">
<c:if test="${sel eq 0}">
<table align="center"><tr><td align="right"><a href="#" onclick="merReg()">용병 등록</a></td></tr></table>
</c:if>
<c:if test="${sel==1}">
<table align="center"><tr><td align="right"><a href="#" onclick="merModify()">용병수정</a><a href="template?page=/merDel&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=${pages}">용병삭제</a></td></tr></table>
</c:if>
<table align="center">
<tr><td>인원수:${count}</td></tr>
<tr bgcolor="#B2EBF4">
	<th>이미지</th>
	<th>이름</th>
	<th>지역</th>
	<th>경력</th>
	<th>포지션</th>
	<th>발</th>
	<th>피지컬</th>
</tr>
<c:forEach items="${list}" var="rows">
<tr class="items">
	<td class="mer_id">${rows.mem_id}</td>
	<td><img src="#">${rows.mem_path}</td>
	<td>${rows.mem_name}</td>
	<td>${rows.cen_area}</td>
	<td>${rows.cen_career}년</td>
	<td>${rows.cen_position}</td>
	<td>${rows.cen_foot}</td>
	<td>
		<c:choose>
			<c:when test="${rows.cen_weight<50}">
					<c:set var="weight" value="1" />
			</c:when>
			<c:when test="${rows.cen_weight<70||rows.cen_weight>=50}">
					<c:set var="weight" value="2" />
			</c:when>
			<c:when test="${rows.cen_weight>=70}">
					<c:set var="weight" value="3" />
			</c:when>
		</c:choose> 
		<c:choose>
			<c:when test="${rows.cen_increase<=170}">
					<c:set var="increase" value="1" />
			</c:when>
			<c:when test="${rows.cen_increase>170}">
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
	<td></td>
	<td></td>
</tr>
</c:forEach>
</table>
</div>
<div class="divs">
	<table cellpadding="10" cellspacing="10" align="center">
		<tr>
				<td>
			<c:if test="${pages>1}">
				[<a href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=1">◀◀</a>]
				[<a href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=${pages-1}">◀</a>]
			</c:if>
			
			<c:set var="doneLoop" value="false" />
			<c:forEach varStatus="num" begin="${startPage}" end="${endPage}">
				<c:if test="${not doneLoop}">					
						<a href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=${num.index}">&nbsp&nbsp${num.index}</a>			
					</c:if>
				<c:if test="${num.index==allPage}">
					<c:set var="doneLoop" value="true" />
				</c:if>
			</c:forEach>
			<c:if test="${pages<allPage}">	
			[<a href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=${pages+1}">▶</a>]
			[<a href="template?page=/merList&cat1=${cat1}&cat2=${cat2}&cat3=${cat3}&nowpage=${allPage}">▶▶</a>]
			</c:if>
			</td>
		</tr>
	</table>
	</div>
</head>
<body>

</body>
</html>