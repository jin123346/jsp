<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="sub01.User1VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	
	String lecNo = request.getParameter("lecNo");
	String lecName = request.getParameter("lecName");
	String lecCredit = request.getParameter("lecCredit");
	String lecTime = request.getParameter("lecTime");
	String lecClass =request.getParameter("lecClass");
		//데이터베이스 수정 처리
	int result=0;


	try{
	Context initCtx = new InitialContext();
	Context ctx  = (Context)initCtx.lookup("java:comp/env");
	//2단계 - SQL 실행객체 생성
	DataSource ds = (DataSource) ctx.lookup("jdbc/college");
	Connection con = ds.getConnection();
	
	
	String sql = "update from `lecture` set `lecName` = ? ,`lecCredit`=?, `lecTime`=?  `lecClass` = ? where `lecNo`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1,lecNo);
	pstmt.setString(2, lecName);
	pstmt.setString(3, lecCredit);
	pstmt.setString(4, lecTime);
	pstmt.setString(5, lecClass);
	
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
		response.sendRedirect("/ch06/college/lecture/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/college/lecture/list.jsp?modify=fail");
	}
	
	

%>
