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
/* .bannerImg */
.mainDiv .bannerImg img{cursor: pointer;border:1px solid black;}
/* .bannerInfo */
.mainDiv .bannerInfo{margin-top: 30px;}
.mainDiv .bannerInfo .index{width:20%;padding:10px;font-weight: bold;background-color: lightgray;text-align: right;}
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
<form action="bannerImgModify" enctype="multipart/form-data" method="post" id="bannerImgModify">
	<input type="file" id="bann_path" name="bann_path" onchange="document.getElementById('bannerImgModify').submit();"><!-- display:hidden; -->
	<input type="hidden" name="path" value="bannerImg"><!-- 파일업로드경로 -->
	<input type="hidden" name="bann_num" value="${dto.bann_num }">
</form>
<form action="bannerModify" method="post" id="bannerModify">
<input type="hidden" name="bann_num" value="${dto.bann_num }">
<table class="bannerInfo">
	<tr>
		<td class="index">이미지</td>
		<td class="items bannerImg"><img src="http://localhost/www/resources/img/bannerImg/${dto.bann_path }" width=400 height=100 onclick="document.getElementById('bann_path').click();"></td>
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
		<td class="items"><input type="text" name="bann_title" value="${dto.bann_title }" maxlength="5"></td>
	</tr>
	<tr>
		<td class="index textarea">내용</td>
		<td class="items">
			<textarea rows="5" cols="50" name="bann_content" maxlength="30">${dto.bann_content }</textarea>
		</td>
	</tr>
</table>
</form>
<div class="btnsDiv" align="center">
	<button onclick="document.getElementById('bannerModify').submit();">수정완료</button>
	<button onclick="location.href='bannerDel?bann_num=${dto.bann_num}'">삭제</button>
	<button onclick="opener.location.href='adminMain?page=/bannerList';self.close();">닫기</button>
</div>
</div>
</body>
</html>