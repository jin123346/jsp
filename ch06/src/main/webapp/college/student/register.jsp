<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register.jsp</title>
</head>
<body>

	<h3>Studnet 등록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/college/student/register.jsp">등록</a><br>
	
	
	<form action="/ch06/college/student/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>학생번호</td>
				<td><input type="text" name="stdNo"></td>
			</tr>
			<tr>
				<td>학생이름</td>
				<td><input type="text" name="stdName"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="stdHp"></td>
			</tr>
			<tr>
				<td>입학년도</td>
				<td><input type="date" name="stdYear"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="stdAddress"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기">
				</td>
			</tr>

		</table>	
	</form>
	
</body>
</html>