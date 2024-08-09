<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 해제(현재 클라이언트 세션 정보 초기화)
	//session.removeAttribute("sessUser"); -> 아래의 invalidate로 한번에 처리
	session.invalidate();
	
	//로그아웃시 쿠키 삭제 
	Cookie autoCookie= new Cookie("auto",null);
		autoCookie.setMaxAge(0);  		
		autoCookie.setPath("/ch05"); 
		response.addCookie(autoCookie); 
	
	response.sendRedirect("./login.jsp?logout=success");
	
%>
