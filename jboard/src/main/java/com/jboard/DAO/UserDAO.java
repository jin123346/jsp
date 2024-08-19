package com.jboard.DAO;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jboard.dto.UserDTO;
import com.jboard.util.DBHelper;
import com.jboard.util.SQL;

public class UserDAO extends DBHelper{
	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	
	private UserDAO() {}
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		
		try {
			
			conn = getConnection();
			pstmt= conn.prepareStatement(SQL.INSERT_USER);
			
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNick());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getHp());
			pstmt.setString(7, dto.getZip());
			pstmt.setString(8, dto.getAddr1());
			pstmt.setString(9, dto.getAddr2());
		
			
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}
		
		
		
	}
	public UserDTO selectUser(String uid) { return null;}
	public List<UserDTO> selectUsers() {return null;}
	public void updateUser(UserDTO dto) {}
	public void deleteUser(String uid) {}
	

}
