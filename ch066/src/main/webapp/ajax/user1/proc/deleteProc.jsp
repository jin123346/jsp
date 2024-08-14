<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String uid= request.getParameter("uid");
	int result=0;
	try{//드라이버 로드
		Context ctx  = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
	
		Connection conn= ds.getConnection();
		//2단계 - SQL 실행객체 생성
		String sql = "delete from `user1` where uid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, uid);
	
		
		//3단계 - SQL 실행
		result=pstmt.executeUpdate();
	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result",result);
	out.print(json.toString());
%>