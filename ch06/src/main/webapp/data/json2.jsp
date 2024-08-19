<%@page import="com.google.gson.Gson"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	List<User1VO> users = new ArrayList<>();
	
	try{
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
		
		
		//5단계 - 데이터베이스 종료
			rs.close();
			stmt.close();
			conn.close();
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
		
		//System.out.println(users);

		//database에서 가져온 데이터를 json 으로 만들기 
		//json 생성
		Gson gson = new Gson();
		String jsonData = gson.toJson(users);
		
		out.print(jsonData);
		

%>