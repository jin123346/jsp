<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>register.jsp</title>
</head>
<body>

	<h3>Product 등록</h3>
	
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/shop/product/register.jsp">등록</a><br>
	
	
	<form action="/ch06/shop/product/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="text" name="prodNo"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodName"></td>
			</tr>
			<tr>
				<td>제품 재고</td>
				<td><input type="text" name="stock"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><input type="date" name="company"></td>
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