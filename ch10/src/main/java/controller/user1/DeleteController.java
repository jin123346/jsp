package controller.user1;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/customer/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = -6383548614151362954L;

	private User1Service service = User1Service.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 수신
		String uid= req.getParameter("uid");
		//서비스 데이터 삭제
		service.deleteUser1(uid);
		//리다이렉트
		resp.sendRedirect("/ch11/customer/list.do");
		
	}
	

	
	
}
