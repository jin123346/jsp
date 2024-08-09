<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String uid = request.getParameter("uid");

	String host="jdbc:mysql://127.0.0.1:3306/studydb";
	String user="root";
	String pass="1234";
	int result =0;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(host,user,pass);
		
		String sql  = "delete from `user4` where `uid`=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		result = pstmt.executeUpdate();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(result==1){
		response.sendRedirect("/ch06/user4/list.jsp?delete=sucess");
	}else{
		response.sendRedirect("/ch06/user4/list.jsp?delete=fail");
	}
	


%>
