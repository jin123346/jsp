package DAO;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import util.DBHelper;

public class CustomerDAO extends DBHelper {
	
	private static CustomerDAO instance = new CustomerDAO();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public static CustomerDAO getinstance() {
		return instance;
	}
	
	
	private CustomerDAO() {}

	public void insertCustomer(CustomerDTO dto) {
		
		String sql = "insert into `customer` values (?,?,?,?,?)";
		try {
			conn= getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getRedate());
			
			pstmt.executeUpdate();
			closeAll();

		} catch (Exception e) {

			logger.error(e.getMessage());
		}
		
		
	}
	public CustomerDTO selectCustomer(String custId) { 
		String sql = "select * from `customer` where custId = ?";
		CustomerDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, custId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new CustomerDTO();
				
				dto.setCustId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dto.setRedate(rs.getString(5));
			}
			
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		
		return dto;}
	public List<CustomerDTO> selectCustomers() {
		List<CustomerDTO> customers =new ArrayList<>();
		
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `customer`");
			
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setCustId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAddr(rs.getString(4));
				dto.setRedate(rs.getString(5));
				
				customers.add(dto);
				
			}
			
			
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	
		return customers;}
	public void updateCustomer(CustomerDTO dto) {
		
		String sql = "update `customer` set name=?, hp=?, addr=? ,redate=? where custId=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getRedate());
			pstmt.setString(5, dto.getCustId());
			
			pstmt.executeUpdate();
			
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void deleteCustomer(String custId) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from `customer` where custId=?");
			pstmt.setString(1, custId);
			
			pstmt.executeUpdate();
			
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
}
