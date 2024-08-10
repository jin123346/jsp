<%@page import="bank.Bank_CustomerVO"%>
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
	String c_no= request.getParameter("c_no");

	Bank_CustomerVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `bank_customer` where `c_no`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,c_no);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setC_no(rs.getString(1));
			vo.setC_name(rs.getString(2));
			vo.setC_dis(rs.getInt(3));
			vo.setC_phone(rs.getString(4));
			vo.setC_addr(rs.getString(5));
			
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
	<a href="/ch06/bank/customer/register.jsp">등록</a>
	
	
	<form action="/ch06/bank/customer/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="c_no" value="<%=vo.getC_no() %>" readonly></td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="c_name" value="<%=vo.getC_name() %>"></td>
			</tr>
			<tr>
				<td>고객분류</td>
				<td><input type="number" name="c_dis" value="<%=vo.getC_dis() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="c_addr" value="<%=vo.getC_phone() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getC_addr() %>"></td>
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