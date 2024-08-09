<%@page import="jakarta.websocket.Session"%>
<%@page import="sub1.UserVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	String auto = request.getParameter("auto");
	
	//데이터베이스 작업 생략(1~6단계)
	
	

	
	//회원 abc123 /1234  라고 가정 
	if(uid.equals("abc123") && pass.equals("1234")){
		//자동로그인 처리
		if(auto!=null){
			Cookie autoCookie= new Cookie("auto",uid);
			autoCookie.setMaxAge(60*3);  // 갱신기간
			autoCookie.setPath("/ch05"); // 쿠키 경로 - 해당하는 페이지하위에서 참조가능
			response.addCookie(autoCookie); 

		}
		
		//회원이 맞을경우 -> 사용자 객체 생성후 세션 저장
		UserVO userVO =new UserVO();
		userVO.setUid("abc123");
		userVO.setPass("1234");
		userVO.setName("홍길동");
		userVO.setAge(23);
		//원래라면 DB에서 가져온 데이터를 get해서 가져와야함 => 현재는 데이터베이스 연결안한다는 가정하게 
				
		session.setAttribute("sessUser", userVO);
		
		//로그인 성공후 이동할 페이지로 이동
		response.sendRedirect("./loginSuccess.jsp");
		
	}else{
		//회원이 아닐경우 
		response.sendRedirect("./login.jsp?success=100");
		//실패를 나타내는 쿼리를 가지고 이동함 
		
		
		
		
		
	}
	
	
%>