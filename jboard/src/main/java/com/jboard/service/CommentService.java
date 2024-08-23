package com.jboard.service;

import java.util.List;

import com.jboard.DAO.comment.CommentDAO;
import com.jboard.dto.CommentDTO;

public enum CommentService {

	INSTANCE;
	
	private CommentDAO dao = CommentDAO.getInstance();
	
	// comment 삽입
	public int insertComment(CommentDTO dto) {return dao.insertComment(dto);}
	
	// comment 조회
	public CommentDTO selectComment(int no) {
		CommentDTO dto = dao.selectComment(no);
		return dto;}
	
	//해당 게시글 comment 전체 조회
	public List<CommentDTO> selectComments(int parent) {	
		List<CommentDTO> comments  = dao.selectComments(parent);
		
		return comments;}
	
	// 댓글 수정
	public int updateComment(CommentDTO dto) {	return dao.updateComment(dto);}
	
	//댓글 삭제 
	public int deleteComment(String no) { return dao.deleteComment(no);	}

}
