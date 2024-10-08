package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDTO;
import com.jboard.dto.CommentDTO;
import com.jboard.dto.FileDTO;
import com.jboard.service.ArticleService;
import com.jboard.service.CommentService;
import com.jboard.service.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/view.do")
public class ViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	ArticleService articleservice = ArticleService.INSTANCE;
	FileService fileservice = FileService.INSTANCE;
	CommentService commentService = CommentService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		String pg = req.getParameter("pg");
		logger.debug("no : "+no );
		articleservice.updateArticleHit(no);
		
		
		//데이터 조회
		ArticleDTO article = articleservice.selectArticle(Integer.parseInt(no));
		List<CommentDTO> comments = commentService.selectComments(Integer.parseInt(no));
		
		//공유 참조
		req.setAttribute("article", article);
		req.setAttribute("pg",pg );
		req.setAttribute("comments", comments);
		
		//포워드 화면출력
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
