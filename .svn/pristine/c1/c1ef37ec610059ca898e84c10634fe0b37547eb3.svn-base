<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>용병 등록</title>
</head>
<body>
	<form action="merReg" method="post" name="meJoinForm">
	<table align="center" width="80%" border="1">
		<tr>
			<td>지역</td>
			<td><select name="cen_area" required>
					<option value=""></option>
					<option value="중구">중구</option>
					<option value="동구">동구</option>
					<option value="서구">서구</option>
					<option value="남구">남구</option>
					<option value="달서구">달서구</option>
					<option value="달성군">달성군</option>
					<option value="북구">북구</option>
					<option value="수성구">수성구</option>
			</select></td>
			<td>출전 범위</td>
			<td><select name="cen_scope" required>
				<option value=""></option>
				<option value="Home">Home</option>
				<option value="Away">Away</option>
			</select></td>
			<td>나이</td>
			<td><input type="text" name="cen_age" size="2" maxlength="2" required>세</td>
		</tr>
		<tr>
			<td>포지션</td>
			<td><select name="cen_position" required>
				<option value=""></option>
				<option value="PIVO">PIVO</option>
				<option value="ALA">ALA</option>
				<option value="FIXO">FIXO</option>
				<option value="GOLEIRO">GOLEIRO</option>
			</select></td>
			<td>스타일</td>
			<td><select name="cen_foot" required>
				<option value=""></option>
				<option value="왼발">왼발</option>
				<option value="오른발">오른발</option>
				<option value="양발">양발</option>
			</select></td>
			<td>피지컬</td>
			<td><input type="text" name="cen_increase" size="3" maxlength="3" required>키 <input type="text" name="cen_weight" size="3" maxlength="3" required>몸무게</td>
		</tr>
		<tr>
			<td>축구 경력</td>
			<td><input type="text" name="cen_career"size="3" maxlength="2" required>년</td>
			<td>가능 시간</td>
			<td  colspan="3">요일 : 
			<input type="checkbox" name="cen_date" value="월">월
			<input type="checkbox" name="cen_date" value="화">화
			<input type="checkbox" name="cen_date" value="수">수
			<input type="checkbox" name="cen_date" value="목">목
			<input type="checkbox" name="cen_date" value="금">금
			<input type="checkbox" name="cen_date" value="토">토
			<input type="checkbox" name="cen_date" value="일" checked="checked">일
			<br>
			시간:
			<input type="text" name="cen_time" size="1"  maxlength="5" required>~<input type="text" name="cen_time"  size="1" maxlength="5" required>
			</td>
			
		</tr>
			<tr><td colspan="6"></td></tr>
		<tr>
			<td colspan="6"><textarea rows="30" cols="120" name="cen_content"></textarea></td>
		</tr>
		<tr><td colspan="6"><input type="submit" value="등록"><input type="button" value="닫기" onclick="javascript:window.close()"></td></tr>
	</table>
	</form>
</body>
</html>