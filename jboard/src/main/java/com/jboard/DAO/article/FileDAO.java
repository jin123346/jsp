package com.jboard.DAO.article;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.FileDTO;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class FileDAO extends DBHelper{
	
	
	private static FileDAO instance = new FileDAO();
	public static FileDAO getInstance() {
		return instance;
	}
	private FileDAO () {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void insertFile(FileDTO dto) {	
		try {
			conn = getConnection();
			pstmt= conn.prepareStatement(SQL.INSERT_FILE);
			pstmt.setInt(1, dto.getAno());
			pstmt.setString(2, dto.getoName());
			pstmt.setString(3, dto.getsName());
		
			
			pstmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
	public FileDTO selectfile(String fno) { 
		FileDTO dto=null;
			try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_FILE);
			pstmt.setString(1, fno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new FileDTO();
				dto.setFno(rs.getInt(1));
				dto.setAno(rs.getInt(2));
				dto.setoName(rs.getString(3));
				dto.setsName(rs.getString(4));
				dto.setDownload(rs.getInt(5));
				dto.setRdate(rs.getString(6));
				
			}
			
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		
		
		return dto;	}
	
	public List<FileDTO> selectFiles() {	return null;	}
	
	public void uploadFile() {	}
	public void updateFileDownloadCount(String fno) {
		
		try {
			
			conn= getConnection();
			pstmt= conn.prepareStatement(SQL.UPLOAD_FILE_DOWNLOAD_COUNT);
			pstmt.setString(1, fno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());

			}
		}
		
		
	}
	public int deleteFile(int ano) {
		int result=0;
		try {
			
			conn= getConnection();
			pstmt= conn.prepareStatement(SQL.DELETE_FILE_ANO);
			pstmt.setInt(1, ano);
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());

			}
		}
		
		return result;
	}
	

}
