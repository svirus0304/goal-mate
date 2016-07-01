<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>ClubIdCheck</title>
<script type="text/javascript">
	function winclose(club_id) {
		opener.document.joinform.club_id.value = club_id;
		self.close();
	}
</script>
</head>
<body bgcolor="#f5f5f5">
	<center>
		<h2>클럽아이디중복확인</h2>
		<c:choose>
			<c:when test="${flag}">
				<table width="360" border="0" cellpadding="5" cellspacing="0">
					<tr align="center">
						<td height="30"><font size="2">${club_id}는 이미 사용중인
								클럽아이디 입니다.</font></td>
					</tr>
				</table>
				<form action="http://localhost/www/clubJoinIdCheck">
					<table width="360" border="0" cellpadding="5" cellspacing="0">
						<tr align="center">
							<td height="30"><font size="2">다른 클럽아이디를 선택하세요</font>
							<p>
									<input type="text" size="10" name="club_id"> <input
										type="submit" value="중복확인"></td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<table width="360" border="0" cellpadding="5" cellspacing="0">
					<tr align="center">
						<td height="30"><font size="2">${club_id}는 사용하실 수 있는
								클럽아이디 입니다.</font>
						<p>
								<input type="button" value="닫기" onclick="winclose('${club_id}')"></td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</center>

</body>
</html>
