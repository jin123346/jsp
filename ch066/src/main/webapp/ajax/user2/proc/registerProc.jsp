<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sub01.User2VO"%>
<%@page import="sub01.User1VO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	BufferedReader reader = request.getReader();
	StringBuilder requestBody = new StringBuilder();

	String line;
	while((line = reader.readLine())!=null){
		requestBody.append(line);
	}
	reader.close();
	
	Gson gson = new Gson();
	User2VO user2 = gson.fromJson(requestBody.toString(), User2VO.class);
	System.out.println(user2);
	
	int rowCount=0;
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds  = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		
		String sql = "insert into `user2` set uid=? , name =? ,birth=?, addr=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user2.getUid());
		pstmt.setString(2, user2.getName());
		pstmt.setString(3, user2.getBirth());
		pstmt.setString(4, user2.getAddr());
		
		rowCount=pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", rowCount);
	
	out.print(json.toString());

%>