package service;

import java.util.List;

import DAO.User2DAO;
import dto.User2DTO;

public class User2Service{
	private static User2Service instance = new User2Service();
	public static User2Service getInstance() {
		return instance;
	}
	
	private User2Service() {}
	
	private User2DAO dao = User2DAO.getInstance();
	
	public void insertUser2(User2DTO dto) {	
		dao.insertUser2(dto);
	}
	public User2DTO selectUser2(String uid) {
		
		return dao.selectUser2(uid);
	}
	public List<User2DTO> selectUser2s() {	
		List<User2DTO> users2= dao.selectUser2s();
		return users2;
	}
	public void updateUser2(User2DTO dto) {	
		dao.updateUser2(dto);
	}
	public void deleteUser2(String uid) {
		dao.deleteUser2(uid);
	}

	
	

}
