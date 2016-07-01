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
<title>NoticeList</title>
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

#pagings {
	color: white;
	font-size: 15px;
}

b {
	color: hsl(24, 100%, 50%);
}

.findMercenary_title {
	color: white;
}
</style>

</head>
<body>
	<center>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<form name="listForm"
				action="http://localhost/www/findMercenaryListT" method="get">
				<input type="hidden" value="${paging.pageNo}" name="pageNo">
				<div class="findMercenaryList">
					<legend>
						용병 구함 게시판
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${type.equals('club')}">
							<input type="button" value="글 등록"
								class="btn btn-sm btn-findMercenaryAdd"
								onclick="location.href='http://localhost/www/findMercenaryWriteFormT'">
						</c:if>
					</legend>

					<table class="form-group table-hover" border="1" width="1200px"
						align="center">
						<tr style="font-weight: bold; font-size: 18px;">
							<td align="center" width="5%">번호</td>
							<td align="center" width="20%">제목</td>
							<td align="center" width="15%">지역</td>
							<td align="center" width="15%">나이</td>
							<td align="center" width="15%">작성자</td>
							<td align="center" width="20%">작성일</td>
							<td align="center" width="10%">조회수</td>
						</tr>
						<c:forEach var="list" items="${findMercenaryList}" varStatus="idx">

							<tr>
								<td align="center" width="5%" height="50">
									${paging.totalCount - ((paging.pageNo-1)*paging.pageSize+idx.index)}
								</td>
								<td align="center" width="15%" height="50"><c:choose>
										<c:when test="${list.bpl_rcount>0}">
											<a class="findMercenary_title"
												href="http://localhost/www/findMercenaryDetailT?bpl_num=${list.bpl_num}">${list.bpl_title}</a>&nbsp;&nbsp;&nbsp;<b>(${list.bpl_rcount})</b>
										</c:when>
										<c:otherwise>
											<a class="findMercenary_title"
												href="http://localhost/www/findMercenaryDetailT?bpl_num=${list.bpl_num}">${list.bpl_title}</a>
										</c:otherwise>
									</c:choose></td>

								<td align="center" width="15%" height="50">
									${list.bpl_area}</td>

								<td align="center" width="15%" height="50">${list.bpl_age}
								</td>

								<td align="center" width="15%" height="50">
									${list.bpl_id}(${list.bpl_type})</td>

								<td align="center" width="15%" height="50">
									${list.bpl_date}</td>

								<td align="center" width="15%" height="50">
									${list.bpl_hits}</td>
							</tr>


						</c:forEach>

					</table>

					<!-- 검색 div -->
					<div style="width: 350px; align: center; margin-left: 0%">
						<select class="col-lg-4" name="search_type"
							style="color: black; margin-top: 0.5%" required="required">
							<option class="options" name="search_type" value="지역"
								selected="selected">지역</option>
							<option class="options" name="search_type" value="나이">나이</option>
							<option class="options" name="search_type" value="제목">제목</option>
							<option class="options" name="search_type" value="내용">내용</option>
							<option class="options" name="search_type" value="제목+내용">제목+내용</option>
							<option class="options" name="search_type" value="작성자">작성자</option>
						</select> <input
							style="height: 24px; color: black; color: black; margin-top: -0.5%"
							type="text" name="search_content" placeholder="검색어 입력 후 검색 클릭">
						<input type="button" value="검색"
							style="height: 26px; color: white; background: hsl(24, 100%, 45%);"
							onclick="search_findMercenary()" />
					</div>

					<!-- 페이징 div -->

					<div class="pagination">
						<a href="#" onclick="goPage(${paging.firstPageNo})" class="first"
							id="pagings">◁◁</a>&nbsp;&nbsp; <a href="#"
							onclick="goPage(${paging.prevPageNo})" class="prev" id="pagings">◁</a>&nbsp;&nbsp;&nbsp;
						<span> <c:forEach var="i" begin="${paging.startPageNo}"
								end="${paging.endPageNo}" step="1">
								<c:choose>
									<c:when test="${i eq paging.pageNo}">
										<a href="#" onclick="goPage(${i})" class="selected"
											id="pagings" style="color: black;">${i}</a>
					&nbsp;&nbsp;
				</c:when>
									<c:otherwise>
										<a href="#" onclick="goPage(${i})" id="pagings">${i}</a>
					&nbsp;&nbsp;
				</c:otherwise>
								</c:choose>
							</c:forEach>
						</span> <a href="#" onclick="goPage(${paging.nextPageNo})" class="next"
							id="pagings">▷</a>&nbsp;&nbsp; <a href="#"
							onclick="goPage(${paging.finalPageNo})" class="last" id="pagings">▷▷</a>
					</div>
			</form>
		</div>


	</center>







	<script src="resources/js/jquery.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="resources/js/jquery.backstretch.js" type="text/javascript"></script>
	<script type="text/javascript">
            'use strict';

            /* ========================== */
            /* ::::::: Backstrech ::::::: */
            /* ========================== */
            // You may also attach Backstretch to a block-level element
            $.backstretch(
        [
         "http://localhost/www/resources/img/findMer1.jpg",
         "http://localhost/www/resources/img/findMer2.jpg",
         "http://localhost/www/resources/img/findMer3.jpg",
         "http://localhost/www/resources/img/findMer4.jpg",
         "http://localhost/www/resources/img/findMer5.jpg",
         "http://localhost/www/resources/img/findMer6.jpg",
         "http://localhost/www/resources/img/findMer7.jpg"
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
			
			function search_findMercenary() {
				listForm.action="http://localhost/www/search_findMercenary";
				listForm.method="post";
				listForm.submit();
			}
		
		</script>
</body>
</html>