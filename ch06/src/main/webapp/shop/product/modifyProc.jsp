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
	
	String prodNo = request.getParameter("prodNo");
	String prodName = request.getParameter("prodName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company  =request.getParameter("company");
		//데이터베이스 수정 처리
	int result=0;


	try{
	Context initCtx = new InitialContext();
	Context ctx  = (Context)initCtx.lookup("java:comp/env");
	//2단계 - SQL 실행객체 생성
	DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	Connection con = ds.getConnection();
	
	
	String sql = "update from `customer` set `prodName` = ? ,`stock`=?, `price`=?  `company` = ? where `prodNo`=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//3단계 - SQL 실행
	pstmt.setString(1,prodNo);
	pstmt.setString(2, prodName);
	pstmt.setString(3, stock);
	pstmt.setString(4, price);
	pstmt.setString(5, company);
	
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
		response.sendRedirect("/ch06/shop/product/list.jsp?modify=sucess");
	}else{
		response.sendRedirect("/ch06/shop/product/list.jsp?modify=fail");
	}
	
	

%>
