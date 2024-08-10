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
		
	String a_no = request.getParameter("a_no");
	String a_item_dis = request.getParameter("a_item_dis");
	String a_item_name = request.getParameter("a_item_name");
	String a_c_no = request.getParameter("a_c_no");
	String a_balance =request.getParameter("a_balance");
	String a_open_date =request.getParameter("a_open_date");
	//데이터베이스 수정 처리
	int result=0;


	try{
	Context initCtx = new InitialContext();
	Context ctx  = (Context)initCtx.lookup("java:comp/env");
	//2단계 - SQL 실행객체 생성
	DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
	Connection con = ds.getConnection();
	
	
	String sql = "update from `bank_account` set `a_item_dis` = ? ,`a_item_name`=?, `a_c_no`=?  `a_balance` = ? , `a_open_date`=? where `a_no`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1, a_item_dis);
	pstmt.setString(2, a_item_name);
	pstmt.setString(3, a_c_no);
	pstmt.setString(4, a_balance);
	pstmt.setString(5, a_open_date);
	pstmt.setString(6, a_no);
	
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
		response.sendRedirect("/ch06/bank/account/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/bank/account/list.jsp?modify=fail");
	}
	
	

%>
