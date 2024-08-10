<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	
	try{//드라이버 로드
		//1단계
				Context initCtx = new InitialContext();
				Context ctx =(Context) initCtx.lookup("java:comp/env");
				
				//2단계
				DataSource ds = (DataSource) ctx.lookup("jdbc/bank");
				Connection conn = ds.getConnection();
				//3단계
				String sql = "insert into `bank_account` values (?,?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, a_no);
				pstmt.setString(2, a_item_dis);
				pstmt.setString(3, a_item_name);
				pstmt.setString(4, a_c_no);
				pstmt.setString(5, a_balance);
				pstmt.setString(6, a_open_date);
				
				result = pstmt.executeUpdate();
				//5단계
	   	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동

	if(result==1){
		response.sendRedirect("/ch06/bank/account/list.jsp?register=success");
	}else{
		response.sendRedirect("/ch06/bank/account/list.jsp?register=fail");
	}
	
	
	
	
%>