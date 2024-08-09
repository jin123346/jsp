<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid= request.getParameter("uid");
	String name= request.getParameter("name");
	String birth= request.getParameter("birth");
	String addr= request.getParameter("addr");
	
	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";
	int result = 0 ;
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(host,user,pass);
		
		String sql = "insert into `user2` values( ?,?,?,?)";
		
		PreparedStatement pstmt= con.prepareStatement(sql);
		pstmt.setString(1, uid);
		pstmt.setString(2, name);
		pstmt.setString(3, birth);
		pstmt.setString(4, addr);
		
		
		result  = pstmt.executeUpdate();
		
	}catch(Exception e){
		
	}

	
	if(result==1){
		response.sendRedirect("/ch06/user2/list.jsp?insert=success");
	}else{
		response.encodeRedirectURL("/ch06/user2/list.jsp?insert=fail");
	}

%>