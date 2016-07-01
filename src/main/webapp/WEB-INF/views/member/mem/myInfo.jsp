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
<title>MyInfo</title>
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


</head>
<body>
	<div class="container">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center">
			<div id="bringMemberPic">
				<img style="width: 250px; height: 200px;"
					src="http://localhost/www/resources/img/mem/${dto.mem_path}">
				<p>
				<p>
				<form name="changePic" action="http://localhost/www/myInfoPicCh"
					enctype="multipart/form-data" method="post"
					onsubmit="return checkNullPic()">
					<div class="col-lg-7">
						<input type="file" name="file3" id="fileUpload3"
							class="btn btn-sm btn-success" />
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="submit" value="변경" class="btn btn-sm btn-success" /> <input
						type="hidden" value="${dto.mem_path}" name="mem_path" /> <input
						type="hidden" value="${dto.mem_id}" name="mem_id" />

				</form>
			</div>

		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="bringMemberInfo">
				<form action="http://localhost/www/memJoin" class="form-horizontal"
					name="joinform" onsubmit="return check()" method="post">
					<fieldset>
						<legend>${dto.mem_id}님의 회원정보 </legend>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label"> 이름</label>
							<div class="col-lg-7">
								<input type="text" value="${dto.mem_name}" name="mem_name"
									class="form-control" id="inputName" readonly="readonly"
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 용병정보</label>
							<div class="col-lg-7">
								<input type="text" name="mem_id" class="form-control"
									id="inputId" readonly="readonly" required="required">
							</div>
							<div class="col-xs-2 col-sm-2 col-md-2">
								<div class="form-group">
									<input type="button" value="목록보기"
										class="btn btn-sm btn-success" name="confirm_id"
										onclick="openConfirmId(this.form)">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label">
								가입일</label>
							<div class="col-lg-7">
								<input type="text" value="${dto.mem_date}" name="mem_name"
									class="form-control" id="inputName" readonly="readonly"
									required="required">
							</div>
							<div class="col-xs-2 col-sm-2 col-md-2">
								<div class="form-group">
									<input type="button" value="비밀번호 변경"
										class="btn btn-sm btn-success" name="confirm_id"
										onclick="location.href='http://localhost/www/template?page=/myInfoCheckPassAgain_ForChangePwd'">
								</div>
							</div>
						</div>


					</fieldset>
				</form>
			</div>



		</div>
	</div>
	<script src="resources/js/jquery.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.backstretch.js" type="text/javascript"></script>
	<script src="resources/js/fileUpload3.js" type="text/javascript"></script>
	<script type="text/javascript">
		'use strict';

		/* ========================== */
		/* ::::::: Backstrech ::::::: */
		/* ========================== */
		// You may also attach Backstretch to a block-level element
		$.backstretch([ "http://localhost/www/resources/img/44.jpg",
				"http://localhost/www/resources/img/colorful.jpg",
				"http://localhost/www/resources/img/34.jpg",
				"http://localhost/www/resources/img/images.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>

	<script type="text/javascript">
		function checkNullPic() {
			if (changePic.file3.value.length > 30) {
				alert("사진 이름이 너무 길어서 업로드를 할 수 없습니다. 다시 부탁드립니다.");
				return false;
			}

			if (changePic.file3.value.length == 0) {
				alert("사진을 선택하지 않으셨습니다. 사진을 선택해 주세요");
				return false;
			}//if
			return true;
		}
	</script>


</body>
</html>