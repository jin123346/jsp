<%@page import="college.LectureVO"%>
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
	String lecNo= request.getParameter("lecNo");

	LectureVO vo = null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/college");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `lecture` where `lecNo`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,lecNo);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo = new LectureVO();
			vo.setLecNo(rs.getString(1));
			vo.setLecName(rs.getString(2));
			vo.setLecCredit(rs.getInt(3));
			vo.setLecTime(rs.getInt(4));
			vo.setLecClass(rs.getString(5));
			
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
	<a href="/ch06/college/lecture/register.jsp">등록</a>
	
	
	<form action="/ch06/college/lecture/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>강의번호</td>
				<td><input type="text" name="lecNo" value="<%=vo.getLecNo() %>" readonly></td>
			</tr>
			<tr>
				<td>강의이름</td>
				<td><input type="text" name="LecName" value="<%=vo.getLecName() %>"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="lecCredit" value="<%=vo.getLecCredit() %>"></td>
			</tr>
			<tr>
				<td>강의시간</td>
				<td><input type="text" name="lecTime" value="<%=vo.getLecTime() %>"></td>
			</tr>
			<tr>
				<td>강의실</td>
				<td><input type="text" name="lecClass" value="<%=vo.getLecClass() %>"></td>
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