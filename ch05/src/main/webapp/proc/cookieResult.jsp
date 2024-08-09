<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cookieResult</title>
</head>
<body>

	<h3>쿠키확인</h3>
	
	<%
		//request 기본적으로 쿠키를 가지고 요청 
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies){
	
	%>
	<p>
		쿠키명 : <%=cookie.getName() %> <br>
		쿠키값 : <%=cookie.getValue() %> <br>
	</p>
	<%
		}
	%>
	<!-- 
		- a 태그 링크는 GET요청 
		- 1분 후에 쿠키를 확인하면 pass 쿠키는 확인안됨(유효기간(max-age) 만료됨)
		- 
		
	 -->
	<a href="../1.cookieTest.jsp"></a>
</body>
</html>