package com.jboard.service;

import java.util.ArrayList;
import java.util.List;

import com.jboard.DAO.article.ArticleDAO;
import com.jboard.dto.ArticleDTO;
import com.jboard.dto.pageGroupDTO;

public enum ArticleService {
	
	INSTANCE;
	
	ArticleDAO dao = ArticleDAO.getinstance();
	
	//전체 게시물 갯수 구하는 방법 
	public int getLastPageNum(int total) {
		int lastpageNum=0;
		if(total%10 ==0) {
			lastpageNum = total/10;
		}else {
			lastpageNum = total/10 +1;
		}
		return lastpageNum;
	}
	
	//start num 페이지 시작번호(limit)
	public int getStartNum(int currentPage) {
		
		return (currentPage-1)*10;
	}
	
	//현재 페이지 번호 구하기 
	public int getCurrentPage(String pg) {
		int currentpage = 1;
		if(pg!=null) {
			currentpage = Integer.parseInt(pg);
		}
		
		return currentpage;
	}
	
	//현재 페이지 그룹 구하기
	public pageGroupDTO getPageGroup(int currentPage) {
		
		
		int currentpageGroup=(int) Math.ceil(currentPage/10.0);
		int pageGroupStrat = (currentpageGroup-1)*10+1;
		int pageGroupEnd = (currentpageGroup)*10;
		pageGroupDTO  pagegroup = new pageGroupDTO(pageGroupStrat,pageGroupEnd);
		
		return pagegroup;
	}
	
	
	//현재 인덱스 구하기
	public int getStartindex(int total ,int currentPage) {
		int startindex = total - (currentPage-1)*10;
		
		return startindex;
	}
	
	
	
	public int insertArticle(ArticleDTO dto) { return dao.insertArticle(dto);}
	public ArticleDTO selectArticle(int no) {	
		ArticleDTO article=dao.selectArticle(no);
		return article;}
	
	public int selectCountTotal() {
		return dao.selectCountTotal();
	}
	public List<ArticleDTO> selectArticles(int start) {
		List<ArticleDTO> articles = dao.selectArticles(start);
		
		return articles;}
	public void updateArticle(ArticleDTO dto) {	dao.updateArticle(dto);}
	public void updateArticleHit(String no) {	dao.updateArticleHit(no);}
	public int deleteArticle(String no) {	return dao.deleteArticle(Integer.parseInt(no));}

	
}
