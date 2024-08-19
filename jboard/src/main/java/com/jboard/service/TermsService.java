package com.jboard.service;

import com.jboard.DAO.TermsDAO;
import com.jboard.dto.TermsDTO;

public enum TermsService {

	instance;
	
	private TermsDAO dao = TermsDAO.getInstance();
	public TermsDTO selectTerms() {
		TermsDTO dto = dao.selectTerms();
		
		return dto;
	}
	
	
}
