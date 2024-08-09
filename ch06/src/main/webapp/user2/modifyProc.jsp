<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid =request.getParameter("uid");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String addr=request.getParameter("addr");
	
	
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
		String sql = "update `user2` set `name`=? , `birth` =?, `addr`=? where `uid`=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		//3단계 - SQL 실행
		pstmt.setString(1,name);
		pstmt.setString(2, birth);
		pstmt.setString(3, addr);
		pstmt.setString(4, uid);
		
		result = pstmt.executeUpdate();
		
		
		//4단계  - 결과처리(Select 일경우)
		
		//5단계 - 데이터베이스 종료
	   		
			pstmt.close();
			con.close();
	
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	if(result==1){
		response.sendRedirect("/ch06/user2/list.jsp?modify=success");
	}else{
		response.encodeRedirectURL("/ch06/user2/list.jsp?modify=fail");
	}




%>