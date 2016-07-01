<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
<title>Notice Detail</title>
<link href='http://fonts.googleapis.com/css?family=EB+Garamond'
	rel='stylesheet' type='text/css' />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
	rel='stylesheet' type='text/css' />
<!-- ============ Add custom CSS here ============ -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<link href="resources/css/font-awesome.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="resource/editorFree/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "editor",
			sSkinURI : "resource/editorFree/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});
		//전송버튼
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			//폼 submit
			$("#frm").submit();
		})
	})
</script>

<style type="text/css">
.btn-findClubAdd {
	background-color: hsl(204, 100%, 45%);
	width: 100px;
}

#findClubDetail1 {
	margin-top: 1.1%;
}

#findClubDetail2 {
	margin-left: -14%;
	margin-top: -1%;
}

#findClubDetail3 {
	margin-top: 0.5%;
	margin-left: -1.5%;
	margin-right: 2%;
}

.options {
	color: rgba(0, 0, 0, 0.3);
}
</style>

<title>Insert title here</title>
</head>
<body>

	<form action="http://localhost/www/findClubWrite" method="post"
		id="frm">

		<label id="findClubDetail3" class="col-lg-2 control-label"> 제목</label>
		<div id="findClubDetail2" class="col-lg-3">
			<input class="form-control text-center" type="text" name="bcl_title">
		</div>
		<br>
		<br> <label id="findClubDetail3" class="col-lg-2 control-label">
			이름</label>
		<div id="findClubDetail2" class="col-lg-3">
			<input class="form-control text-center" type="text" name="bcl_name">
		</div>

		<label style="margin-top: 0.5%; margin-left: -1.5%; margin-right: 5%;"
			class="col-lg-2 control-label"> 활동지역</label>
		<div id="findClubDetail2" class="col-lg-3">
			<select name="bcl_area" style="color: white;"
				class="input-large form-control" required="required">
				<option class="options" name="bcl_area" value="" selected="selected">대구의
					구를 선택해주세요</option>
				<option class="options" name="bcl_area" value="중구">중구</option>
				<option class="options" name="bcl_area" value="동구">동구</option>
				<option class="options" name="bcl_area" value="서구">서구</option>
				<option class="options" name="bcl_area" value="남구">남구</option>
				<option class="options" name="bcl_area" value="달서구">달서구</option>
				<option class="options" name="bcl_area" value="달성군">달성군</option>
				<option class="options" name="bcl_area" value="북구">북구</option>
				<option class="options" name="bcl_area" value="수성구">수성구</option>
			</select>
		</div>

		<label id="findClubDetail3" class="col-lg-2 control-label"> 나이</label>
		<div id="findClubDetail2" class="col-lg-3">
			<select name="bcl_age" style="color: white"
				class="input-large form-control" required="required">
				<option class="options" name="bcl_age" value="" selected="selected">나이를
					선택해주세요</option>
				<option class="options" name="bcl_age" value="10대">10대</option>
				<option class="options" name="bcl_age" value="20대">20대</option>
				<option class="options" name="bcl_age" value="30대">30대</option>
				<option class="options" name="bcl_age" value="40대">40대</option>
				<option class="options" name="bcl_age" value="50대">50대 이상</option>
			</select>
		</div>



		<textarea name="bcl_content" id="editor" rows="10" cols="100"
			style="width: 766px; height: 412px;"></textarea>
		<div align="right" style="margin-top: 2%;">
			<input type="button" class="btn btn-sm btn-findClubAdd"
				id="savebutton" value="등록" /> <input type="button"
				class="btn btn-sm btn-findClubAdd" value="목록보기"
				onclick="location.href='http://localhost/www/findClubListT'" />
		</div>
	</form>




	<script src="resources/js/jquery.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.backstretch.js" type="text/javascript"></script>

	<script type="text/javascript">
		'use strict';

		/* ========================== */
		/* ::::::: Backstrech ::::::: */
		/* ========================== */
		// You may also attach Backstretch to a block-level element
		$.backstretch([ "http://localhost/www/resources/img/findClub1.jpg",
				"http://localhost/www/resources/img/findClub2.jpg",
				"http://localhost/www/resources/img/findClub3.jpg",
				"http://localhost/www/resources/img/findClub4.jpg",
				"http://localhost/www/resources/img/findClub5.jpg",
				"http://localhost/www/resources/img/findClub6.jpg",
				"http://localhost/www/resources/img/findClub7.jpg",
				"http://localhost/www/resources/img/findClub8.jpg",
				"http://localhost/www/resources/img/findClub9.jpg",
				"http://localhost/www/resources/img/findClub10.jpg",
				"http://localhost/www/resources/img/findClub11.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>
</body>


</html>

