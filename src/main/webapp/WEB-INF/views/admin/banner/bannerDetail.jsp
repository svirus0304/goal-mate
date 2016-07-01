<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>bannerDetail.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
.mainDiv{width:500px;height:450px;margin:auto;}
.mainDiv table{width:100%;}
/* .bannerInfo */
.mainDiv .bannerInfo{margin-top: 30px;}
.mainDiv .bannerInfo .index{width:20%;padding:10px;font-weight: bold;text-align:right;background-color: lightgray;}
.mainDiv .bannerInfo .bannerImg{text-align: right;}
.mainDiv .bannerInfo .items{background-color: white;padding-left:10px;}
.textarea{vertical-align: top;}
textarea{padding: 20px; margin-top:15px;resize:none;}
.mainDiv .btnsDiv{margin-top: 20px;}
.mainDiv .btnsDiv button{font-size: 15px;height:40px}
#bann_path{display: none;}
</style>
</head>
<body>
<div class="mainDiv">
<h2></h2>
<table class="bannerInfo">
	<tr>
		<td class="index bannerImg">이미지</td>
		<td class="items"><img src="http://localhost/www/resources/img/bannerImg/${dto.bann_path }" width=400 height=100></td>
	</tr>
	<tr>
		<td class="index">번호</td>
		<td class="items">${dto.bann_num }</td>
	</tr>
	<tr>
		<td class="index">등록일</td>
		<td class="items">${dto.bann_join }</td>
	</tr>
	<tr>
		<td class="index">제목</td>
		<td class="items">${dto.bann_title }</td>
	</tr>
	<tr>
		<td class="index textarea">내용</td>
		<td class="items">
			<textarea rows="5" cols="50" readonly="readonly" >${dto.bann_content }</textarea>
		</td>
	</tr>
</table>
<div class="btnsDiv" align="center">
	<button onclick="location.href='bannerModifyForm?bann_num=${dto.bann_num}'">수정하기</button>
	<button onclick="location.href='bannerDel?bann_num=${dto.bann_num}'">삭제</button>
	<button onclick="opener.location.href='adminMain?page=/bannerList';self.close();">닫기</button>
</div>
</div>
</body>
</html>