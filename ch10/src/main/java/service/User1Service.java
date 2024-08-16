package service;

import java.util.List;

import DAO.User1DAO;
import dto.User1DTO;

public class User1Service {
	
	private static User1Service  instance  = new User1Service();
	public static User1Service getInstance() {
		return instance;
	}
	
	private User1Service() {}
	
	//DAO 인스턴스 생성
	private User1DAO dao = User1DAO.getInstance();
	
	
	//각 메소드에 dao의 메소드를 불러옴 
	public void insertUser1(User1DTO dto) {
		dao.insertUser1(dto);
				
		
	}
	
	public User1DTO selectUser1(String uid) {
		User1DTO dto = dao.selectUser1(uid);
		return dto;
	}
	
	public List<User1DTO> selectUser1s() {
		 List<User1DTO> users =dao.selectUser1s();
		return users;
	}
	
	
	
	public void updateUser1(User1DTO dto) {
		dao.updateUser1(dto);
		
	}
	
	public void deleteUser1(String uid) {
		dao.deleteUser1(uid);
		}
	
	
	
	
	
	

}
