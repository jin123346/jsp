<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customer::modify</title>
</head>
<body>
	<h3>shop-customer수정</h3>
	
	<a href="/ch11/">처음으로</a><br>
	<a href="/ch11/customer/register.do">등록</a>
	
	
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custId" value="${customer.custId }" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${customer.name }"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="${customer.hp }"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="${customer.addr }"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="redate" value="${customer.redate }"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>

		</table>	
	</form>
	


</body>
</html>