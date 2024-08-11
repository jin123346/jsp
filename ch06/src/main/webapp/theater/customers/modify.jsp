<%@page import="theater.CustomersVO"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String customter_id= request.getParameter("customter_id");

	CustomersVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/theater");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `customers` where `customter_id`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,customter_id);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setCustomer_id(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setEmail(rs.getString(3));
			vo.setPhone(rs.getString(4));
			
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

	<h3>theater-customer수정</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/theater/customers/register.jsp">등록</a>
	
	
	<form action="/ch06/theater/customers/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>고객번호</td>
				<td><input type="text" name="customer_id" value="<%=vo.getCustomer_id() %>" readonly></td>
			</tr>
			<tr>
				<td>고객이름</td>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=vo.getEmail() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="phone" value="<%=vo.getPhone() %>"></td>
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