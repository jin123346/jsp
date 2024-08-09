<%@page import="sub1.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 사용자정보조회
	UserVO user=(UserVO) session.getAttribute("sessUser");
	
	//로그인을 하지않고 요청했을 경우
	if(user ==null){
		response.sendRedirect("./login.jsp?success=200");
		return;
	}
	


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginSuccess</title>
</head>
<body>
	<h3>로그인 성공</h3>
	
	<p>
		<%=user.getName() %>님 반갑습니다.<br>
		<a href="./logout.jsp">로그아웃</a>
	</p>

</body>
</html>