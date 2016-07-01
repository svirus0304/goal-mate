<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
function sends(id){
	var recipient = id;
	location.href="msgSendForm?recipient="+recipient;
}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
</head>
<body>
	<table>
	<tr>
	<td>보낸 사람</td><td>${dto.me_sender}</td>
	</tr>
	<tr>
	<td>작성일</td><td>${fn:substring(dto.me_join,0,16)}</td>
	</tr>
	<tr>
	<td>링크여부</td>
	<td>
	<c:if test="${dto.me_link eq 1}"><a href="msgMatch?checks=1&num=${dto.me_num}&content=${dto.me_content}"><input type="button" value="수락"></a><a href="msgMatch?checks=0&content=${dto.me_content}"><input type="button" value="거절"></a></c:if>
	<c:if test="${dto.me_link eq 0||dto.me_link eq 2}">링크 없음</c:if>
	</td>
	</tr>
	<tr>
	<td>
	내용
	</td>
	</tr>
	<tr>	
	<td colspan="2"><textarea rows="33" cols="125" disabled="disabled">${dto.me_content}</textarea></td>
	</tr>
	<tr>
	<td><input type="button" value="답장" onclick="sends('${dto.me_sender}')"><input type="button" value="닫기" onclick="window.close()"></td>
	</tr>
	</table>
</body>
</html>