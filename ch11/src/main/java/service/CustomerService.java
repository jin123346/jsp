package service;

import java.util.List;

import DAO.CustomerDAO;
import dto.CustomerDTO;

public enum CustomerService {

	//열거타입으로 싱글톤 생성
	INSTANCE;
	
	CustomerDAO  dao = CustomerDAO.getinstance();
	
	public void insertCustomer(CustomerDTO dto) {
		dao.insertCustomer(dto);
	}
	public CustomerDTO selectCustomer(String custId) {
		CustomerDTO dto = dao.selectCustomer(custId);
		return dto;}
	public List<CustomerDTO> selectCustomers() {
		List<CustomerDTO> customers = dao.selectCustomers();
		return customers;}
	public void updateCustomer(CustomerDTO dto) {
		dao.updateCustomer(dto);
	}
	public void deleteCustomer(String uid) {
		dao.deleteCustomer(uid);
	}
	
}
