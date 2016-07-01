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
<title>ClubMemberAdd_Single</title>
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

	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<form name="clubMemberModifyForm"
			action="http://localhost/www/clubMemberModify" method="post">
			<div class="clubMemberModifyForm">
				<legend>
					클럽 멤버 수정
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="멤버 수정" class="btn btn-sm btn-primary"
						onclick="submitAndWindowClose()">
				</legend>


				<input type="hidden" value="${dto.pl_num}" name=pl_num>
				<table class="form-group" border="1" width="770px" align="center">
					<tr>
						<td align="center" width="20%">이름</td>
						<td align="center" width="15%">포지션</td>
						<td align="center" width="10%">키</td>
						<td align="center" width="10%">몸무게</td>
						<td align="center" width="15%">개인기</td>
						<td align="center" width="15%">스피드</td>
					</tr>
					<tr>
						<td align="center" width="20%" class="name">
							<div class="form-group">
								<div class="col-lg-2">
									<input type="text" value="${dto.pl_name}" name="pl_name"
										class="form-control" placeholder="10글자까지 쓰세요"
										required="required">
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="position">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_position" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_position" value="">포지션
											선택</option>

										<c:choose>
											<c:when test="${dto.pl_position.equals('PIVO')}">
												<option class="options" name="pl_position" value="PIVO"
													selected="selected">PIVO</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_position" value="PIVO">PIVO</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_position.equals('ALA')}">
												<option class="options" name="pl_position" value="ALA"
													selected="selected">ALA</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_position" value="ALA">ALA</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_position.equals('FIXO')}">
												<option class="options" name="pl_position" value="FIXO"
													selected="selected">FIXO</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_position" value="FIXO">FIXO</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_position.equals('GOLEIRO')}">
												<option class="options" name="pl_position" value="GOLEIRO"
													selected="selected">GOLEIRO</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_position" value="GOLEIRO">GOLEIRO</option>
											</c:otherwise>
										</c:choose>

									</select>
								</div>
							</div>
						</td>

						<td align="center" width="10%" class="increase">
							<div class="form-group">
								<div class="col-lg-3">
									<input type="number" value="${dto.pl_increase}"
										name="pl_increase" class="form-control" min=1
										required="required">
								</div>
							</div>
						</td>

						<td align="center" width="10%" class="weight">
							<div class="form-group">
								<div class="col-lg-3">
									<input type="number" value="${dto.pl_weight}" name="pl_weight"
										class="form-control" min=1 required="required">
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="dribble">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_dribble" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_dribble" value="">점수선택</option>


										<c:choose>
											<c:when test="${dto.pl_dribble==1}">
												<option class="options" name="pl_dribble" value="1"
													selected="selected">1</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_dribble" value="1">1</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_dribble==2}">
												<option class="options" name="pl_dribble" value="2"
													selected="selected">2</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_dribble" value="2">2</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_dribble==3}">
												<option class="options" name="pl_dribble" value="3"
													selected="selected">3</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_dribble" value="3">3</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_dribble==4}">
												<option class="options" name="pl_dribble" value="4"
													selected="selected">4</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_dribble" value="4">4</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_dribble==5}">
												<option class="options" name="pl_dribble" value="5"
													selected="selected">5</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_dribble" value="5">5</option>
											</c:otherwise>
										</c:choose>

									</select>
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="speed">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_speed" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_speed" value="">점수선택</option>

										<c:choose>
											<c:when test="${dto.pl_speed==1}">
												<option class="options" name="pl_speed" value="1"
													selected="selected">1</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_speed" value="1">1</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_speed==2}">
												<option class="options" name="pl_speed" value="2"
													selected="selected">2</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_speed" value="2">2</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_speed==3}">
												<option class="options" name="pl_speed" value="3"
													selected="selected">3</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_speed" value="3">3</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_speed==4}">
												<option class="options" name="pl_speed" value="4"
													selected="selected">4</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_speed" value="4">4</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${dto.pl_speed==5}">
												<option class="options" name="pl_speed" value="5"
													selected="selected">5</option>
											</c:when>
											<c:otherwise>
												<option class="options" name="pl_speed" value="5">5</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
							</div>
						</td>

					</tr>
				</table>
		</form>
	</div>





	<script src="resources/js/jquery.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.backstretch.js" type="text/javascript"></script>
	<script src="resources/js/fileUpload4.js" type="text/javascript"></script>
	<script type="text/javascript">
		'use strict';

		/* ========================== */
		/* ::::::: Backstrech ::::::: */
		/* ========================== */
		// You may also attach Backstretch to a block-level element
		$.backstretch([ "http://localhost/www/resources/img/1.jpg",
				"http://localhost/www/resources/img/2.jpg",
				"http://localhost/www/resources/img/3.jpg",
				"http://localhost/www/resources/img/4.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>

	<script type="text/javascript">
		function submitAndWindowClose() {
			var flag = clubMemberModifyForm.checkValidity();
			if (flag == false) {
				if (clubMemberModifyForm.pl_name.value.length == 0) {
					alert("이름을 입력하지 않으셨습니다.");
					if (clubMemberModifyForm.pl_position.value.length == 0) {
						alert("포지션을 선택하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_increase.value.length == 0) {
						alert("키를 입력하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberModifyForm.pl_name.focus();
				} else if (clubMemberModifyForm.pl_position.value.length == 0) {
					alert("포지션을 선택하지 않으셨습니다.");
					if (clubMemberModifyForm.pl_increase.value.length == 0) {
						alert("키를 입력하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberModifyForm.pl_position.focus();
				} else if (clubMemberModifyForm.pl_increase.value.length == 0) {
					alert("키를 입력하지 않으셨습니다.");
					if (clubMemberModifyForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberModifyForm.pl_increase.focus();
				} else if (clubMemberModifyForm.pl_weight.value.length == 0) {
					alert("몸무게를 입력하지 않으셨습니다.");
					if (clubMemberModifyForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberModifyForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberModifyForm.pl_weight.focus();
				} else if (clubMemberModifyForm.pl_dribble.value.length == 0) {
					alert("개인기 점수를 선택하지 않으셨습니다.");
					if (clubMemberModifyForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberModifyForm.pl_dribble.focus();
				} else if (clubMemberModifyForm.pl_speed.value.length == 0) {
					alert("스피드 점수를 선택하지 않으셨습니다.");
					clubMemberModifyForm.pl_speed.focus();
				}//else if
			} else if (flag == true) {
				self.close();
				clubMemberModifyForm.submit();
				opener.location.href = "http://localhost/www/template?page=/clubInfo";
			}

		}
	</script>


</body>
</html>