<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String lecNo = request.getParameter("lecNo");

	int result =0;

	try{
		//1단계 - JNDI 서비스 객체 생성 
				Context initCtx = new InitialContext();
				Context ctx =(Context) initCtx.lookup("java:comp/env");
			//2단계 - 커넥션 풀에서 커넥션 객체 가져오기
				DataSource ds = (DataSource)ctx.lookup("jdbc/college");
				Connection conn = ds.getConnection();
			
		String sql  = "delete from `lecture` where `lecNo`=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lecNo);
		
		result = pstmt.executeUpdate();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(result==1){
		response.sendRedirect("/ch06/college/lecture/list.jsp?delete=sucess");
	}else{
		response.sendRedirect("/ch06/college/lecture/list.jsp?delete=fail");
	}
	


%>
