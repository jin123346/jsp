<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.ListenerTest</title>
	<!--  
		날짜	: 2024/08/14
		이름 : 하진희
		내용 : 리스터 실습하기
	-->
</head>
<body>
	<h3>3.Listener</h3>
	
	<%
		String sessUser = (String)session.getAttribute("sessUser");
	
	
	if(sessUser ==null){ //로그인하지않았으면 %>
	<form action="/ch09/login.do" method="post">
		<input type="text" name="uid" placeholder="id 입력"><br>
		<input type="password" name="pass" placeholder="password 입력"><br>
		<input type="submit" value="로그인"><br>
		
	</form>	
	<%}else{  //로그인했으면%>
	<p>
		<%=sessUser %>님 반값습니다.<br>
		<a href="/ch09/logout.do">로그아웃</a>
	</p>
	<%} %>
</body>
</html>