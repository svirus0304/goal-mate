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
.btn-freeAdd {
	background-color: hsl(120, 59%, 30%);
}

#freeDetail1 {
	margin-top: 1.1%;
}

#freeDetail2 {
	margin-left: -12%;
	margin-top: 0.5%;
}

#freeDetail3 {
	margin-top: 1.1%;
	margin-left: -1.5%;
}
</style>

</head>
<body>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		<form action="http://localhost/www/freeModifyForm" method="post">
			<input type="hidden" value="${dto.bod_num}" name="bod_num" />
			<div class="freeDetailContent">
				<div class="freeDetailContentTop">
					<label id="freeDetail3" class="col-lg-2 control-label"> 제목</label>
					<div id="freeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bod_title}" readonly="readonly" />
					</div>

					<label id="freeDetail1" class="col-lg-2 control-label"> 작성자</label>
					<div id="freeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bod_id}" readonly="readonly" />
					</div>


					<label id="freeDetail1" class="col-lg-2 control-label"> 작성일</label>
					<div id="freeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bod_date}" readonly="readonly" />
					</div>
				</div>
				<br> <br> <br> <br>
				<div class="freeDetailContent2">
					<div style="overflow: auto;">${dto.bod_content}</div>
				</div>
				<br>
			</div>
			<c:if test="${type.equals('admin')}">
				<div class="freeDetailContentButton">
					<div align="right" style="margin-top: 4%;">
						<input type="submit" class="btn btn-sm btn-freeAdd" value="수정하기" />
						<input type="button" class="btn btn-sm btn-freeAdd" value="삭제하기"
							onclick="location.href='http://localhost/www/freeDelete?bod_num=${dto.bod_num}'" />
					</div>
				</div>
			</c:if>
		</form>
		<br>
		<c:if test="${freeReplyList.size()>0}">
			<div class="freeDetailComment">
				<c:forEach var="list" items="${freeReplyList}">
					<form name="freeModify"
						action="http://localhost/www/freeModifyReply" method="post">
						<input type="hidden" value="${list.cf_num}" name="cf_num" /> <input
							type="hidden" value="${list.bod_num}" name="bod_num" />

						<div class="col-lg-2">
							<input style="margin-left: -8%; margin-top: -5%"
								class="form-control" type="text" value="${list.cf_id}"
								readonly="readonly" />
						</div>

						<c:if
							test="${list.cf_id.equals('admin')&&type.equals('admin')&&list.cf_num==cf_nums}">
							<input class="btn btn-sm btn-freeAdd" type="submit" value="수정하기" />
						</c:if>
						<!-- 관리자 수정 -->
						<c:if
							test="${list.cf_id eq id &&type.equals('user')&&list.cf_num==cf_nums}">
							<input class="btn btn-sm btn-freeAdd" type="submit" value="수정하기" />
						</c:if>
						<!-- 일반사용자 수정 -->

						<c:if
							test="${list.cf_id eq id &&type.equals('club')&&list.cf_num==cf_nums}">
							<input class="btn btn-sm btn-freeAdd" type="submit" value="수정하기" />
						</c:if>
						<!-- 클럽 수정 -->

						<c:choose>
							<c:when test="${list.cf_num==cf_nums}">
								<textarea
									style="background: rgba(31, 152, 31, 0.4); resize: none;"
									autofocus="autofocus" rows="5" cols="140" name="cf_content">${list.cf_content}</textarea>
							</c:when>
							<c:otherwise>
								<textarea
									style="background: rgba(31, 152, 31, 0.4); resize: none;"
									rows="5" cols="140" readonly="readonly" name="cf_content">${list.cf_content}</textarea>
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
		$.backstretch([ "http://localhost/www/resources/img/freeBoard1.jpg",
				"http://localhost/www/resources/img/freeBoard2.jpg",
				"http://localhost/www/resources/img/freeBoard3.jpg",
				"http://localhost/www/resources/img/freeBoard4.jpg" ],

		{

			duration : 4500,
			fade : 1500
		});
	</script>

</body>
</html>