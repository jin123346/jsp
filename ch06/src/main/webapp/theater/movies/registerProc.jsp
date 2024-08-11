<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String movie_id = request.getParameter("movie_id");
	String title = request.getParameter("title");
	String genre = request.getParameter("genre");
	String release_date = request.getParameter("release_date");
	
	int result=0;
	
	try{//드라이버 로드
		//1단계
				Context initCtx = new InitialContext();
				Context ctx =(Context) initCtx.lookup("java:comp/env");
				
				//2단계
				DataSource ds = (DataSource) ctx.lookup("jdbc/theater");
				Connection conn = ds.getConnection();
				//3단계
				String sql = "insert into `movies` values (?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,movie_id);

				pstmt.setString(2,title);
				pstmt.setString(3,genre);
				pstmt.setString(4,release_date);
		
				
				result = pstmt.executeUpdate();
				//5단계
	   	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동

	if(result==1){
		response.sendRedirect("/ch06/theater/movies/list.jsp?register=success");
	}else{
		response.sendRedirect("/ch06/theater/movies/list.jsp?register=fail");
	}
	
	
	
	
%>