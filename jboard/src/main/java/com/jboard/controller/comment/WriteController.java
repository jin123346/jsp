package com.jboard.controller.comment;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/comment/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	CommentService commentService = CommentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//폼 데이터 수신  => parent, writer 는 hidden 처리로 하여 데이터를 받아올 수 있다.
		String comment = req.getParameter("comment");
		String parent = req.getParameter("parent");
		String writer = req.getParameter("writer");
		
		
		//db 생성
		CommentDTO dto = new CommentDTO();
		dto.setParent(parent);
		dto.setContent(comment);
		dto.setWriter(writer);
		dto.setRegip(req.getRemoteAddr());
		logger.debug(dto.toString());
		
		//댓글 등록 실패 =0 . insert 성공 =1 
		int pk= commentService.insertComment(dto);
		
		CommentDTO commentdto = commentService.selectComment(pk);
		logger.debug(commentdto.toString());
		
		
		// json 생성 및 출력
//		JsonObject json = new JsonObject();
//		json.addProperty("nick", commentdto.getNick());
//		json.addProperty("date", commentdto.getDate());
//		json.addProperty("content", commentdto.getContent());
		
		//이미 dto에 가지고 있기때문에 Gson으로 json 생성함 
		Gson gson = new Gson();
		String json = gson.toJson(commentdto);
		
		//json 출력  =>  fetch then 에서 data로 들어감
		PrintWriter printWriter = resp.getWriter();
		printWriter.print(json);
		
		
		
		
		
		
//		resp.sendRedirect("/jboard/article/view.do?no="+parent);
	}
}
