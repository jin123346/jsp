package com.jboard.controller.user;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.UserDTO;
import com.jboard.service.UserService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService service = UserService.getInstnace();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid		= req.getParameter("uid");
		String pass1	= req.getParameter("pass1");
		String pass2	= req.getParameter("pass2");
		String name		= req.getParameter("name");
		String nick 	= req.getParameter("nick");
		String email	= req.getParameter("email");
		String hp 		= req.getParameter("hp");
		String zip		= req.getParameter("zip");
		String addr1	= req.getParameter("addr1");
		String addr2 	= req.getParameter("addr2");
		
		String regip = req.getRemoteAddr();  // ip 주소를 가져옴
		logger.debug(uid);
		
		//DTO 생성 -> 객체 생성
		UserDTO user = new UserDTO();
		
		user.setUid(uid);
		user.setPass(pass1);
		user.setName(name);
		user.setNick(nick);
		user.setEmail(email);
		user.setHp(hp);
		user.setZip(zip);
		user.setAddr1(addr1);
		user.setAddr2(addr2);
		user.setRegip(regip);
		
		
		logger.debug(user.toString());
		
		
		//아이디 중복체크 
		
		
		
		
		
		
		//데이터 전송
		service.insertUser(user);
		
		//리다이렉트
		resp.sendRedirect("/jboard/user/login.do");
		
		
		
		
		
	}
}
