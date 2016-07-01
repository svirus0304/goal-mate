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
<meta charset="utf-8">
<!-- Set the viewport width to device width for mobile -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
<title>Bootstrap Templates</title>
<!-- ============ Google fonts ============ -->
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

<style type="text/css">
.options {
	color: rgba(0, 0, 0, 0.3)
}
</style>
</head>
<body>

	<div class="container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
			<div id="banners">
				<h1>
					환영합니다 클럽을 생성하여 멋진 인연을 만들어 보세요<strong><p>최고의 클럽</strong>은 여러분의
					것입니다.
				</h1>

				<h5>
					<strong>GoalMate</strong>
				</h5>
			</div>

		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="registrationforms">
				<form class="form-horizontal" name="joinform"
					action="http://localhost/www/clubJoin"
					enctype="multipart/form-data" onsubmit="return check()"
					method="post">
					<fieldset>
						<legend>
							클럽계정 생성 <i class="fa fa-pencil pull-right"></i>
						</legend>
						<div class="form-group">
							<label for="inputClubId" class="col-lg-2 control-label">
								아이디</label>
							<div class="col-lg-7">
								<input type="text" name="club_id" class="form-control"
									id="inputClubId" placeholder="10글자까지 써주세요" required="required">
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
							<label for="inputClubPw" class="col-lg-2 control-label">
								비밀번호</label>
							<div class="col-lg-10">
								<input type="password" name="club_pw" class="form-control"
									id="inputClubPw" placeholder="영문,숫자,특문 포함 20자까지 써주세요"
									required="required">
								<!--                             <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    Checkbox
                                </label>
                            </div> -->
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubPw2" class="col-lg-2 control-label">
								비밀번호 확인</label>
							<div class="col-lg-10">
								<input type="password" name="club_pw2" class="form-control"
									id="inputClubPw2" placeholder="위에 적었던 비밀번호와 똑같이 적어주세요 "
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubName" class="col-lg-2 control-label">
								클럽 이름</label>
							<div class="col-lg-7">
								<input type="text" name="club_name" class="form-control"
									id="inputClubName" placeholder="20글자까지 써주세요 "
									required="required">
							</div>
							<div class="col-xs-2 col-sm-2 col-md-2">
								<div class="form-group">
									<input type="button" value="중복확인"
										class="btn btn-info btn-block" name="confirm_id" value="중복확인"
										onclick="openConfirmName(this.form)">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubPath" class="col-lg-2 control-label">
								클럽 엠블렘</label>
							<div class="col-lg-7">
								<input type="file" name="file1" class="btn btn-primary"
									id="fileUpload" placeholder="등록 하실 엠블렘을 선택하여 주세요">
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubArea" class="col-lg-2 control-label">
								지역</label>
							<div class="col-lg-7">
								<select name="club_area" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_area" value=""
										selected="selected">대구의 구를 선택해주세요</option>
									<option class="options" name="club_area" value="중구">중구</option>
									<option class="options" name="club_area" value="동구">동구</option>
									<option class="options" name="club_area" value="서구">서구</option>
									<option class="options" name="club_area" value="남구">남구</option>
									<option class="options" name="club_area" value="달서구">달서구</option>
									<option class="options" name="club_area" value="달성군">달성군</option>
									<option class="options" name="club_area" value="북구">북구</option>
									<option class="options" name="club_area" value="수성구">수성구</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubAge" class="col-lg-2 control-label">
								연령대</label>
							<div class="col-lg-7"">
								<select name="club_age" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_age" value=""
										selected="selected">나이를 선택해주세요</option>
									<option class="options" name="club_age" value="10대">10대</option>
									<option class="options" name="club_age" value="20대">20대</option>
									<option class="options" name="club_age" value="30대">30대</option>
									<option class="options" name="club_age" value="40대">40대</option>
									<option class="options" name="club_age" value="50대">50대
										이상</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubType" class="col-lg-2 control-label">
								클럽유형</label>
							<div class="col-lg-7"">
								<select name="club_type" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_type" value=""
										selected="selected">클럽 유형을 선택해주세요</option>
									<option class="options" name="club_type" value="청소년">청소년</option>
									<option class="options" name="club_type" value="대학생">대학생</option>
									<option class="options" name="club_type" value="직장인">직장인</option>
									<option class="options" name="club_type" value="동아리">동아리</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubPhone" class="col-lg-2 control-label">
								클럽대표 번호</label>
							<div class="col-lg-10">
								<input type="number" name="club_phone" placeholder="숫자만 입력해주세요"
									autocomplete="on" class="form-control" id="inputClubPhone"
									required="required">
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubKaKao" class="col-lg-2 control-label">
								카톡 ID</label>
							<div class="col-lg-10">
								<input type="text" name="club_kakao"
									placeholder="연락가능한 카톡아이디(입력 안하셔도 가입됩니다)" class="form-control"
									id="inputClubKaKao">
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
	<script src="resources/js/fileUpload.js" type="text/javascript"></script>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

	<script type="text/javascript">
		function check() {
			var forms = document.getElementById("joinform"); //밑에 있는 폼의 이름
			var pw1 = joinform.club_pw.value;
			var pw2 = joinform.club_pw2.value;
			if (pw1 != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				joinform.club_pw.value = "";
				joinform.club_pw2.value = "";
				joinform.club_pw.focus();
				/* forms.mem_pw.value = "";
				forms.mem_pw2.value = "";
				forms.mem_pw.focus(); */
				return false;
			}//if
			if (pw1.length<2||pw1.length>4) {
				alert("비밀번호는 2 ~ 4 자리로 만들어야 합니다.");
				joinform.club_pw.value = "";
				joinform.club_pw2.value = "";
				joinform.club_pw.focus();
				return false;
			}//if

			if (joinform.file1.value.length > 30) {
				alert("엠블렘 이미지 이름이 너무 길어서 업로드를 할 수 없습니다. 다시 부탁드립니다.");
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
			if (forms.club_id.value.length == 0) {
				alert("클럽 아이디를 입력하세요");
				forms.club_id.focus();
				return false;
			}//if

			var leftpos = (screen.availWidth / 2) - 200;
			leftpos += window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
			var toppos = (screen.availHeight / 2) - 100;

			var club_id = joinform.club_id.value;
			var url = "http://localhost/www/clubJoinIdCheck?club_id=" + club_id;
			window.open(url, "중복확인", "width=400,height=200," + "top=" + toppos
					+ ",left=" + leftpos);
		}

		function openConfirmName(forms) {
			if (forms.club_name.value.length == 0) {
				alert("클럽이름을 입력하세요");
				forms.club_name.focus();
				return false;
			}//if

			var leftpos = (screen.availWidth / 2) - 200;
			leftpos += window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
			var toppos = (screen.availHeight / 2) - 100;

			var club_name = joinform.club_name.value;
			var url = "http://localhost/www/clubJoinNameCheck?club_name="
					+ club_name;
			window.open(url, "중복확인", "width=400,height=200," + "top=" + toppos
					+ ",left=" + leftpos);
		}
	</script>
</body>
</html>
