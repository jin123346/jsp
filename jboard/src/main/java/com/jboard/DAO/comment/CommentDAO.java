package com.jboard.DAO.comment;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.CommentDTO;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class CommentDAO extends DBHelper{
	
	private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() {
		return instance;
	}
	
	private CommentDAO() {};
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	// comment 삽입
	

	public int insertComment(CommentDTO dto) {
		
		int pk=0;
		try {
			
			conn=getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_COMMENT,Statement.RETURN_GENERATED_KEYS);//insert 후 자동 생성되는 pk값 리턴하는 옵션
			pstmt.setInt(1, dto.getParent());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getRegip());
			pstmt.executeUpdate();
			rs=pstmt.getGeneratedKeys(); //우리가 설정한 pk값을 가져올 수 있음
			if(rs.next()) {
				pk = rs.getInt(1);
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
		
		return pk;
	}
	
	// comment 조회
	public CommentDTO selectComment(int no) {

		CommentDTO commentdto = null;
		try {
			
			conn=getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_COMMENTS_NO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				commentdto = new CommentDTO();
				commentdto.setNo(rs.getInt(1));
				commentdto.setParent(rs.getString(2));
				commentdto.setContent(rs.getString(3));
				commentdto.setWriter(rs.getString(4));
				commentdto.setRegip(rs.getString(5));
				commentdto.setDate(rs.getString(6));
				commentdto.setNick(rs.getString(7));
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
		
		return commentdto;
	
	}
	
	//해당 게시글 comment 전체 조회

	public List<CommentDTO> selectComments(int parent) {	
		List<CommentDTO> comments = new ArrayList<CommentDTO>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
			
			pstmt.setInt(1, parent);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
			
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setRegip(rs.getString(5));
				dto.setDateSubString(rs.getString(6));
				dto.setNick(rs.getString(7));
				comments.add(dto);	
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
		
		return comments;
		
	}
	
	// 댓글 수정

	public int updateComment(CommentDTO dto) {	
		int result=0;
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNo());
						
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
	
	//댓글 삭제 

	public int deleteComment(String no) {	
		int result=0;
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.DELETE_COMMENT);
			
			pstmt.setString(1, no);
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
