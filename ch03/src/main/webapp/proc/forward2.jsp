<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>forward1</title>
</head>
<body>

	<h3>포워드2 페이지</h3>
	
	<%
		//error
		//forward는 자신의 서버안에서 움직임
		pageContext.forward("https://naver.com");
	%>

	

</body>
</html>