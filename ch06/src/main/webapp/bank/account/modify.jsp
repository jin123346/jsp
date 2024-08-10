<%@page import="bank.Bank_AccountVO"%>
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
	String a_no= request.getParameter("a_no");

	Bank_AccountVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `bank_account` where `a_no`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,a_no);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setA_no(rs.getString(1));
			vo.setA_item_dist(rs.getString(2));
			vo.setA_item_name(rs.getString(3));
			vo.setA_c_no(rs.getString(4));
			vo.setA_balance(rs.getInt(5));
			vo.setA_open_date(rs.getString(6));
			
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
	<a href="/ch06/bank/account/register.jsp">등록</a>
	
	
	<form action="/ch06/bank/account/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>계좌번호</td>
				<td><input type="text" name="a_no" value="<%=vo.getA_no() %>" readonly></td>
			</tr>
			<tr>
				<td>계좌분휴</td>
				<td><input type="text" name="a_item_dist" value="<%=vo.getA_item_dist() %>"></td>
			</tr>
			<tr>
				<td>계좌종류</td>
				<td><input type="text" name="a_item_name" value="<%=vo.getA_item_name() %>"></td>
			</tr>
			<tr>
				<td>주민번호(사업자)</td>
				<td><input type="text" name="a_c_no" value="<%=vo.getA_c_no() %>"></td>
			</tr>
			<tr>
				<td>계좌잔액</td>
				<td><input type="number" name="a_balance" value="<%=vo.getA_balance() %>"></td>
			</tr>
			<tr>
				<td>계좌개설일</td>
				<td><input type="date" name="a_open_date" value="<%=vo.getA_open_date() %>"></td>
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