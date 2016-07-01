<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Login</title>

<!-- 여기부터 부트스트랩 CDN -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<!-- 여기까지 부트스트랩 CDN -->

<script src="resources/js/jquery-2.1.3.min.js"></script>
<!-- data-vide-bg 관련 js파일 -->
<script src="resources/js/vide.min.js"></script>
<!-- data-vide-bg 관련 js파일 -->
<style type="text/css">
html, body {
	height: 100%;
} /* 배경 동영상 화면 100%채우는것 */
div.col-md-4 { /* 로그인박스 화면 중앙에 옴기기 */
	position: absolute;
	top: 50%;
	left: 50%;
	width: 300px;
	height: 200px;
	margin-top: -150px;
	margin-left: -150px;
}
</style>
</head>
<body data-vide-bg="resources/video/stream">

	<div class="col-md-4">
		<div class="login-panel panel panel-default">
			<div class="panel-heading">
				<h1 class="panel-title">
					로그인
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="JoinButton" name="LinkJoinForm"
						value="회원가입" align="right" class="btn btn-sm btn-success"
						onclick="location.href='http://localhost/www/template?page=/selectJoinForm'">
				</h1>

			</div>
			<div class="panel-body">
				<form action="http://localhost/www/login" method="post">
					<fieldset>
						<div class="form-group">
							<input class="form-control" placeholder="아이디" name="mem_id"
								required="required" autofocus="autofocus" />
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="비밀번호" name="mem_pw"
								type="password" value="" required="required" />
						</div>
						<div class="radioCheck" align="center">
							<label> <!-- loginType은 클럽,회원 중에 무엇으로 로그인 하는지 알려주는 name입니다. -->
								<input name="loginType" type="radio" value="club" />클럽 <input
								name="loginType" type="radio" value="member" / checked>회원
							</label>
						</div>
						<div align="center">
							<button type="submit" class="btn btn-sm btn-success">로그인</button>
							<button type="reset" class="btn btn-sm btn-success">취소</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>


</body>
</html>