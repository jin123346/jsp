<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sub01.FileVO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");

//데이터베이스 조회
	FileVO vo =null;
	int result=0;
	String sname=null;

	try{
		
			Context ctx = (Context) new InitialContext().lookup("java:comp/env");
			DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
			
			
			Connection conn = ds.getConnection();
			
			PreparedStatement pstmt = conn.prepareStatement("select sname from `filetest` where `no`= ?");
			pstmt.setString(1, no);
			Statement stmt = conn.createStatement();
			
			ResultSet rs = pstmt.executeQuery();
		
			if(rs.next()){
				sname = rs.getString(1);
			}
			
			
			
			

		
			
			result = stmt.executeUpdate("delete from `filetest` where `no`="+no);
			
			rs.close();
			pstmt.close();
			stmt.close();
			conn.close();
			
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	


	String path = application.getRealPath("/uploads");
	File file = new File(path+File.separator+sname );
	file.delete();
	
	
	
	if(result==1){
	response.sendRedirect("../2.fileDownloadTest.jsp?deleteSuccess");
	
	}else{
	response.sendRedirect("../2.fileDownloadTest.jsp?deleteFail");
	}


%>
