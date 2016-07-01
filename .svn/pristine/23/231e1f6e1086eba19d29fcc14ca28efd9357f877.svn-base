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
	src="resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		//전역변수
		var obj = [];
		//스마트에디터 프레임생성
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : obj,
			elPlaceHolder : "editor",
			sSkinURI : "resource/editor/SmartEditor2Skin.html",
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
.btn-noticeAdd {
	background-color: hsl(40, 100%, 40%);
	width: 100px;
}

#noticeDetail1 {
	margin-top: 1.1%;
}

#noticeDetail2 {
	margin-left: -12%;
	margin-top: -1%;
}

#noticeDetail3 {
	margin-top: 0.5%;
	margin-left: -1.5%;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<form action="http://localhost/www/noticeModify" method="post" id="frm">
		<input type="hidden" value="${dto.bad_num}" name="bad_num" /> <label
			id="noticeDetail3" class="col-lg-2 control-label"> 제목</label>
		<div id="noticeDetail2" class="col-lg-3">
			<input class="form-control text-center" value="${dto.bad_title}"
				type="text" name="bad_title">
		</div>
		<textarea name="bad_content" id="editor" rows="10" cols="100"
			style="width: 766px; height: 412px;">${dto.bad_content}</textarea>
		<div align="right" style="margin-top: 2%;">
			<input type="button" class="btn btn-sm btn-noticeAdd" id="savebutton"
				value="수정" /> <input type="button" class="btn btn-sm btn-noticeAdd"
				value="목록보기"
				onclick="location.href='http://localhost/www/noticeListT'" />
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
		$.backstretch([ "http://localhost/www/resources/img/notice2.png",
				"http://localhost/www/resources/img/notice3.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>
</body>
</body>
</html>

