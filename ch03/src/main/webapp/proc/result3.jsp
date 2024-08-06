<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%
 
    	String uid= request.getParameter("uid");
    	String name= request.getParameter("name");
    	String password = request.getParameter("password");
    	String birth = request.getParameter("birth");
    	String gender = request.getParameter("gender");
    	String[] hobby = request.getParameterValues("hobby");
    	String addr = request.getParameter("addr");
    	
    
    	
    	StringBuilder sb=new StringBuilder();
    	for(String i : hobby){
    		sb.append(i+" ");
    		
    	}
    	String hobbyString= sb.toString();

    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>GET 요청 데이터 수신</h3>
	
	<p>
		
		아이디 : <%=uid %><br>
		이름 : <%=name %><br>
		비밀번호 : <%=password %><br>
		생년월일 : <%=birth %><br>
		성별 : <%=gender.equals("M") ? "남자" : "여자"  %><br>
		취미 : <%=hobbyString %><br>
		취미 : <%
				for(String h :hobby ){
					out.print(h+", ");
				}
				%><br>
		주소 : <%=addr%><br>
		
	</p>
	
	<a href="../1.Request.jsp">뒤로가기</a>

</body>
</html>