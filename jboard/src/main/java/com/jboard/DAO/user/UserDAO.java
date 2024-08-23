package com.jboard.DAO.user;

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
	
	
	
	public int selectCountUser(String type,String value) {
		int result=0;
		
		StringBuilder sql = new StringBuilder(SQL.SELECT_COUNT_USER);
		
		if(type.equals("uid")) {
			sql.append(SQL.WHERE_UID);
		}else if(type.equals("nick")) {
			sql.append(SQL.WHERE_NICK);
		}else if(type.equals("email")) {
			sql.append(SQL.WHERE_EMAIL);
		}else if(type.equals("hp")) {
			sql.append(SQL.WHERE_HP);
		}
		
		try {
			
			conn = getConnection();
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setString(1, value);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				result= rs.getInt(1);
			}
			
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	
	
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
			pstmt.setString(10, dto.getRegip());
		
			
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}
		
		
		
	}
	public UserDTO selectUser(String uid,String pass) {
		UserDTO user = null;
		
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(SQL.SELECT_USER);
			pstmt.setString(1, uid);
			pstmt.setString(2, pass);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserDTO();
				
				user.setUid(rs.getString(1));
				user.setPass(rs.getString(2));
				user.setName(rs.getString(3));
				user.setNick(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setHp(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setZip(rs.getString(8));
				user.setAddr1(rs.getString(9));
				user.setAddr2(rs.getString(10));
				user.setRegip(rs.getString(11));
				user.setRegdate(rs.getString(12));
				user.setLeavedate(rs.getString(13));
				
			}
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		
		
		return user;}
	public List<UserDTO> selectUsers() {return null;}
	public void updateUser(UserDTO dto) {}
	public void deleteUser(String uid) {}
	

}
