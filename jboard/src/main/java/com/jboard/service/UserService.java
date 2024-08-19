package com.jboard.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.DAO.UserDAO;
import com.jboard.dto.UserDTO;

public enum UserService {

	INSTANCE;
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	private UserDAO dao = UserDAO.getInstance();
	
	
	public void insertUser(UserDTO dto) { dao.insertUser(dto);}
	public UserDTO selectUser(String uid) {return  dao.selectUser(uid);}
	public List<UserDTO> selectUsers() { return dao.selectUsers();}
	public void updateUser(UserDTO dto) {dao.updateUser(dto);}
	public void deleteUser(String uid) {dao.deleteUser(uid);}
}
