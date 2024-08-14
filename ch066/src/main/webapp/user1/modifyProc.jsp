<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String uid= request.getParameter("uid");
	String name= request.getParameter("name");
	String birth= request.getParameter("birth");
	String hp= request.getParameter("hp");
	String age= request.getParameter("age");

	//데이터베이스 수정 처리
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";
	int result=0;


	try{
	//1단계 - 드라이버로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	//1단계 - 데이터베이스 접속
	Connection con= DriverManager.getConnection(host,user,pass);
	//2단계 - SQL 실행객체 생성
	String sql = "update `user1` set `name`=? , `birth` =?, `hp`=?, `age`=? where `uid`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1,name);
	pstmt.setString(2, birth);
	pstmt.setString(3, hp);
	pstmt.setString(4, age);
	pstmt.setString(5, uid);
	
	result = pstmt.executeUpdate();
	
	
	//4단계  - 결과처리(Select 일경우)
	
	//5단계 - 데이터베이스 종료
   		
		pstmt.close();
		con.close();

	}catch(Exception e){
		e.printStackTrace();
	}

	
	
	//목록 이동
	
	if(result==1){
		response.sendRedirect("/ch06/user1/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/user1/list.jsp?modify=fail");
	}
	
	

%>
