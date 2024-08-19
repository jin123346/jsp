package com.jboard.controller.user;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.TermsDTO;
import com.jboard.service.TermsService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	TermsService service = TermsService.instance;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TermsDTO terms = service.selectTerms();
		
		req.setAttribute("terms", terms);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/terms.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
