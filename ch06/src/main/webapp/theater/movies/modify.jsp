<%@page import="theater.MoviesVO"%>
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
	String movie_id= request.getParameter("movie_id");

	MoviesVO vo=null;
	try{
		//1단계
		Context initCtx = new InitialContext();
		Context ctx =(Context) initCtx.lookup("java:comp/env");
		
		//2단계
		DataSource ds = (DataSource) ctx.lookup("jdbc/theater");
		Connection conn = ds.getConnection();
		//3단계
		String sql = "select * from `movies` where `movie_id`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,movie_id);

		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			vo.setMovie_id(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setGenre(rs.getString(3));
			vo.setRelease_date(rs.getString(4));
			
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

	<h3>theater-movie 수정</h3>
	
	<a href="/ch06/2.DBCPTest.jsp">처음으로</a><br>
	<a href="/ch06/theater/movies/register.jsp">등록</a>
	
	
	<form action="/ch06/theater/movies/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>영화번호</td>
				<td><input type="number" name="movie_id" value="<%=vo.getMovie_id() %>" readonly></td>
			</tr>
			<tr>
				<td>영화제목</td>
				<td><input type="text" name="title" value="<%=vo.getTitle() %>"></td>
			</tr>
			<tr>
				<td>영화장르</td>
				<td><input type="text" name="genre" value="<%=vo.getGenre() %>"></td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td><input type="date" name="release_date" value="<%=vo.getRelease_date() %>"></td>
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