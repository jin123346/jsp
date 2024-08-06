<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉트 페이지</title>
</head>
<body>

	<h3>redirect1 페이지</h3>
	
	<%
		response.sendRedirect("https://naver.com");
	%>

</body>
</html>