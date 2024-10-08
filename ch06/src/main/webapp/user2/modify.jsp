<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="sub01.User2VO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

//데이터베이스 정보
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";
	User2VO vo=null;
	try{
		//1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host,user,pass);
		//3단계
		String sql = "select * from `user2` where `uid`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,uid);

		//4단계
		ResultSet rs = pstmt.executeQuery();
		
		//5단계
		if(rs.next()){
			vo = new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));
		}
		//6단계
		rs.close();
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
<title>User2-수정</title>
</head>
<body>
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a><br>
	<a href="/ch06/user2/register.jsp">등록</a><br>
	
	
	<form action="/ch06/user2/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%=vo.getUid() %>" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" value="<%=vo.getBirth() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr() %>"></td>
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