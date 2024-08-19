<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify.do</title>
</head>
<body>

	<h3>shop-customer수정</h3>
	
	<a href="/ch11/">처음으로</a><br>
	<a href="/ch11/product/register.do">등록</a>	
	
	<form action="#" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="number" name="prodNo" value="${product.prodNo }" readonly></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodName" value="${product.prodName }"></td>
			</tr>
			<tr>
				<td>제품 재고</td>
				<td><input type="number" name="stock" value="${product.stock }"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="number" name="price" value="${product.price }"></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><input type="text" name="company" value="${product.company }"></td>
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