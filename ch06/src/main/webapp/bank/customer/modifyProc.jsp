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
		
	String c_no = request.getParameter("c_no");
	String c_name = request.getParameter("c_name");
	String c_dis = request.getParameter("c_dis");
	String c_phone = request.getParameter("c_phone");
	String c_addr =request.getParameter("c_addr");
	//데이터베이스 수정 처리
	int result=0;


	try{
	Context initCtx = new InitialContext();
	Context ctx  = (Context)initCtx.lookup("java:comp/env");
	//2단계 - SQL 실행객체 생성
	DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
	Connection con = ds.getConnection();
	
	
	String sql = "update from `bank_customer` set `c_name` = ? ,`c_dis`=?, `c_phone`=?  `c_addr` = ? where `c_no`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1,c_name);
	pstmt.setString(2, c_dis);
	pstmt.setString(3, c_phone);
	pstmt.setString(4, c_addr);
	pstmt.setString(5, c_no);
	
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
		response.sendRedirect("/ch06/bank/customer/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/bank/customer/list.jsp?modify=fail");
	}
	
	

%>
