<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String stdNo = request.getParameter("stdNo");
	String stdName = request.getParameter("stdName");
	String stdHp = request.getParameter("stdHp");
	String stdYear = request.getParameter("stdYear");
	String stdAddress =request.getParameter("stdAddress"); // mysql에서 자동으로 처리해주기때문에 굳이 int아니여도 상관없음
	//int age = Integer.parseInt(request.getParameter("age"));
	
	int result=0;
	
	try{//드라이버 로드
		//1단계
				Context initCtx = new InitialContext();
				Context ctx =(Context) initCtx.lookup("java:comp/env");
				
				//2단계
				DataSource ds = (DataSource) ctx.lookup("jdbc/college");
				Connection conn = ds.getConnection();
				//3단계
				String sql = "insert into `student` values (?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,stdNo);

				pstmt.setString(2,stdName);
				pstmt.setString(3,stdHp);
				pstmt.setString(4,stdYear);
				pstmt.setString(5,stdAddress);
				
				result = pstmt.executeUpdate();
				//5단계
	   	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동

	if(result==1){
		response.sendRedirect("/ch06/college/student/list.jsp?register=success");
	}else{
		response.sendRedirect("/ch06/college/student/list.jsp?register=fail");
	}
	
	
	
	
%>