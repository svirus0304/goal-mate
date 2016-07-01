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

<style type="text/css">
.options {
	color: rgba(0, 0, 0, 0.3)
}
</style>

</head>
<body>

	<div class="container">

		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div id="changeClubInfo">
				<form action="http://localhost/www/changeClubInfo"
					class="form-horizontal" name="checkNullInfo"
					onsubmit="return check()" method="post">
					<fieldset>
						<legend class="club_ChangeInfo">변경하실 정보를 입력해주세요 </legend>
						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 이름</label>
							<div class="col-lg-7">
								<input type="text" name="club_name" value="${dto.club_name}"
									class="form-control" required="required">
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
							<label for="inputClubArea" class="col-lg-2 control-label">
								지역</label>
							<div class="col-lg-7"">
								<select name="club_area" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_area" value="">대구의
										구를 선택해주세요</option>
									<c:choose>
										<c:when test="${dto.club_area.equals('중구')}">
											<option class="options" name="club_area" value="중구"
												selected="selected">중구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="중구">중구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('동구')}">
											<option class="options" name="club_area" value="동구"
												selected="selected">동구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="동구">동구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('서구')}">
											<option class="options" name="club_area" value="서구"
												selected="selected">서구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="서구">서구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('남구')}">
											<option class="options" name="club_area" value="남구"
												selected="selected">남구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="남구">남구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('달서구')}">
											<option class="options" name="club_area" value="달서구"
												selected="selected">달서구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="달서구">달서구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('달성군')}">
											<option class="options" name="club_area" value="달성군"
												selected="selected">달성군</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="달성군">달성군</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('북구')}">
											<option class="options" name="club_area" value="북구"
												selected="selected">북구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="북구">북구</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_area.equals('수성구')}">
											<option class="options" name="club_area" value="수성구"
												selected="selected">수성구</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_area" value="수성구">수성구</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubAge" class="col-lg-2 control-label">
								연령대</label>
							<div class="col-lg-7"">
								<select name="club_age" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_age" value="">나이를
										선택해주세요</option>

									<c:choose>
										<c:when test="${dto.club_age.equals('10대')}">
											<option class="options" name="club_age" value="10대"
												selected="selected">10대</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_age" value="10대">10대</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_age.equals('20대')}">
											<option class="options" name="club_age" value="20대"
												selected="selected">20대</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_age" value="20대">20대</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_age.equals('30대')}">
											<option class="options" name="club_age" value="30대"
												selected="selected">30대</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_age" value="30대">30대</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_age.equals('40대')}">
											<option class="options" name="club_age" value="40대"
												selected="selected">40대</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_age" value="40대">40대</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_age.equals('50대 이상')}">
											<option class="options" name="club_age" value="50대 이상"
												selected="selected">50대 이상</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_age" value="50대 이상">50대
												이상</option>
										</c:otherwise>
									</c:choose>

								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="inputClubType" class="col-lg-2 control-label">
								클럽유형</label>
							<div class="col-lg-7"">
								<select name="club_type" style="color: white"
									class="input-large form-control" required="required">
									<option class="options" name="club_type" value="">클럽
										유형을 선택해주세요</option>

									<c:choose>
										<c:when test="${dto.club_type.equals('청소년')}">
											<option class="options" name="club_type" value="청소년"
												selected="selected">청소년</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_type" value="청소년">청소년</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_type.equals('대학생')}">
											<option class="options" name="club_type" value="대학생"
												selected="selected">대학생</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_type" value="대학생">대학생</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_type.equals('직장인')}">
											<option class="options" name="club_type" value="직장인"
												selected="selected">직장인</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_type" value="직장인">직장인</option>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${dto.club_type.equals('동아리')}">
											<option class="options" name="club_type" value="동아리"
												selected="selected">동아리</option>
										</c:when>
										<c:otherwise>
											<option class="options" name="club_type" value="동아리">동아리</option>
										</c:otherwise>
									</c:choose>

								</select>
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
			var pw1 = checkPass.club_pw.value;
			var pw2 = checkPass.club_pw2.value;
			if (pw1 != pw2) {
				alert("비밀번호가 일치하지 않습니다.");
				checkPass.club_pw.value = "";
				checkPass.club_pw2.value = "";
				checkPass.club_pw.focus();
				/* forms.mem_pw.value = "";
				forms.mem_pw2.value = "";
				forms.mem_pw.focus(); */
				return false;
			}//if

			/* 		 if(joinform.member_jumin1.value.length<6){
			 alert("주민등록번호 앞의 6자리를 입력해 주세요.");
			 joinform.member_jumin1.focus();
			 return false;
			 } */
			return true;
		}//check

		function openConfirmName(forms) {
			if (forms.club_name.value.length == 0) {
				alert("클럽이름을 입력하세요");
				forms.club_name.focus();
				return false;
			}//if

			var leftpos = (screen.availWidth / 2) - 250;
			leftpos += window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
			var toppos = (screen.availHeight / 2) - 150;
			var club_name = checkNullInfo.club_name.value;
			var url = "http://localhost/www/clubChangeInfoNameCheck?club_name="
					+ club_name;
			window.open(url, "confirm", "width=500,height=300," + "top="
					+ toppos + ",left=" + leftpos);
		}
	</script>


</body>
</html>