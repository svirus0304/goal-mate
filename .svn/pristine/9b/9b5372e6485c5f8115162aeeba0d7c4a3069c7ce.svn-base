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
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
			<div id="banner">
				<h1>
					환영합니다 계정을 생성하여 <br>멋진 인연을 만들어 보세요<strong><p>최고의
							메이트는</strong> 여러분입니다
				</h1>

				<h5>
					<strong>GoalMate</strong>
				</h5>
			</div>

		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="registrationform">
				<form action="http://localhost/www/memJoin" class="form-horizontal"
					name="joinform" enctype="multipart/form-data"
					onsubmit="return check()" method="post">
					<fieldset>
						<legend>
							회원계정 생성 <i class="fa fa-pencil pull-right"></i>
						</legend>
						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label"> 이름</label>
							<div class="col-lg-10">
								<input type="text" name="mem_name" class="form-control"
									id="inputName" placeholder="10글자까지만 써주세요" required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 아이디</label>
							<div class="col-lg-7">
								<input type="text" name="mem_id" class="form-control"
									id="inputId" placeholder="10글자까지만 써주세요" required="required">
							</div>
							<div class="col-xs-2 col-sm-2 col-md-2">
								<div class="form-group">
									<input type="button" value="중복확인"
										class="btn btn-info btn-block" name="confirm_id" value="중복확인"
										onclick="openConfirmId(this.form)">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword" class="col-lg-2 control-label">
								비밀번호</label>
							<div class="col-lg-10">
								<input type="password" name="mem_pw" class="form-control"
									id="inputPassword" placeholder="영문,숫자,특수문자를 섞어 20자까지 써주세요">
								<!-- <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    Checkbox
                                </label>
                            </div> -->
							</div>

						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-2 control-label">
								비밀번호 확인</label>
							<div class="col-lg-10">
								<input type="password" name="mem_pw2" class="form-control"
									id="inputPassword2" placeholder="위에 적었던 비밀번호와 똑같이 적어주세요">

							</div>
						</div>

						<div class="form-group">
							<label for="inputMemberPath" class="col-lg-2 control-label">
								회원 사진</label>
							<div class="col-lg-7">
								<input type="file" name="file2" class="btn btn-primary"
									id="fileUpload2" placeholder="등록 하실 사진을 등록해주세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2" align="right">
								<button type="reset" class="btn btn-warning">지우기</button>
								<button type="submit" class="btn btn-primary">생성</button>
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
	<script src="resources/js/fileUpload2.js" type="text/javascript"></script>
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
			var forms = document.getElementById("joinform"); //밑에 있는 폼의 이름
			var pw1 = joinform.mem_pw.value;
			var pw2 = joinform.mem_pw2.value;
			if (pw1 != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				joinform.mem_pw.value = "";
				joinform.mem_pw2.value = "";
				joinform.mem_pw.focus();
				/* forms.mem_pw.value = "";
				forms.mem_pw2.value = "";
				forms.mem_pw.focus(); */
				return false;
			}//if
			if (pw1.length<2||pw1.length>4) {
				alert("비밀번호는 2 ~ 4 자리로 만들어야 합니다.");
				joinform.mem_pw.value = "";
				joinform.mem_pw2.value = "";
				joinform.mem_pw.focus();
				return false;
			}//if

			if (joinform.file2.value.length > 30) {
				alert("회원 사진 이름이 너무 길어서 업로드를 할 수 없습니다. 다시 부탁드립니다.");
				return false;
			}//if

			/* 		 if(joinform.member_jumin1.value.length<6){
			 alert("주민등록번호 앞의 6자리를 입력해 주세요.");
			 joinform.member_jumin1.focus();
			 return false;
			 } */
			return true;
		}//check

		function openConfirmId(forms) {
			if (forms.mem_id.value.length == 0) {
				alert("아이디를 입력하세요");
				forms.mem_id.focus();
				return false;
			}//if

			var leftpos = (screen.availWidth / 2) - 200;
			leftpos += window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
			var toppos = (screen.availHeight / 2) - 100;

			var mem_id = joinform.mem_id.value;
			var url = "http://localhost/www/memberJoinIdCheck?mem_id=" + mem_id;
			window.open(url, "중복확인", "width=400,height=200," + "top=" + toppos
					+ ",left=" + leftpos);
		}//openConfirmId()
	</script>
</body>
</html>