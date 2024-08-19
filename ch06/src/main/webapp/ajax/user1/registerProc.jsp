<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//JSON문자열 스트림 처리
	BufferedReader br = request.getReader();
	StringBuilder requestBody = new StringBuilder();
	
	String line;
	while((line=br.readLine())!=null){
		requestBody.append(line);
	}
	
	br.close();
	
	//json 파싱
	Gson gson = new Gson();
	User1VO user1 = gson.formJson(requestBody.toString(),User1VO.class);
	System.out.println(user1);
	
	
	int result=0;
	
	try{//드라이버 로드
		Context ctx  = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
	
		Connection conn= ds.getConnection();
		//2단계 - SQL 실행객체 생성
		String sql = "insert into `user1` values (?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user1.getUid());
		pstmt.setString(2, user1.getName());
		pstmt.setString(3, user1.getBirth());
		pstmt.setString(4, user1.getHp());
		pstmt.setInt(5, user1.getAge());
	
		
		//3단계 - SQL 실행
		result=pstmt.executeUpdate();
		//4단계  - 결과처리(Select 일경우)
		//5단계 - 데이터베이스 종료
	   	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result",result);
	out.print(json.toString());
	
	
	
	//목록이동


	
	
%>