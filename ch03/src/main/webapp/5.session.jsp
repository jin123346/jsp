<%@page import="sub01.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5.Session</title>
	<%-- 
		날짜 : 2024/08/06
		이름 : 하진희
		내용 : session 내장객체 실습하기
	--%>

</head>
<body>

	<h3>5.Session 내장객체</h3>
	
	<h4>Session Id 확인</h4>
	<p>ticket 고유 발급번호= 브라우저의 쿠키값 </p>
	<%=session.getId() %>
	
	<h4>Session 설정</h4>
	<%
		//브라우저 정보
		String agent = request.getHeader("User-Agent");
	
		if(agent.contains("Edg")){
			//edge 브라우저이면
			UserVO user = new UserVO("a101","김유신",23);
			
			//세션 저장
			session.setAttribute("user", user);
			
		}else{
			//chrome이면
			UserVO user = new UserVO("a102","김춘추",21);
			
			//세션 저장
			session.setAttribute("user", user);
		}
		
		UserVO uservo = (UserVO) session.getAttribute("user");
		
		
	
	%>
	
	<p>
		아이디 : <%= uservo.getUid() %> <br>
		이름 : <%= uservo.getName() %> <br>
		나이 : <%= uservo.getAge()  %> <br>
		
	</p>

</body>
</html>