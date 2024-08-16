package sub3;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {


	private static final long serialVersionUID = 3995060801990611933L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid=req.getParameter("uid");
		String pass=req.getParameter("pass");
		//현재 세션 구하기 
		HttpSession session = req.getSession();
		
		
		//사용자가 a101이고 비밀번호가 1234라고 가정함
		if(uid.equals("a101") && pass.equals("1234")) {
			//회원일 경우
			//session - 클라이언트 객체 
			
			session.setAttribute("sessUser", uid);
			
			//메인이동
			resp.sendRedirect("/ch09/3.ListenerTest.jsp?success=200");
			
					
		}else {
			//회원이 아닐경우
			resp.sendRedirect("/ch09/3.ListenerTest.jsp?success=100");
		}
	}
}
