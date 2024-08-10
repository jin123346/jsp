<%@page import="college.StudentVO"%>
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
	String stdNo= request.getParameter("stdNo");

	StudentVO vo = null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/college");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `student` where `stdNo`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,stdNo);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo = new StudentVO();
			vo.setStdNo(rs.getString(1));
			vo.setStdName(rs.getString(2));
			vo.setStdName(rs.getString(3));
			vo.setStdYear(rs.getString(4));
			vo.setStdAddress(rs.getString(5));
			
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
	<a href="/ch06/college/student/register.jsp">등록</a>
	
	
	<form action="/ch06/college/student/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>학생번호</td>
				<td><input type="text" name="stdNo" value="<%=vo.getStdNo() %>" readonly></td>
			</tr>
			<tr>
				<td>학생이름</td>
				<td><input type="text" name="stdName" value="<%=vo.getStdName() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="stdHp" value="<%=vo.getStdHp() %>"></td>
			</tr>
			<tr>
				<td>입학년도</td>
				<td><input type="text" name="stdYear" value="<%=vo.getStdYear() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="stdAddress" value="<%=vo.getStdAddress() %>"></td>
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