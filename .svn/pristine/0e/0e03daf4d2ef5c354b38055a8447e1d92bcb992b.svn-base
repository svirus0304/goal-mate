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


		<form action="http://localhost/www/findClubModifyFormT" method="get">
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
							value="${dto.bcl_id}(${dto.bcl_type})" readonly="readonly" />
					</div>


					<label id="findClubDetail1" class="col-lg-2 control-label">
						작성일</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_date}" readonly="readonly" />
					</div>
				</div>
				<div class="findClubDetailContentTop">
					<label id="findClubDetail3" class="col-lg-2 control-label">
						지역</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_area}" readonly="readonly" />
					</div>

					<label id="findClubDetail1" class="col-lg-2 control-label">
						나이</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_age}" readonly="readonly" />
					</div>


					<label id="findClubDetail1" class="col-lg-2 control-label">
						이름</label>
					<div id="findClubDetail2" class="col-lg-3">
						<input type="text" class="form-control text-center"
							value="${dto.bcl_name}" readonly="readonly" />
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<div class="findClubDetailContent2">
					<div style="width: 1220px;">${dto.bcl_content}</div>
				</div>
				<br>

			</div>
			<c:if test="${id eq dto.bcl_id}">
				<div class="findClubDetailContentButton">
					<div align="right" style="margin-top: 4%;">
						<input align="right" type="button"
							class="btn btn-sm btn-findClubAdd" value="목록보기"
							onclick="location.href='http://localhost/www/findClubListT'" /> <input
							align="right" type="submit" class="btn btn-sm btn-findClubAdd"
							value="수정하기" /> <input align="right" type="button"
							class="btn btn-sm btn-findClubAdd" value="삭제하기"
							onclick="deleteFindClubCheck()" />
					</div>
				</div>
			</c:if>


		</form>
		<br>
		<c:choose>
			<c:when
				test="${type.equals('user')||type.equals('admin')||type.equals('club')}">
				<div class="findClubDetailComment">
					<form name="findClubReply"
						action="http://localhost/www/findClubReply" method="post">
						<input type="hidden" value="${bcl_num}" name="bcl_num" /> <input
							type="hidden" value="${id}" name="cc_id" />
						<textarea
							style="background: rgba(0, 138, 230, 0.3); resize: none;"
							name="cc_content" rows="5" cols="140" required="required"
							placeholder="여기에 댓글 내용을 쓰시면 됩니다. 댓글은 나의 얼굴입니다"></textarea>
						<div align="right" style="margin-top: 4%;">
							<input type="submit" class="btn btn-sm btn-findClubAdd"
								value="댓글쓰기" /> <input type="reset"
								class="btn btn-sm btn-findClubAdd" value="지우기" />
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="fndClubDetailComment">
					<form name="findClubReply"
						action="http://localhost/www/findClubReply" method="post">
						<input type="hidden" value="${bcl_num}" name="bcl_num" /> <input
							type="hidden" value="${id}" name="cc_id" />
						<textarea
							style="background: rgba(0, 138, 230, 0.3); resize: none;"
							name="cc_content" rows="5" cols="140" required="required"
							placeholder="댓글을 쓰시려면 로그인 해주세요"></textarea>
						<div align="right" style="margin-top: 4%;"></div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
		<br>

		<c:if test="${findClubReplyList.size()>0}">
			<div class="findClubDetailComment">
				<c:forEach var="list" items="${findClubReplyList}">
					<form name="findClubModifyForm"
						action="http://localhost/www/go_modifyPageFindClub" method="post">
						<input type="hidden" value="${list.cc_num}" name="cc_num" /> <input
							type="hidden" value="${list.bcl_num}" name="bcl_num" />

						<div class="col-lg-2">
							<input style="margin-left: -8%; margin-top: -4%"
								class="form-control" type="text"
								value="${list.cc_id}(${list.cc_type})" readonly="readonly" />
						</div>
						<div class="col-lg-3">
							<input style="margin-left: -8%; margin-top: -2%"
								class="form-control" type="text" value="${list.cc_join}"
								readonly="readonly" />
						</div>
						<c:if test="${type.equals('admin')}">

							<input type="button" class="btn btn-sm btn-findClubAdd"
								value="댓글삭제"
								onclick="deleteFindClubCheck2(${list.cc_num},${list.bcl_num})" />
						</c:if>

						<!-- 관리자 삭제 -->
						<c:if test="${list.cc_id.equals('admin')&&type.equals('admin')}">

							<input type="submit" class="btn btn-sm btn-findClubAdd"
								value="댓글수정" />
						</c:if>

						<!-- 관리자 수정 -->
						<c:if test="${list.cc_id eq id &&type.equals('user')}">

							<input type="button" class="btn btn-sm btn-findClubAdd"
								value="댓글삭제"
								onclick="deleteFindClubCheck2(${list.cc_num},${list.bcl_num})" />
						</c:if>

						<!-- 일반사용자 삭제 -->
						<c:if test="${list.cc_id eq id &&type.equals('user')}">

							<input type="submit" class="btn btn-sm btn-findClubAdd"
								value="댓글수정" />
						</c:if>

						<!-- 일반사용자 수정 -->

						<c:if test="${list.cc_id eq id &&type.equals('club')}">

							<input type="button" class="btn btn-sm btn-findClubAdd"
								value="댓글삭제"
								onclick="deleteFindClubCheck2(${list.cc_num},${list.bcl_num})" />
						</c:if>

						<!-- 클럽댓글 삭제 -->
						<c:if test="${list.cc_id eq id &&type.equals('club')}">

							<input type="submit" class="btn btn-sm btn-findClubAdd"
								value="댓글수정" />
						</c:if>

						<!-- 클럽댓글 수정 -->
						<br>
						<c:choose>
							<c:when
								test="${list.cc_num==old_cc_num&&modifyFocusAble.equals('true')}">
								<textarea
									style="background: rgba(0, 138, 230, 0.3); resize: none;"
									autofocus="autofocus" rows="5" cols="140" readonly="readonly"
									name="cc_content">${list.cc_content}</textarea>
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
         "http://localhost/www/resources/img/findClub1.jpg",
         "http://localhost/www/resources/img/findClub2.jpg",
         "http://localhost/www/resources/img/findClub3.jpg",
         "http://localhost/www/resources/img/findClub4.jpg",
         "http://localhost/www/resources/img/findClub5.jpg",
         "http://localhost/www/resources/img/findClub6.jpg",
         "http://localhost/www/resources/img/findClub7.jpg",
         "http://localhost/www/resources/img/findClub8.jpg",
         "http://localhost/www/resources/img/findClub9.jpg",
         "http://localhost/www/resources/img/findClub10.jpg",
         "http://localhost/www/resources/img/findClub11.jpg"
        ],

        {
        	
            duration: 4500,
            fade: 1500
        }
    );
        </script>

		<script type="text/javascript">
			function deleteFindClubCheck() {
				var checkFlag = window.confirm("정말 삭제하시겠습니까?");
				if (checkFlag) {
					location.href="http://localhost/www/findClubDelete?bcl_num=${dto.bcl_num}";
				}
			}
			
			function deleteFindClubCheck2(cc_num,bcl_num) {
				var checkFlags = window.confirm("정말 삭제하시겠습니까?");
				if (checkFlags) {
					location.href="http://localhost/www/deleteFindClubReply?cc_num="+cc_num+"&bcl_num="+bcl_num;
				}
			}
			
		</script>
</body>
</html>