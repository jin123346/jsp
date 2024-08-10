<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="shop.CustomerVO"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String custId= request.getParameter("custId");

	CustomerVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `customer` where `custId`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,custId);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setCustId(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAddr(rs.getString(4));
			vo.setrdate(rs.getString(5));
			
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
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	
	
	<form action="/ch06/shop/customer/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custId" value="<%=vo.getCustId() %>" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=vo.getHp() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr() %>"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="text" name="addr" value="<%=vo.getrdate() %>"></td>
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