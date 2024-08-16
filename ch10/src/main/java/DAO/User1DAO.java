package DAO;

import java.util.ArrayList;
import java.util.List;

import dto.User1DTO;
import util.DBHelper;

public class User1DAO extends DBHelper{ //DAO = data access Object

	//싱글톤
	private static User1DAO instance = new User1DAO();
	public static User1DAO getInstance() {
		return instance;
	}
	
	private User1DAO() {}
	
	
	//기본 CRUD 메소드
	public void insertUser1(User1DTO dto) {
		
		String sql = "insert into `user1` set `uid`=?, `name`=? , `birth`=?, `hp`=? , `age`=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getHp());
			pstmt.setInt(5, dto.getAge());
			
			
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public User1DTO selectUser1(String uid) {
		User1DTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from `user1` where `uid`=?");
			
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setHp(rs.getString(4));
				dto.setAge(rs.getString(5));
			}
			closeAll();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<User1DTO> selectUser1s() {
		List<User1DTO> users = new ArrayList<>();
		String sql = "select * from `user1`";
		try {
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				User1DTO dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setHp(rs.getString(4));
				dto.setAge(rs.getString(5));
				
				users.add(dto);
			}
			
			
			
			
			closeAll();
			
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return users;
	}
	
	
	
	public void updateUser1(User1DTO dto) {
		String sql = "update `user1` set name=?,birth=? , hp = ? , age = ? where `uid`=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getBirth());
			pstmt.setString(3,dto.getHp());
			pstmt.setInt(4,dto.getAge());
			pstmt.setString(5,dto.getUid());
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch end
			
	}//update end
	
	
	public void deleteUser1(String uid) {
		String sql = "delete from `user1` where `uid`=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch end
			
	}//delete end
}
