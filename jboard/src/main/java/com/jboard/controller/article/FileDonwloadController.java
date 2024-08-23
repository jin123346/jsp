package com.jboard.controller.article;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.FileDTO;
import com.jboard.service.FileService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/filedownload.do")
public class FileDonwloadController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	FileService fileService = FileService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fno = req.getParameter("fno");
		//파일 조회
		
		FileDTO filedto = fileService.selectfile(fno);
		
		//공유참조 -> filedownload 에 메서드에서 getAttribute 파일 
		req.setAttribute("filedto", filedto);
		logger.debug(filedto.toString());
		
		//파일 다운로드
		fileService.fileDownload(req,resp);
		
		fileService.updateFileDownloadCount(fno);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
