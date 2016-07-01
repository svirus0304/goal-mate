<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
.clsBannerScreen {overflow: hidden;position: relative;height: 150px;width: 600px; border:1px solid #e1e1e1; cursor:pointer; clear:both;}
.clsBannerScreen .images {position:absolute; display:none; }
ul, li {list-style:none; margin:0; padding:0; font-size:10pt; }
.clsBannerButton {width:600px;cursor:pointer;border-bottom:1px solid #e1e1e1;}
.clsBannerButton li {width:100px;float:left;border-right:1px solid #e1e1e1;padding:2px;}
.clsBannerButton li.fir {border-left:1px solid #e1e1e1;}

.clsBannerButton li.labelOverClass {font-weight:bold;}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/banner/jquery.banner.js"></script>
<script type="text/javascript">
$(function() {
	$("#image_list_1").jQBanner({	//롤링을 할 영역의 ID 값
		nWidth:600,					//영역의 width
		nHeight:150,				//영역의 height
		nCount:"${list.size()}",					//돌아갈 이미지 개수
		isActType:"left",				//움직일 방향 (left, right, up, down)
		nOrderNo:1,					//초기 이미지
		nDelay:2000					//롤링 시간 타임 (1000 = 1초)
		/*isBtnType:"li"*/			//라벨(버튼 타입) - 여기는 안쓰임
		}
	);
	
	/* $("#image_list_2").jQBanner({nWidth:600,nHeight:150,nCount:5,isActType:"left",nOrderNo:1,isStartAct:"N",isStartDelay:"Y",nDelay:2000,isBtnType:"li"}); */
	$("#image_list_3").jQBanner({
		nWidth:600,
		nHeight:150,
		nCount:"${list.size()}",
		isActType:"left",
		nOrderNo:1,
		isStartAct:"N",
		isStartDelay:"Y",
		nDelay:2000,
		isBtnType:"img"});
});
</script>

</head>
<body>
<!-- <div id="image_list_1">
<div class="clsBannerScreen">
	<div class="images" style="display:block"><img src="img/google.jpg" /></div>
	<div class="images"><img src="img/daum.jpg" /></div>
	<div class="images"><img src="img/naver.jpg" /></div>
	<div class="images"><img src="img/nate.jpg" /></div>
	<div class="images"><img src="img/yahoo.jpg" /></div>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>

<div id="image_list_2">
<div class="clsBannerScreen">
	<div class="images" style="display:block"><img src="img/google.jpg" /></div>
	<div class="images"><img src="img/daum.jpg" /></div>
	<div class="images"><img src="img/naver.jpg" /></div>
	<div class="images"><img src="img/nate.jpg" /></div>
	<div class="images"><img src="img/yahoo.jpg" /></div>
</div>

<ul class="clsBannerButton" id="label_2">
	<li class="fir" overclass="labelOverClass" outclass="fir">구글<br />(google.co.kr)</li>
	<li overclass="labelOverClass" outclass="">다음<br />(daum.net)</li>
	<li overclass="labelOverClass" outclass="">네이버<br />(naver.com)</li>
	<li overclass="labelOverClass" outclass="">네이트<br />(nate.com)</li>
	<li overclass="labelOverClass" outclass="">야후<br />(kr.yahoo.com)</li>
</ul>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
 -->

<div id="image_list_3">

<div class="clsBannerScreen">
	<c:forEach var="fors" items="${list }">
		<div class="images"><img src="http://localhost/www/resources/img/bannerImg/${fors.bann_path }" /></div>
	</c:forEach>
</div>
<ul class="clsBannerButton" id="label_3">
	<c:forEach var="fors" items="${list }" varStatus="status">
		<li><img src="resources/banner/img/${status.count }_on.jpg" oversrc="resources/banner/img/${status.count }_on.jpg" outsrc="resources/banner/img/${status.count }.jpg" /></li>
	</c:forEach>
</ul>
</div>
</body>
</html>