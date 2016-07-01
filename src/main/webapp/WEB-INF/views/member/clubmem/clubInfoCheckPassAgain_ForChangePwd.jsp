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
<title>MemberJoinForm</title>
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

		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div id="changeClubPassword">
				<form action="http://localhost/www/changeClubPwdFormT"
					class="form-horizontal" name="checkPass" onsubmit="return check()"
					method="post">
					<fieldset>
						<legend class="club_checkPass">보안을 위해 비밀번호를 다시 한번 입력해주세요
						</legend>
						<div class="form-group">
							<label for="checkPass" class="col-lg-2 control-label">
								비밀번호</label>
							<div class="col-lg-7">
								<input type="password" name="club_pw" class="form-control"
									placeholder="기존의 비밀번호를 입력하세요" required="required">
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" align="right">
								<button type="reset" class="btn btn-warning">지우기</button>
								<button type="submit" class="btn btn-primary">확인</button>
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
		function check() {
			var pw2 = $
			{
				dto.club_pw
			}
			;
			var pw1 = checkPass.club_pw.value;
			if (pw1 != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				checkPass.club_pw.value = "";
				checkPass.club_pw.focus();
				return false;
			}//if

			return true;
		}//check
	</script>


</body>
</html>