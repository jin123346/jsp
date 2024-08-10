<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="shop.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductVO> products  = new ArrayList<>();

	try{
	//1단계 - JNDI 서비스 객체 생성 
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
	//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds = (DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
	
	//3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
	//4단계 - SQL실행
		ResultSet rs = stmt.executeQuery("select * from `customer`");
	//5단계 - 결과처리
	
		while(rs.next()){
			ProductVO vo = new ProductVO();
			vo.setProdNo(rs.getString(1));
			vo.setProdName(rs.getString(2));
			vo.setStock(rs.getInt(3));
			vo.setPrice(rs.getInt(4));
			vo.setCompany(rs.getString(5));
			products.add(vo);
		}
		//6단계 - 커넥션 반납
		}catch(Exception e){
			e.printStackTrace();
			
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product List</title>
</head>
<body>
	<h3>Product List</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/shop/Product/register.jsp">등록</a>
	
	
	<table border="1">
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>재고수량</th>
			<th>가격</th>
			<th>회사</th>
			<th>관리</th>
		</tr>
		
		<%
			for(ProductVO vo : products){
		%>
		<tr>
			<td><%=vo.getProdNo() %></td>
			<td><%=vo.getProdName() %></td>
			<td><%=vo.getStock() %></td>
			<td><%=vo.getPrice() %></td>
			<td><%=vo.getCompany() %></td>
			<td>
				<a href="/ch06/shop/product/modify.jsp?prodNo=<%=vo.getProdNo() %>">수정</a>
				<a href="/ch06/shop/product/delete.jsp?prodNo=<%=vo.getProdNo() %>#" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>