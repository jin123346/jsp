<%@page import="sub01.User2VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//select 처리함
	String uid= request.getParameter("uid");
	User2VO vo =null;
	try{//드라이버 로드
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
	
		Connection conn= ds.getConnection();
		//2단계 - SQL 실행객체 생성
		String sql = "select * from `user2` where `uid`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		//3단계 - SQL 실행
		ResultSet rs = pstmt.executeQuery(); 
		//4단계  - 결과처리(Select 일경우)
		
		if(rs.next()){
			vo= new User2VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setAddr(rs.getString(4));
			
	
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	//json 출력  --> application/json 로 변경해야함 
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(vo);
	out.print(jsonData);

%>
