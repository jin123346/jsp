<%@page import="shop.ProductVO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="shop.CustomerVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String prodNo= request.getParameter("prodNo");

	ProductVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `product` where `prodNo`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,prodNo);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setProdNo(rs.getString(1));
			vo.setProdName(rs.getString(2));
			vo.setStock(rs.getInt(3));
			vo.setPrice(rs.getInt(4));
			vo.setCompany(rs.getString(5));
			
		}
		
		//6단계
		
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify.jsp</title>
</head>
<body>

	<h3>shop-customer수정</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/shop/product/register.jsp">등록</a>
	
	
	<form action="/ch06/shop/product/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="text" name="prodNo" value="<%=vo.getProdNo() %>" readonly></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodName" value="<%=vo.getProdName() %>"></td>
			</tr>
			<tr>
				<td>제품 재고</td>
				<td><input type="text" name="stock" value="<%=vo.getStock() %>"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="text" name="price" value="<%=vo.getPrice() %>"></td>
			</tr>
			<tr>
				<td>회사명</td>
				<td><input type="text" name="company" value="<%=vo.getCompany()%>"></td>
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