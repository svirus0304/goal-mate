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
.btn-noticeAdd {
	background-color: hsl(40, 100%, 40%);
}

#noticeDetail1 {
	margin-top: 1.1%;
}

#noticeDetail2 {
	margin-left: -12%;
	margin-top: 0.5%;
}

#noticeDetail3 {
	margin-top: 1.1%;
	margin-left: -1.5%;
}
</style>


</head>
<body>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">


		<form action="http://localhost/www/noticeModifyFormT" method="get">
			<input type="hidden" value="${dto.bad_num}" name="bad_num" />
			<div class="noticeDetailContent">
				<div class="noticeDetailContentTop">
					<label id="noticeDetail3" class="col-lg-2 control-label">
						제목</label>
					<div id="noticeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bad_title}" readonly="readonly" />
					</div>

					<label id="noticeDetail1" class="col-lg-2 control-label">
						작성자</label>
					<div id="noticeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bad_id}" readonly="readonly" />
					</div>


					<label id="noticeDetail1" class="col-lg-2 control-label">
						작성일</label>
					<div id="noticeDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bad_date}" readonly="readonly" />
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div class="noticeDetailContent2">
					<div style="width: 1220px;">${dto.bad_content}</div>
				</div>
				<br>

			</div>
			<c:if test="${type.equals('admin')}">
				<div class="noticeDetailContentButton">
					<div align="right" style="margin-top: 4%;">
						<input align="right" type="button"
							class="btn btn-sm btn-noticeAdd" value="목록보기"
							onclick="location.href='http://localhost/www/noticeListT'" /> <input
							align="right" type="submit" class="btn btn-sm btn-noticeAdd"
							value="수정하기" /> <input align="right" type="button"
							class="btn btn-sm btn-noticeAdd" value="삭제하기"
							onclick="deleteNoticeCheck()" />
					</div>
				</div>
			</c:if>


		</form>
		<br>
		<c:choose>
			<c:when
				test="${type.equals('user')||type.equals('admin')||type.equals('club')}">
				<div class="noticeDetailComment">
					<form name="noticeReply" action="http://localhost/www/noticeReply"
						method="post">
						<input type="hidden" value="${bad_num}" name="bad_num" /> <input
							type="hidden" value="${id}" name="ca_id" />
						<textarea
							style="background: rgba(183, 102, 0, 0.3); resize: none;"
							name="ca_content" rows="5" cols="140" required="required"
							placeholder="여기에 댓글 내용을 쓰시면 됩니다. 댓글은 나의 얼굴입니다"></textarea>
						<div align="right" style="margin-top: 4%;">
							<input type="submit" class="btn btn-sm btn-noticeAdd"
								value="댓글쓰기" /> <input type="reset"
								class="btn btn-sm btn-noticeAdd" value="지우기" />
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="noticeDetailComment">
					<form name="noticeReply" action="http://localhost/www/noticeReply"
						method="post">
						<input type="hidden" value="${bad_num}" name="bad_num" /> <input
							type="hidden" value="${id}" name="ca_id" />
						<textarea
							style="background: rgba(183, 102, 0, 0.3); resize: none;"
							name="ca_content" rows="5" cols="140" required="required"
							placeholder="댓글을 쓰시려면 로그인 해주세요"></textarea>
						<div align="right" style="margin-top: 4%;"></div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
		<br>

		<c:if test="${noticeReplyList.size()>0}">
			<div class="noticeDetailComment">
				<c:forEach var="list" items="${noticeReplyList}">
					<form name="noticeModifyForm"
						action="http://localhost/www/go_modifyPage" method="post">
						<input type="hidden" value="${list.ca_num}" name="ca_num" /> <input
							type="hidden" value="${list.bad_num}" name="bad_num" />

						<div class="col-lg-2">
							<input style="margin-left: -8%; margin-top: -4%"
								class="form-control" type="text"
								value="${list.ca_id}(${list.ca_type})" readonly="readonly" />
						</div>
						<div class="col-lg-3">
							<input style="margin-left: -8%; margin-top: -2%"
								class="form-control" type="text" value="${list.ca_join}"
								readonly="readonly" />
						</div>
						<c:if test="${type.equals('admin')}">

							<input type="button" class="btn btn-sm btn-noticeAdd"
								value="댓글삭제"
								onclick="deleteNoticeCheck2(${list.ca_num},${list.bad_num})" />
						</c:if>

						<!-- 관리자 삭제 -->
						<c:if test="${list.ca_id.equals('admin')&&type.equals('admin')}">

							<input type="submit" class="btn btn-sm btn-noticeAdd"
								value="댓글수정" />
						</c:if>

						<!-- 관리자 수정 -->
						<c:if test="${list.ca_id eq id &&type.equals('user')}">

							<input type="button" class="btn btn-sm btn-noticeAdd"
								value="댓글삭제"
								onclick="deleteNoticeCheck2(${list.ca_num},${list.bad_num})" />
						</c:if>

						<!-- 일반사용자 삭제 -->
						<c:if test="${list.ca_id eq id &&type.equals('user')}">

							<input type="submit" class="btn btn-sm btn-noticeAdd"
								value="댓글수정" />
						</c:if>

						<!-- 일반사용자 수정 -->

						<c:if test="${list.ca_id eq id &&type.equals('club')}">

							<input type="button" class="btn btn-sm btn-noticeAdd"
								value="댓글삭제"
								onclick="deleteNoticeCheck2(${list.ca_num},${list.bad_num})" />
						</c:if>

						<!-- 클럽댓글 삭제 -->
						<c:if test="${list.ca_id eq id &&type.equals('club')}">

							<input type="submit" class="btn btn-sm btn-noticeAdd"
								value="댓글수정" />
						</c:if>

						<!-- 클럽댓글 수정 -->

						<br>
						<c:choose>
							<c:when
								test="${list.ca_num==old_ca_num&&modifyFocusAble.equals('true')}">
								<textarea
									style="background: rgba(183, 102, 0, 0.3); resize: none;"
									autofocus="autofocus" rows="5" cols="140" readonly="readonly"
									name="ca_content">${list.ca_content}</textarea>
							</c:when>
							<c:otherwise>
								<textarea
									style="background: rgba(183, 102, 0, 0.3); resize: none;"
									rows="5" cols="140" readonly="readonly" name="ca_content">${list.ca_content}</textarea>
							</c:otherwise>
						</c:choose>
					</form>
				</c:forEach>
			</div>
		</c:if>


		<script src="resources/js/jquery.js" type="text/javascript"></script>
		<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="resources/js/jquery.backstretch.js"
			type="text/javascript"></script>

		<script type="text/javascript">
            'use strict';

            /* ========================== */
            /* ::::::: Backstrech ::::::: */
            /* ========================== */
            // You may also attach Backstretch to a block-level element
            $.backstretch(
        [
         "http://localhost/www/resources/img/notice2.png",
         "http://localhost/www/resources/img/notice3.jpg"
        ],

        {
        	
            duration: 4500,
            fade: 1500
        }
    );
        </script>

		<script type="text/javascript">
			function goPage(pageNo){
				document.listForm.pageNo.value = pageNo;
				document.listForm.submit();
				console.log("pageNo : " + pageNo);
			}
			
			function search_notice() {
				listForm.action="http://localhost/www/search_Notice";
				listForm.method="post";
				listForm.submit();
			}
			
			function deleteNoticeCheck() {
				var checkFlag = window.confirm("정말 삭제하시겠습니까?");
				if (checkFlag) {
					location.href="http://localhost/www/noticeDelete?bad_num=${dto.bad_num}";
				}
			}
			
			function deleteNoticeCheck2(ca_num,bad_num) {
				var checkFlags = window.confirm("정말 삭제하시겠습니까?");
				if (checkFlags) {
					location.href="http://localhost/www/deleteNoticeReply?ca_num="+ca_num+"&bad_num="+bad_num;
				}
			}
			
		</script>
</body>
</html>