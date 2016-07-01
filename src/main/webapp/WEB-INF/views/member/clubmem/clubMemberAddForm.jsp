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
		<form name="clubMemberAddForm"
			action="http://localhost/www/clubMemberAdd" method="post">
			<div class="clubMemberAddForm">
				<legend>
					클럽 멤버 추가
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<%-- <input type="button" value="칸 추가" class="btn btn-sm btn-primary" onclick="location.href='http://localhost/www/clubMemberAdd_tr?add=${clubMemberAdd_trValue+1}'"> --%>
					<input type="button" value="행 추가" class="btn btn-sm btn-primary"
						onclick="addRow()"> <input type="button" value="행 삭제"
						class="btn btn-sm btn-primary" onclick="delRow()"> <input
						type="button" value="멤버 추가" class="btn btn-sm btn-primary"
						onclick="submitAndWindowClose()">
				</legend>

				<table id="memberAdd" class="form-group" border="1" width="770px"
					align="center">
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
									<input type="text" name="pl_name" class="form-control"
										placeholder="10글자까지 쓰세요" required="required">
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="position">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_position" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_position" value=""
											selected="selected">포지션 선택</option>
										<option class="options" name="pl_position" value="PIVO">PIVO</option>
										<option class="options" name="pl_position" value="ALA">ALA</option>
										<option class="options" name="pl_position" value="FIXO">FIXO</option>
										<option class="options" name="pl_position" value="GOLEIRO">GOLEIRO</option>
									</select>
								</div>
							</div>
						</td>

						<td align="center" width="10%" class="increase">
							<div class="form-group">
								<div class="col-lg-3">
									<input type="number" name="pl_increase" class="form-control"
										min=1 required="required">
								</div>
							</div>
						</td>

						<td align="center" width="10%" class="weight">
							<div class="form-group">
								<div class="col-lg-3">
									<input type="number" name="pl_weight" class="form-control"
										min=1 required="required">
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="dribble">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_dribble" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_dribble" value=""
											selected="selected">점수선택</option>
										<option class="options" name="pl_dribble" value="1">1</option>
										<option class="options" name="pl_dribble" value="2">2</option>
										<option class="options" name="pl_dribble" value="3">3</option>
										<option class="options" name="pl_dribble" value="4">4</option>
										<option class="options" name="pl_dribble" value="5">5</option>
									</select>
								</div>
							</div>
						</td>

						<td align="center" width="15%" class="speed">
							<div class="form-group">
								<div class="col-lg-3"">
									<select name="pl_speed" style="color: white"
										class="input-large form-control" required="required">
										<option class="options" name="pl_speed" value=""
											selected="selected">점수선택</option>
										<option class="options" name="pl_speed" value="1">1</option>
										<option class="options" name="pl_speed" value="2">2</option>
										<option class="options" name="pl_speed" value="3">3</option>
										<option class="options" name="pl_speed" value="4">4</option>
										<option class="options" name="pl_speed" value="5">5</option>
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
		function addRow() {//줄 추가
			var memberAdd_table = document.getElementById("memberAdd");
			var newRow = memberAdd_table.insertRow();
			var newCell1 = newRow.insertCell();
			var newCell2 = newRow.insertCell();
			var newCell3 = newRow.insertCell();
			var newCell4 = newRow.insertCell();
			var newCell5 = newRow.insertCell();
			var newCell6 = newRow.insertCell();

			newCell1.className = "name";
			newCell2.className = "position";
			newCell3.className = "increase";
			newCell4.className = "weight";
			newCell5.className = "dribble";
			newCell6.className = "speed";

			newCell1.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-2'>"
					+ "<input type='text' name='pl_name' class='form-control' placeholder='10글자까지 쓰세요' required='required'>"
					+ "</div>" + "</div>";

			newCell2.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-3'>"
					+ "<select name='pl_position' style='color:white' class='input-large form-control' required='required'>"
					+ "<option class='options' name='pl_position' value='' selected='selected'>포지션 선택</option>"
					+ "<option class='options' name='pl_position' value='PIVO'>PIVO</option>"
					+ "<option class='options' name='pl_position' value='ALA'>ALA</option>"
					+ "<option class='options' name='pl_position' value='FIXO'>FIXO</option>"
					+ "<option class='options' name='pl_position' value='GOLEIRO'>GOLEIRO</option>"
					+ "</select>" + "</div>" + "</div>";

			newCell3.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-3'>"
					+ "<input type='number' name='pl_increase' class='form-control' min=1 required='required'>"
					+ "</div>" + "</div>";

			newCell4.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-3'>"
					+ "<input type='number' name='pl_weight' class='form-control' min=1 required='required'>"
					+ "</div>" + "</div>";

			newCell5.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-3'>"
					+ "<select name='pl_dribble' style='color:white' class='input-large form-control' required='required'>"
					+ "<option class='options' name='pl_dribble' value='' selected='selected'>점수선택</option>"
					+ "<option class='options' name='pl_dribble' value='1'>1</option>"
					+ "<option class='options' name='pl_dribble' value='2'>2</option>"
					+ "<option class='options' name='pl_dribble' value='3'>3</option>"
					+ "<option class='options' name='pl_dribble' value='4'>4</option>"
					+ "<option class='options' name='pl_dribble' value='5'>5</option>"
					+ "</select>" + "</div>" + "</div>";
			newCell6.innerHTML = "<div class='form-group'>"
					+ "<div class='col-lg-3'>"
					+ "<select name='pl_speed' style='color:white' class='input-large form-control' required='required'>"
					+ "<option class='options' name='pl_speed' value='' selected='selected'>점수선택</option>"
					+ "<option class='options' name='pl_speed' value='1'>1</option>"
					+ "<option class='options' name='pl_speed' value='2'>2</option>"
					+ "<option class='options' name='pl_speed' value='3'>3</option>"
					+ "<option class='options' name='pl_speed' value='4'>4</option>"
					+ "<option class='options' name='pl_speed' value='5'>5</option>"
					+ "</select>" + "</div>" + "</div>";

		}

		function delRow() {//줄 삭제
			var io = memberAdd.rows.length - 1; //마지막행 인덱스 찾기
			if (io > 1) {
				document.getElementById('memberAdd').deleteRow(io);
			}
		}

		function submitAndWindowClose() {
			var flag = clubMemberAddForm.checkValidity();
			if (flag == false) {
				if (clubMemberAddForm.pl_name.value.length == 0) {
					alert("이름을 입력하지 않으셨습니다.");
					if (clubMemberAddForm.pl_position.value.length == 0) {
						alert("포지션을 선택하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_increase.value.length == 0) {
						alert("키를 입력하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberAddForm.pl_name.focus();
				} else if (clubMemberAddForm.pl_position.value.length == 0) {
					alert("포지션을 선택하지 않으셨습니다.");
					if (clubMemberAddForm.pl_increase.value.length == 0) {
						alert("키를 입력하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberAddForm.pl_position.focus();
				} else if (clubMemberAddForm.pl_increase.value.length == 0) {
					alert("키를 입력하지 않으셨습니다.");
					if (clubMemberAddForm.pl_weight.value.length == 0) {
						alert("몸무게를 입력하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberAddForm.pl_increase.focus();
				} else if (clubMemberAddForm.pl_weight.value.length == 0) {
					alert("몸무게를 입력하지 않으셨습니다.");
					if (clubMemberAddForm.pl_dribble.value.length == 0) {
						alert("개인기 점수를 선택하지 않으셨습니다.");
					}
					if (clubMemberAddForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberAddForm.pl_weight.focus();
				} else if (clubMemberAddForm.pl_dribble.value.length == 0) {
					alert("개인기 점수를 선택하지 않으셨습니다.");
					if (clubMemberAddForm.pl_speed.value.length == 0) {
						alert("스피드 점수를 선택하지 않으셨습니다.");
					}//else if
					clubMemberAddForm.pl_dribble.focus();
				} else if (clubMemberAddForm.pl_speed.value.length == 0) {
					alert("스피드 점수를 선택하지 않으셨습니다.");
					clubMemberAddForm.pl_speed.focus();
				}//else if
			} else if (flag == true) {
				self.close();
				clubMemberAddForm.submit();
				opener.location.href = "http://localhost/www/template?page=/clubInfo";
			}

		}
	</script>


</body>
</html>