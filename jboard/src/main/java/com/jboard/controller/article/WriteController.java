package com.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDTO;
import com.jboard.dto.FileDTO;
import com.jboard.service.ArticleService;
import com.jboard.service.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	ArticleService articleservice = ArticleService.INSTANCE;
	FileService fileservice = FileService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String regip = req.getRemoteAddr();

		
	//	session으로 가져올 수 있는 방법도 있다. 	=> 하지만 input hidden을 사용하여 value값을 가져오는걸로 
	//	HttpSession session = req.getSession();
	//	UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
	//	String writer= sessUser.getUid();

		//파일 업로드 
		List<FileDTO> files=  fileservice.fileUpload(req);
		
		//객체 생성 
		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContents(content);
		dto.setRegip(regip);
		dto.setWriter(writer);
		dto.setFile(files.size());
		
		
		logger.debug(dto.toString());
		
		//글 등록
		int ano = articleservice.insertArticle(dto);
		
		//파일 등록
		for(FileDTO file : files) {
			file.setAno(ano);
			fileservice.insertFile(file);
			}
				
		resp.sendRedirect("/jboard/article/list.do?success=300");
		
		
		
	}
}
