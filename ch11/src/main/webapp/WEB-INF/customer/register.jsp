<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>shop::register</title>
</head>
<body>

	<h3>shop customer 등록</h3>
	
	<a href="/ch11/">처음으로</a><br>
	<a href="/ch11/customer/register.do">등록</a>
	
	
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>고객번호</td>
				<td><input type="text" name="custId"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="redate"></td>
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