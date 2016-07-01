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

<style type="text/css">
.btn-findClubAdd {
	background-color: hsl(204, 100%, 45%);
}

#findClubDetail1 {
	margin-top: 1.1%;
}

#findClubDetail2 {
	margin-left: -12%;
	margin-top: 0.5%;
}

#findClubDetail3 {
	margin-top: 1.1%;
	margin-left: -1.5%;
}
</style>

</head>
<body>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<form action="http://localhost/www/findClubModifyForm" method="post">
			<input type="hidden" value="${dto.bcl_num}" name="bcl_num" />
			<div class="findClubDetailContent">
				<div class="findClubDetailContentTop">
					<label id="findClubDetail3" class="col-lg-2 control-label">
						제목</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_title}" readonly="readonly" />
					</div>

					<label id="findClubDetail1" class="col-lg-2 control-label">
						작성자</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_id}" readonly="readonly" />
					</div>


					<label id="findClubDetail1" class="col-lg-2 control-label">
						작성일</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_date}" readonly="readonly" />
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div class="findClubDetailContent2">
					<div style="overflow: auto;">${dto.bcl_content}</div>
				</div>
				<br>
			</div>
			<c:if test="${type.equals('admin')}">
				<div class="findClubDetailContentButton">
					<div align="right" style="margin-top: 4%;">
						<input type="submit" class="btn btn-sm btn-findClubAdd"
							value="수정하기" /> <input type="button"
							class="btn btn-sm btn-findClubAdd" value="삭제하기"
							onclick="location.href='http://localhost/www/findClubDelete?bcl_num=${dto.bcl_num}'" />
					</div>
				</div>
			</c:if>
		</form>
		<br>
		<c:if test="${findClubReplyList.size()>0}">
			<div class="findClubDetailComment">
				<c:forEach var="list" items="${findClubReplyList}">
					<form name="findClubModify"
						action="http://localhost/www/findClubModifyReply" method="post">
						<input type="hidden" value="${list.cc_num}" name="cc_num" /> <input
							type="hidden" value="${list.bcl_num}" name="bcl_num" />

						<div class="col-lg-2">
							<input style="margin-left: -8%; margin-top: -5%"
								class="form-control" type="text" value="${list.cc_id}"
								readonly="readonly" />
						</div>

						<c:if
							test="${list.cc_id.equals('admin')&&type.equals('admin')&&list.cc_num==cc_nums}">
							<input class="btn btn-sm btn-findClubAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 관리자 수정 -->
						<c:if
							test="${list.cc_id eq id &&type.equals('user')&&list.cc_num==cc_nums}">
							<input class="btn btn-sm btn-findClubAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 일반사용자 수정 -->

						<c:if
							test="${list.cc_id eq id &&type.equals('club')&&list.cc_num==cc_nums}">
							<input class="btn btn-sm btn-findClubAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 클럽 수정 -->

						<c:choose>
							<c:when test="${list.cc_num==cc_nums}">
								<textarea
									style="background: rgba(0, 138, 230, 0.3); resize: none;"
									autofocus="autofocus" rows="5" cols="140" name="cc_content">${list.cc_content}</textarea>
							</c:when>
							<c:otherwise>
								<textarea
									style="background: rgba(0, 138, 230, 0.3); resize: none;"
									rows="5" cols="140" readonly="readonly" name="cc_content">${list.cc_content}</textarea>
							</c:otherwise>
						</c:choose>

					</form>
				</c:forEach>
			</div>
		</c:if>
		<p></p>
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
		$.backstretch([ "http://localhost/www/resources/img/findClub1.jpg",
				"http://localhost/www/resources/img/findClub2.jpg",
				"http://localhost/www/resources/img/findClub3.jpg",
				"http://localhost/www/resources/img/findClub4.jpg",
				"http://localhost/www/resources/img/findClub5.jpg",
				"http://localhost/www/resources/img/findClub6.jpg",
				"http://localhost/www/resources/img/findClub7.jpg",
				"http://localhost/www/resources/img/findClub8.jpg",
				"http://localhost/www/resources/img/findClub9.jpg",
				"http://localhost/www/resources/img/findClub10.jpg",
				"http://localhost/www/resources/img/findClub11.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>

</body>
</html>