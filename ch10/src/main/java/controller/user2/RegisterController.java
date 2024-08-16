package controller.user2;

import java.io.IOException;

import dto.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User2Service;

@WebServlet("/user2/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = -2651683800821644616L;
	
	private User2Service service = User2Service.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispater = req.getRequestDispatcher("/WEB-INF/user2/register.jsp");
		dispater.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String uid= req.getParameter("uid");
		String name= req.getParameter("name");
		String birth= req.getParameter("birth");
		String addr= req.getParameter("addr");
		
		User2DTO dto =new User2DTO();

		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setAddr(addr);
		
		service.insertUser2(dto);
		
		resp.sendRedirect("/ch10/user2/list.do");
		
		
		
	}
}
