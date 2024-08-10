<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String prodNo = request.getParameter("prodNo");
	String prodName = request.getParameter("prodName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company  =request.getParameter("company"); // mysql에서 자동으로 처리해주기때문에 굳이 int아니여도 상관없음
	//int age = Integer.parseInt(request.getParameter("age"));
	
	int result=0;
	
	try{//드라이버 로드
		//1단계
				Context initCtx = new InitialContext();
				Context ctx =(Context) initCtx.lookup("java:comp/env");
				
				//2단계
				DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
				Connection conn = ds.getConnection();
				//3단계
				String sql = "insert into `product` values (?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,prodNo);

				pstmt.setString(1,prodName);
				pstmt.setString(2,stock);
				pstmt.setString(3,price);
				pstmt.setString(4,company);
				
				result = pstmt.executeUpdate();
				//5단계
	   	
		
		pstmt.close();
	   	conn.close();
	   
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//목록이동

	if(result==1){
		response.sendRedirect("/ch06/shop/product/list.jsp?register=success");
	}else{
		response.sendRedirect("/ch06/shop/product/list.jsp?register=fail");
	}
	
	
	
	
%>