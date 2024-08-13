<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파일 업로드
	//경로 가져오기 application.getRealPath("찾고싶은폴더")
	String saveDirectory = application.getRealPath("/uploads");
	System.out.println("partHeader : "+saveDirectory);


	//파일 업로드 정보 구하기 => form에서 파일 부분의 input name명을 가져옴
	Part part=  request.getPart("fname");
	//part object 는 전송된 파일의 정보객체
	String partHeader = part.getHeader("content-disposition");
	System.out.println("partHeader : "+partHeader);
	
	//파일명 추출
	String[] partHeaders = partHeader.split("filename=");
	System.out.println("partHeaders[0] : "+partHeaders[0] );
	System.out.println("partHeaders[1] : "+partHeaders[1] );

	String originalFname= partHeaders[1].trim().replace("\"", "");
	System.out.println("originalFname : "+originalFname );
	
	//파일 저장 file.separator => 리눅스 배포시 오류방지
	if(!originalFname.isEmpty()){
		part.write(saveDirectory+File.separator+ originalFname);
	}
	
	//파일명 수정 => 중복될 수 없는 파일명으로 수정
	int index = originalFname.lastIndexOf(".");
	String ext = originalFname.substring(index);//확장자
	
	String savedFname = UUID.randomUUID().toString()+ext;
	System.out.println("savedFname : "+savedFname );
	
	
	//파일명 수정
	File oFile= new File(saveDirectory + File.separator + originalFname);
	File sFile= new File(saveDirectory + File.separator + savedFname);
	
	oFile.renameTo(sFile);


	//uuid -> 원래 파일 명으로 변경이 필요하다.
	//form data 수신
	
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");

	//데이터베이스 처리 
	int result=0;
	try{
		//1
		Context ctx  =  (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource)ctx.lookup("jdbc/studydb");
		
		//2단계
		Connection conn = ds.getConnection();
		//3단계
		String sql  = " Insert into `fileTest` set `uid`=?, `name`=? ,`Oname`=?, `Sname` = ? , rdate =Now()";		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, uid);
		pstmt.setString(2,name);
		pstmt.setString(3,originalFname);
		pstmt.setString(4,savedFname);
		
		//4단계
		result = pstmt.executeUpdate();
		
		//6단계
		pstmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(result==1){
		response.sendRedirect("../1.fileUploadTest.jsp?success");
	}else{
		response.sendRedirect("../1.fileUploadTest.jsp?fail");
	}
	

%>
