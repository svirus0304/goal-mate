<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Stadium</title>

<style type="text/css">
.bigIndex{width:100%;margin:auto;}
.index{padding-left: 10px; padding-right:10px; padding-bottom: 30px;}
.sindex{margin-left:-30px; }
a.middle:hover img{margin: -15px;
							border-squere: 80%;
   							border: 5px solid #f00;
   							-webkit-transition: all 0.1s ease-in-out;
   							transition: all 0.1s ease-in-out;}
/* -----------------------상단지역버튼 CSS---------------------------------------- */

#table{display: table; width: 800px;margin: auto;}
.row, .top{display:table-row;}
.title{display: table-cell; padding: 3px;background-color: #EAEAEA;text-align: center;}
.cell{display: table-cell; padding: 3px;text-align: center;vertical-align: middle;}
.row:hover{border-squere: 80%;
   				border: 5px solid #f00;
   				-webkit-transition: all 0.5s ease-in-out;
   				transition: all 0.5s ease-in-out;
   				background-color:#2FED28;
   				cursor: pointer;
   				}
   					
.col1,.tit1{width: 5%;}
.col2,.tit2{width: 20%;}
.col3,.tit3{width: 40%;}
.col4,.tit4{width: 20%;}
.col5,.tit5{width: 15%;}
/*-----------------------------------하단 테이블 CSS------------------------------------ */
</style>

<script type="text/javascript">
	function openStaDetail(num){

		var id = num;
		var url = "http://localhost/www/staDetail?st_num="+id;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbar=no,resizeable=no,width=850,height=900,left=500");
}
</script>
</head>
<body>
	<form action="staDetail" method="post">
		<div  class="bigIndex" align = center>
			<span class="index"><a class="middle" href="middleList?st_area=중구"><img  alt="중구" src="resources/AreaImg/Sum_middle.png"></a><span class="sindex">중구</span></span>
			<span class="index" id="west"><a class="middle" href="westList?st_area=서구"><img alt="서구" src="resources/AreaImg/Sum_west.png"></a><span class="sindex">서구</span></span> 
			<span class="index" id="south"><a class="middle" href="southList?st_area=남구"><img alt="남구" src="resources/AreaImg/Sum_south.png"></a><span class="sindex">남구</span></span> 
			<span class="index" id="dalseo"><a class="middle" href="dalseoList?st_area=달서구"><img alt="달서구" src="resources/AreaImg/Sum_dalseo.png"></a><span class="sindex">달서</span></span> 
			<span class="index" id="north"><a class="middle" href="northList?st_area=북구"><img alt="북구" src="resources/AreaImg/Sum_north.png"></a><span class="sindex">북구</span></span> 
			<span class="index" id="east"><a class="middle" href="eastList?st_area=동구"><img alt="동구" src="resources/AreaImg/Sum_east.png"></a><span class="sindex">동구</span></span> 
			<span class="index" id="dalsung"><a class="middle" href="dalsungList?st_area=달성군"><img alt="달성군" src="resources/AreaImg/Sum_dalseong.png"></a><span class="sindex">달성</span></span> 
			<span class="index" id="suseong"><a class="middle" href="suseongList?st_area=수성구"><img alt="수성구" src="resources/AreaImg/Sum_suseong.png"></a><span class="sindex">수성</span></span>
		</div>
		<p><p>
		
	<div id="table">
		<div class="top">
			<span class="title tit1">번호</span>
			<span class="title tit2">풋살장 사진</span>
			<span class="title tit3">풋살장명</span>
			<span class="title tit4">전화번호</span>
			<span class="title tit5">지역</span>
		</div>
		<c:forEach var="fors" items="${list}">
		<div class="row" onclick="javascript:openStaDetail('${fors.st_num}')">
			<span class="cell col1">${fors.st_num}</span>
			<span class="cell col2"><img alt="" src="resources/staImg/${fors.st_path1}"></span>
			<span class="cell col3">${fors.st_name}</span>
			<span class="cell col4">${fors.st_phone}</span>
			<span class="cell col5">${fors.st_area}</span>			
			</div>
		</c:forEach>
	</div>
</body>
</html>