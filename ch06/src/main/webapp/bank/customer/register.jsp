<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register.jsp</title>
</head>
<body>

	<h3>Bank customer 등록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/bank/customer/register.jsp">등록</a><br>
	
	
	<form action="/ch06/bank/customer/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="c_no"></td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="c_name"></td>
			</tr>
			<tr>
				<td>계좌분류</td>
				<td><input type="number" name="c_dis"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="c_phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="c_addr"></td>
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