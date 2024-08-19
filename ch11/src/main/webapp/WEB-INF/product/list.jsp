<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product List</title>
</head>
<body>
	<h3>Product List</h3>
	
	<a href="/ch11/">처음으로</a><br>
	<a href="/ch11/product/register.do">등록</a>
	
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>재고수량</th>
			<th>가격</th>
			<th>회사</th>
			<th>관리</th>
		</tr>
		<c:forEach var="product" items="${products }" >
			<tr>
				<td>${product.prodNo }</td>
				<td>${product.prodName }</td>
				<td>${product.stock }</td>
				<td>${product.price }</td>
				<td>${product.company }</td>
				<td>
					<a href="/ch11/product/modify.do?prodNo=${product.prodNo }">수정</a>
					<a href="/ch11/product/delete.do?prodNo=${product.prodNo }" class="del">삭제</a>
				</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>