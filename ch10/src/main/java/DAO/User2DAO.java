package DAO;

import java.util.ArrayList;
import java.util.List;

import dto.User2DTO;
import util.DBHelper;

public class User2DAO extends DBHelper{
	
	private static User2DAO instance = new User2DAO();
	public static User2DAO getInstance() {
		return instance;
	}
	
	private User2DAO() {}
	
	
	public void insertUser2(User2DTO dto) {	
		String sql = "insert into `user2` values (?,?,?,?)";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getAddr());
			
			
			pstmt.executeUpdate();
			closeAll();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public User2DTO selectUser2(String uid) {	
		User2DTO dto = new User2DTO();
		
		return dto;
	}
	public List<User2DTO> selectUser2s() {	
		List<User2DTO> users2 = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();

			rs  = stmt.executeQuery("select * from `user2`");
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setBirth(rs.getString(3));
				dto.setAddr(rs.getString(4));
				users2.add(dto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return users2;
	}
	public void updateUser2(User2DTO dto) {	}
	public void deleteUser2(String uid) {	}

}
