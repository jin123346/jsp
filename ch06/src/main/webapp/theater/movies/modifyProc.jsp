<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String movie_id = request.getParameter("movie_id");
	String title = request.getParameter("title");
	String genre = request.getParameter("genre");
	String release_date = request.getParameter("release_date");

	//데이터베이스 수정 처리
	int result=0;


	try{
	Context initCtx = new InitialContext();
	Context ctx  = (Context)initCtx.lookup("java:comp/env");
	//2단계 - SQL 실행객체 생성
	DataSource ds = (DataSource) ctx.lookup("jdbc/theater");
	Connection con = ds.getConnection();
	
	
	String sql = "update from `movies` set `title` = ? ,`genre`=?, `release_date`=?  where `movie_id`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1,title);
	pstmt.setString(2, genre);
	pstmt.setString(3, release_date);
	pstmt.setString(4, movie_id);
	
	result = pstmt.executeUpdate();
	
	
	//4단계  - 결과처리(Select 일경우)
	
	//5단계 - 데이터베이스 종료
   		
		pstmt.close();
		con.close();

	}catch(Exception e){
		e.printStackTrace();
	}

	
	
	//목록 이동
	
	if(result==1){
		response.sendRedirect("/ch06/theater/movies/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/theater/movies/list.jsp?modify=fail");
	}
	
	

%>
