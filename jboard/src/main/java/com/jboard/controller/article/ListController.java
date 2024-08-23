package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDTO;
import com.jboard.dto.UserDTO;
import com.jboard.dto.pageGroupDTO;
import com.jboard.service.ArticleService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String pg= req.getParameter("pg");
			String no = req.getParameter("no");
			
			//현재 페이지 번호
			int currentPage = service.getCurrentPage(pg);
			//현재페이지 그룹 구하기 
			pageGroupDTO pagegroup = service.getPageGroup(currentPage);
			
			
			
			//전체 게시물 갯수 구하기
			int total = service.selectCountTotal();
			logger.debug("total : "+total);
			
			//마지막 페이지 번호 구하기
			 int lastPageNum = service.getLastPageNum(total);
			 logger.debug("lastPageNum : "+lastPageNum);
			 
			 
			 //현재 페이지 인덱스 구하기 	
			 int startIndex = service.getStartindex(total, currentPage);
			 
			 //페이지 시작 번호 구하기
			 int start=service.getStartNum(currentPage);
		
			//데이터 조회
			List<ArticleDTO> articles = service.selectArticles(start);
			
			
			
			
	
			
			
			//공유 참조
			req.setAttribute("articles", articles);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pagegroup", pagegroup);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("startIndex", startIndex);
			req.setAttribute("currentPage", currentPage);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
			dispatcher.forward(req, resp);
			
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
	}
}
