<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register.jsp</title>
</head>
<body>

	<h3>Bank account 등록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/bank/account/register.jsp">등록</a><br>
	
	
	<form action="/ch06/bank/customer/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>계좌번호</td>
				<td><input type="text" name="a_no"></td>
			</tr>
			<tr>
				<td>계좌분류</td>
				<td><input type="text" name="a_item_dist"></td>
			</tr>
			<tr>
				<td>계좌종류</td>
				<td><input type="text" name="a_item_name"></td>
			</tr>
			<tr>
				<td>주민번호(사업자)</td>
				<td><input type="text" name="a_c_no"></td>
			</tr>
			<tr>
				<td>계좌잔액</td>
				<td><input type="number" name="a_balance"></td>
			</tr>
			<tr>
				<td>계좌개설일</td>
				<td><input type="date" name="a_opne_date"></td>
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