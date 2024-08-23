package com.jboard.controller.article;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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

@WebServlet("/article/delete.do")
public class DeleteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	CommentService commentService = CommentService.INSTANCE;
	ArticleService articleService = ArticleService.INSTANCE;
	FileService fileService = FileService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no = req.getParameter("no");
		logger.debug("no : "+ no);
		int result=0;
		//댓글 삭제 및 파일 삭제 및 게시글 삭제
		int commentresult= commentService.deleteComment(no);
		logger.debug("commentresult"+commentresult);
		
		
		
		logger.debug(result+"");
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		PrintWriter printwriter = resp.getWriter();
		printwriter.print(json);
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
