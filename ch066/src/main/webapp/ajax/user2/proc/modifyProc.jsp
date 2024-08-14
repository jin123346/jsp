<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid= request.getParameter("uid");
	String name= request.getParameter("name");
	String birth= request.getParameter("birth");
	String addr= request.getParameter("addr");
	
	int rowCount=0;
	
	
	try{
		
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn= ds.getConnection();
		
		
		String sql = "update `user2` set name=? , birth=? , addr= ? where uid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, birth);
		pstmt.setString(3, addr);
		pstmt.setString(4, uid);
		
		rowCount= pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	
	json.addProperty("result", rowCount);
	
	out.print(json.toString());

%>