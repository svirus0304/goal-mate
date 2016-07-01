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
			<div id="bringClubPic">
				<legend>클럽 엠블렘</legend>
				<img style="width: 250px; height: 180px;"
					src="http://localhost/www/resources/img/emblem/${dto.club_path}">
				<p>
				<form name="changePic" action="http://localhost/www/clubInfoPicCh"
					enctype="multipart/form-data" method="post"
					onsubmit="return checkNullPic()">
					<div class="col-lg-7">
						<input type="file" name="file4" id="fileUpload4"
							class="btn btn-sm btn-primary" />
					</div>
					<input type="submit" value="변경" class="btn btn-sm btn-primary" /> <input
						type="hidden" value="${dto.club_path}" name="club_path" /> <input
						type="hidden" value="${dto.club_id}" name="club_id" />

				</form>
			</div>

		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="bringClubInfo">
				<form action="#" class="form-horizontal" method="post">
					<fieldset>
						<legend>
							클럽정보
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="매치 관리" class="btn btn-sm btn-primary"
								name="confirm_id"
								onclick="location.href='http://localhost/www/template?page=/clubInfoCheckPassAgain'">
							<input type="button" value="정보 수정" class="btn btn-sm btn-primary"
								onclick="location.href='http://localhost/www/template?page=/clubChangeInfoCheckPassAgain_ForChangeCInfo'">
							<input type="button" value="비밀번호 변경"
								class="btn btn-sm btn-primary" name="confirm_id"
								onclick="location.href='http://localhost/www/template?page=/clubInfoCheckPassAgain_ForChangePwd'">
						</legend>

						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 이름</label>
							<div class="col-lg-4">
								<input type="text" value="${dto.club_name}" class="form-control"
									id="inputId" readonly="readonly" required="required">
							</div>

							<label for="inputId" class="col-lg-2 control-label"> 전적</label>
							<div class="col-lg-4">
								<input type="text"
									value="${dto.club_win}승 ${dto.club_lose}패 ${dto.club_draw}무"
									class="form-control" id="inputId" readonly="readonly"
									required="required">
							</div>

						</div>

						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 지역</label>
							<div class="col-lg-4">
								<input type="text" value="${dto.club_area}" class="form-control"
									id="inputId" readonly="readonly" required="required">
							</div>

							<label for="inputId" class="col-lg-2 control-label"> 연령</label>
							<div class="col-lg-4">
								<input type="text" value="${dto.club_age}" class="form-control"
									id="inputId" readonly="readonly" required="required">
							</div>

						</div>


						<div class="form-group">
							<label for="inputId" class="col-lg-2 control-label"> 유형</label>
							<div class="col-lg-4">
								<input type="text" value="${dto.club_type}" class="form-control"
									id="inputId" readonly="readonly" required="required">
							</div>

							<label for="inputId" class="col-lg-2 control-label"> 인원</label>
							<div class="col-lg-4">
								<input type="text" value="${memberList.size()}명"
									class="form-control" id="inputId" readonly="readonly"
									required="required">
							</div>

						</div>

						<div class="form-group">
							<label for="inputName" class="col-lg-2 control-label"> 클럽
								생성일</label>
							<div class="col-lg-4">
								<input type="text" value="${dto.club_join}" class="form-control"
									id="inputName" readonly="readonly" required="required">
							</div>
						</div>


					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<p>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<form name="clubMemberDeleteForm"
			action="http://localhost/www/clubMembersDelete" method="post">
			<div class="bringClubMemberInfo">
				<legend>
					클럽 멤버
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="전체 선택" class="btn btn-sm btn-primary"
						onclick="allSelected()"> <input type="button"
						value="전체 해제" class="btn btn-sm btn-primary"
						onclick="cancelAllSelected()"> <input type="button"
						value="선택 삭제" class="btn btn-sm btn-primary"
						onclick="return checkSelected_delete()"> <input
						type="button" value="멤버 추가" class="btn btn-sm btn-primary"
						onclick="openConfirmId(this.form)"> <input type="button"
						value="선택 멤버수정" class="btn btn-sm btn-primary"
						onclick="return checkSelected_modify()">
				</legend>

				<table class="form-group table-hover" border="1" cellpadding="5"
					width="1205px" align="center">
					<tr>
						<td align="center" width="15%">이름</td>
						<td align="center" width="15%">포지션</td>
						<td align="center" width="15%">피지컬</td>
						<td align="center" width="15%">개인기</td>
						<td align="center" width="15%">스피드</td>
						<td align="center" width="10%">선택</td>
						<td align="center" width="10%">삭제</td>
					</tr>
					<c:forEach var="list" items="${memberList}">
						<tr>
							<td align="center" width="15%">${list.pl_name}</td>
							<td align="center" width="15%">${list.pl_position}</td>

							<td align="center" width="15%"><c:if
									test="${list.pl_increase==1}">★☆☆☆☆</c:if> <c:if
									test="${list.pl_increase==2}">★★☆☆☆</c:if> <c:if
									test="${list.pl_increase==3}">★★★☆☆</c:if> <c:if
									test="${list.pl_increase==4}">★★★★☆</c:if> <c:if
									test="${list.pl_increase==5}">★★★★★</c:if></td>

							<td align="center" width="15%"><c:if
									test="${list.pl_dribble==1}">★☆☆☆☆</c:if> <c:if
									test="${list.pl_dribble==2}">★★☆☆☆</c:if> <c:if
									test="${list.pl_dribble==3}">★★★☆☆</c:if> <c:if
									test="${list.pl_dribble==4}">★★★★☆</c:if> <c:if
									test="${list.pl_dribble==5}">★★★★★</c:if></td>

							<td align="center" width="15%"><c:if
									test="${list.pl_speed==1}">★☆☆☆☆</c:if> <c:if
									test="${list.pl_speed==2}">★★☆☆☆</c:if> <c:if
									test="${list.pl_speed==3}">★★★☆☆</c:if> <c:if
									test="${list.pl_speed==4}">★★★★☆</c:if> <c:if
									test="${list.pl_speed==5}">★★★★★</c:if></td>

							<td align="center" width="10%"><input type="checkbox"
								name="players" value="${list.pl_num}"></td>
							<td align="center" width="10%"><input type="button"
								value="삭제" class="btn btn-sm btn-primary"
								onclick="deletePlayerSingle(${list.pl_num})"></td>
						</tr>
					</c:forEach>

				</table>
		</form>
	</div>
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
            $.backstretch(
        [
            "http://localhost/www/resources/img/44.jpg",
            "http://localhost/www/resources/img/colorful.jpg",
            "http://localhost/www/resources/img/34.jpg",
            "http://localhost/www/resources/img/images.jpg"
        ],

        {
        	
            duration: 4500,
            fade: 1500
        }
    );
        </script>

	<script type="text/javascript">
function checkNullPic() {
	if (changePic.file4.value.length>30) {
		alert("사진 이름이 너무 길어서 업로드를 할 수 없습니다. 다시 부탁드립니다.");
		return false;
	}
	
	if(changePic.file4.value.length==0){
		alert("사진을 선택하지 않으셨습니다. 사진을 선택해 주세요");
		return false;
	}//if
	return true;
}


function allSelected() {
	var check = document.getElementsByName("players");
	for (var i = 0; i < check.length; i++) {
		check[i].checked=true;
	}//for
}//allSelected

function cancelAllSelected() {
	var check = document.getElementsByName("players");
	for (var i = 0; i < check.length; i++) {
		check[i].checked=false;
	}//for
}//cancelAllSelected()

function checkSelected_delete() {
	var check = document.getElementsByName("players");
	
	var flag = false;
	var count=0;
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) {
			count++;
			flag=true;
		}//if
	}//for
	if (count==0) {
		alert("하나도 체크하지 않으셨습니다. 1개 이상을 체크하시고 삭제해주세요");
		return false;
	}//if
	
	var checkFlag = window.confirm("정말 삭제하시겠습니까?");
	if (checkFlag) {
		if (flag) {
			clubMemberDeleteForm.submit();
		}//if
	}
	
}


function checkSelected_modify() {
	var check = document.getElementsByName("players");
	
	var flag = false;
	var count=0;
	var num = 0;
	for (var i = 0; i < check.length; i++) {
		if (check[i].checked) {
			count++;
			num=check[i].value;
			flag=true;
		}//if
	}//for
	if (count==0) {
		alert("체크하시고 수정버튼을 누르세요");
		return false;
	}//if
	if (count>1) {
		alert("한번에 한 멤버의 정보만 수정 가능합니다. 한명만 선택후 수정버튼을 누르세요");
		return false;
	}
	
	if (flag) {
		var leftpos=(screen.availWidth/2)-500;
		leftpos+=window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
		var toppos=(screen.availHeight/2)-250;
		var url = "http://localhost/www/clubMembersModifyForm?num="+num;
		window.open(url,"confirm","width=1000,height=500,"+"top="+toppos+",left="+leftpos);
	}//if
}

function deletePlayerSingle(pl_num) {
	var checkFlags = window.confirm("정말 삭제하시겠습니까?");
	if (checkFlags) {
		location.href="http://localhost/www/deleteClubPlayer?num="+pl_num;
	}
}

function openConfirmId(forms) {
	var leftpos=(screen.availWidth/2)-500;
	leftpos+=window.screenLeft;//요새는 듀얼모니터 사용자가 많기때문에 이걸 넣어줘야함! 듀얼모니터써도 웹페이지에서 새창이 중앙에 뜨게 하는것
	var toppos=(screen.availHeight/2)-250;
	var url = "http://localhost/www/clubMemberAddIntro";
	window.open(url,"중복확인","width=1000,height=500,"+"top="+toppos+",left="+leftpos);
}
</script>


</body>
</html>