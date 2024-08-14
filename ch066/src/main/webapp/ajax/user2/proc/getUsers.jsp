<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub01.User2VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<User2VO> users2 = new ArrayList<>();

	try{//드라이버 로드
		Context ctx  = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn= ds.getConnection();
		
		//2단계 - SQL 실행객체 생성
		String sql = "select * from `user2`";
		Statement stmt = conn.createStatement();
		
		
		//3단계 - SQL 실행
		ResultSet rs = stmt.executeQuery(sql); 
		//4단계  - 결과처리(Select 일경우)
		
		while(rs.next()){
			User2VO vo= new User2VO();
			
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));
		
			users2.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(users2);
	out.print(jsonData);





%>