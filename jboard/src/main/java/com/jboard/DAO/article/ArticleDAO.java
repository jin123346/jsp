package com.jboard.DAO.article;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.ArticleDTO;
import com.jboard.dto.FileDTO;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class ArticleDAO extends DBHelper {
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getinstance() {
		return instance;
	}
	
	private ArticleDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int  insertArticle(ArticleDTO dto) {
		int ano=0;
		try {
			
			conn= getConnection();
			stmt =conn.createStatement();
			conn.setAutoCommit(false);
			pstmt= conn.prepareStatement(SQL.insert_article);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContents());
			pstmt.setInt(3, dto.getFile());
			pstmt.setString(4, dto.getWriter());
			pstmt.setString(5, dto.getRegip());
			
			pstmt.executeUpdate();
			
			rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
			if(rs.next()) {
				ano= rs.getInt(1);
			}
			
			conn.commit();
			
			
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			
			try {
				closeAll();
				conn.rollback();
			} catch (SQLException e) {
				logger.error(e.getMessage());

			}
			
		}
		
		return ano;
		
	}
	public ArticleDTO selectArticle(int no) {	
		ArticleDTO dto=null;
		List<FileDTO> files = new ArrayList<FileDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_ARTICLE_NO);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				//파일이 최대 2개이기때문에 두번 객체가 생성되지 않도록 조건을 걸어줌 
				if(dto==null) {
					dto=new ArticleDTO();
					dto.setNo(rs.getInt(1));
					dto.setCate(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContents(rs.getString(4));
					dto.setComment(rs.getInt(5));
					dto.setFile(rs.getInt(6));
					dto.setHit(rs.getInt(7));
					dto.setWriter(rs.getString(8));
					dto.setRegip(rs.getString(9));
					dto.setRdate(rs.getString(10));
				}
				
				FileDTO filedto = new FileDTO();
				filedto.setFno(rs.getInt(11));
				filedto.setAno(rs.getInt(12));
				filedto.setoName(rs.getString(13));
				filedto.setsName(rs.getString(14));
				filedto.setDownload(rs.getInt(15));
				filedto.setRdate(rs.getString(16));
				files.add(filedto);
				
				}
			dto.setFiles(files);
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
			try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return dto;
	}
	
	
	public int selectCountTotal() {
		int count=0;
		
		try {
			conn = getConnection();
			stmt= conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_COUNT_TOTAL);
			
			if(rs.next()) {
				count= rs.getInt(1);
			}
		}catch(Exception e){
			logger.error(e.getMessage());
		}finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
			
		}
		
		return count;
	}
	public List<ArticleDTO> selectArticles(int start)  {
		List<ArticleDTO> articles = new ArrayList<ArticleDTO>();
		
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
			pstmt.setInt(1, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO dto = new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setCate(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContents(rs.getString(4));
				dto.setComment(rs.getInt(5));
				dto.setFile(rs.getInt(6));
				dto.setHit(rs.getInt(7));
				dto.setWriter(rs.getString(8));
				dto.setRegip(rs.getString(9));
				dto.setRdateSubString(rs.getString(10));
				dto.setNick(rs.getString(11));
				articles.add(dto);
				
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
		
		
		
		
		return articles;}
	public void updateArticle(ArticleDTO dto) {	}
	public int deleteArticle(int no) {
		int result=0;
		try {
			conn = getConnection();
			pstmt.setInt(1, no);
			
			result= pstmt.executeUpdate();
			
		}catch (Exception e) {
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
	
	public int updateArticleHit(String no) {
		int result=0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
			pstmt.setString(1, no);
			
			result= pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
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
