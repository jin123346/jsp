package com.jboard.service;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.DAO.article.FileDAO;

import com.jboard.dto.FileDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public enum FileService {
	INSTANCE;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	FileDAO dao = FileDAO.getInstance();
	public void insertFile(FileDTO dto) { dao.insertFile(dto);	}
	
	public FileDTO selectfile(String fno) { return dao.selectfile(fno);	}
	
	public List<FileDTO> selectFiles() {	return dao.selectFiles();	}
	
	public void uploadFile() {	dao.uploadFile();}
	public void updateFileDownloadCount(String fno) {dao.updateFileDownloadCount(fno);}
	
	public int deleteFile(String no) { return dao.deleteFile(Integer.parseInt(no));}
	
	public List<FileDTO> fileUpload(HttpServletRequest req) {
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		
		//파일 저장되는 위치 정보 가져오기 
		ServletContext ctx  = req.getServletContext();
		String uploadPath = ctx.getRealPath("/uploads");
		logger.debug("uploadPath : "+uploadPath);
		
		try {
			
			//첨부파일 정보객체 가져오기
			Collection<Part> parts =req.getParts();
			
			//파일 이름이 null이면 일반 txt 파일이고, 파일 이름이 있으면 진짜 파일
			
			for(Part part : parts) {
				String OFname= part.getSubmittedFileName();
				
				if(OFname != null && !OFname.isEmpty()) {
					
					//파일을 첨부했으면 
					logger.debug("OFname : "+OFname);
					
					
					//고유 파일명 생성
					int idx = OFname.lastIndexOf(".");
					String ext = OFname.substring(idx);
					
					String SFname = UUID.randomUUID().toString() + ext;
					logger.debug("OFname : "+OFname+", sFileName : "+SFname);
					
					
					
					//파일 저장 
					part.write(uploadPath+File.separator+SFname);
					
					//dto생성
					FileDTO dto = new FileDTO();
					dto.setoName(OFname);
					dto.setsName(SFname);
					files.add(dto);
					
					
				}
					
			
			}

		
		} catch (IOException | ServletException e) {
			logger.error(e.getMessage());
		}
		
		return files;
	}
	public void fileDownload(HttpServletRequest req, HttpServletResponse resp)  {
		
		FileDTO filedto = (FileDTO) req.getAttribute("filedto");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {

			//response 헤더 정보 수정
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(filedto.getoName(), "utf-8")); //파일명 수정
			resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Pragma", "no-cache");
			resp.setHeader("Cache-Control", "private");
					
					

				//파일 내용 스트림 처리
				ServletContext ctx = req.getServletContext();

				String path = ctx.getRealPath("/uploads");
				File file = new File(path+File.separator+filedto.getsName() );
				
				 bis = new BufferedInputStream(new FileInputStream(file));
				 bos = new BufferedOutputStream(resp.getOutputStream());
				
				bis.transferTo(bos);
				bos.flush();
				
				bos.close();
				bis.close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		
			

		
	}
	
	
	
	
}
