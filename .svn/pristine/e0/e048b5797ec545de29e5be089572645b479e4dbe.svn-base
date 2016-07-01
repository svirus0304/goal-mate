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
.btn-findMercenaryAdd {
	background-color: hsl(24, 100%, 45%);
}

#findMercenaryDetail1 {
	margin-top: 1.1%;
}

#findMercenaryDetail2 {
	margin-left: -12%;
	margin-top: 0.5%;
}

#findMercenaryDetail3 {
	margin-top: 1.1%;
	margin-left: -1.5%;
}
</style>

</head>
<body>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<form action="http://localhost/www/findMercenaryModifyForm"
			method="post">
			<input type="hidden" value="${dto.bpl_num}" name="bpl_num" />
			<div class="findMercenaryDetailContent">
				<div class="findMercenaryDetailContentTop">
					<label id="findMercenaryDetail3" class="col-lg-2 control-label">
						제목</label>
					<div id="findMercenaryDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bpl_title}" readonly="readonly" />
					</div>

					<label id="findMercenaryDetail1" class="col-lg-2 control-label">
						작성자</label>
					<div id="findMercenaryDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bpl_id}" readonly="readonly" />
					</div>


					<label id="findMercenaryDetail1" class="col-lg-2 control-label">
						작성일</label>
					<div id="findMercenaryDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bpl_date}" readonly="readonly" />
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div class="findMercenaryDetailContent2">
					<div style="overflow: auto;">${dto.bpl_content}</div>
				</div>
				<br>
			</div>
			<c:if test="${type.equals('admin')}">
				<div class="findMercenaryDetailContentButton">
					<div align="right" style="margin-top: 4%;">
						<input type="submit" class="btn btn-sm btn-findMercenaryAdd"
							value="수정하기" /> <input type="button"
							class="btn btn-sm btn-findMercenaryAdd" value="삭제하기"
							onclick="location.href='http://localhost/www/findMercenaryDelete?bpl_num=${dto.bpl_num}'" />
					</div>
				</div>
			</c:if>
		</form>
		<br>
		<c:if test="${findMercenaryReplyList.size()>0}">
			<div class="findMercenaryDetailComment">
				<c:forEach var="list" items="${findMercenaryReplyList}">
					<form name="findMercenaryModify"
						action="http://localhost/www/findMercenaryModifyReply"
						method="post">
						<input type="hidden" value="${list.cp_num}" name="cp_num" /> <input
							type="hidden" value="${list.bpl_num}" name="bpl_num" />

						<div class="col-lg-2">
							<input style="margin-left: -8%; margin-top: -5%"
								class="form-control" type="text" value="${list.cp_id}"
								readonly="readonly" />
						</div>

						<c:if
							test="${list.cp_id.equals('admin')&&type.equals('admin')&&list.cp_num==cp_nums}">
							<input class="btn btn-sm btn-findMercenaryAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 관리자 수정 -->
						<c:if
							test="${list.cp_id eq id &&type.equals('user')&&list.cp_num==cp_nums}">
							<input class="btn btn-sm btn-findMercenaryAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 일반사용자 수정 -->

						<c:if
							test="${list.cp_id eq id &&type.equals('club')&&list.cp_num==cp_nums}">
							<input class="btn btn-sm btn-findMercenaryAdd" type="submit"
								value="수정하기" />
						</c:if>
						<!-- 클럽 수정 -->

						<c:choose>
							<c:when test="${list.cp_num==cp_nums}">
								<textarea
									style="background: rgba(230, 92, 0, 0.3); resize: none;"
									autofocus="autofocus" rows="5" cols="140" name="cp_content">${list.cp_content}</textarea>
							</c:when>
							<c:otherwise>
								<textarea
									style="background: rgba(230, 92, 0, 0.3); resize: none;"
									rows="5" cols="140" readonly="readonly" name="cp_content">${list.cp_content}</textarea>
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
		$.backstretch([ "http://localhost/www/resources/img/findMer1.jpg",
				"http://localhost/www/resources/img/findMer2.jpg",
				"http://localhost/www/resources/img/findMer3.jpg",
				"http://localhost/www/resources/img/findMer4.jpg",
				"http://localhost/www/resources/img/findMer5.jpg",
				"http://localhost/www/resources/img/findMer6.jpg",
				"http://localhost/www/resources/img/findMer7.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>

</body>
</html>