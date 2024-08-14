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
	List<User1VO> users = new ArrayList<>();	
	try{//드라이버 로드
		Context ctx  = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
	
		Connection conn= ds.getConnection();
		//2단계 - SQL 실행객체 생성
		String sql = "select * from `user1`";
		Statement stmt = conn.createStatement();
		
		//3단계 - SQL 실행
		ResultSet rs = stmt.executeQuery(sql); 
		//4단계  - 결과처리(Select 일경우)
		
		while(rs.next()){
			User1VO vo= new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setBirth(rs.getString(3));
			vo.setHp(rs.getString(4));
			vo.setAge(rs.getInt(5));
		
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}

	
	//json 출력  --> application/json 로 변경해야함 
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(users);
	out.print(jsonData);

%>
