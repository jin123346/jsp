<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age =request.getParameter("age"); // mysql에서 자동으로 처리해주기때문에 굳이 int아니여도 상관없음
	//int age = Integer.parseInt(request.getParameter("age"));
	
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";
	int result=0;
	
	try{//드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//1단계 - 데이터베이스 접속
		Connection con= DriverManager.getConnection(host,user,pass);
		//2단계 - SQL 실행객체 생성
		String sql = "insert into `user1` values (?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, uid);
		pstmt.setString(2, name);
		pstmt.setString(3, birth);
		pstmt.setString(4, hp);
		pstmt.setString(5, age);
		
		//3단계 - SQL 실행
		result=pstmt.executeUpdate();
		//4단계  - 결과처리(Select 일경우)
		//5단계 - 데이터베이스 종료
	   	
		
		pstmt.close();
	   	con.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동

	if(result==1){
		response.sendRedirect("/ch06/user3/list.jsp?register=success");
	}else{
		response.sendRedirect("/ch06/user3/list.jsp?register=fail");
	}
	
	
	
	
%>