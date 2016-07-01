<%@ page language="java" contentType="text/html; 
charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>MemberIdCheck</title>
<script type="text/javascript">
	function winclose(mem_id) {
		opener.document.joinform.mem_id.value = mem_id;
		self.close();
	}
</script>
</head>
<body bgcolor="#f5f5f5">
	<center>
		<h2>아이디중복확인</h2>
		<c:choose>
			<c:when test="${flag}">
				<table width="360" border="0" cellpadding="5" cellspacing="0">
					<tr align="center">
						<td height="30"><font size="2">${mem_id}는 이미 사용중인 아이디
								입니다.</font></td>
					</tr>
				</table>
				<form action="http://localhost/www/memberJoinIdCheck">
					<table width="360" border="0" cellpadding="5" cellspacing="0">
						<tr align="center">
							<td height="30"><font size="2">다른 아이디를 선택하세요</font>
							<p>
									<input type="text" size="10" name="mem_id"> <input
										type="submit" value="중복확인"></td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<table width="360" border="0" cellpadding="5" cellspacing="0">
					<tr align="center">
						<td height="30"><font size="2">${mem_id}는 사용하실 수 있는
								아이디 입니다.</font>
						<p>
								<input type="button" value="닫기" onclick="winclose('${mem_id}')"></td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</center>

</body>
</html>
