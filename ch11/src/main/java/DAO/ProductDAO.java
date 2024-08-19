package DAO;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import util.DBHelper;

public class ProductDAO extends DBHelper{

	private static ProductDAO instance = new ProductDAO();
	
	private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private ProductDAO() {}
	
	public void insertProduct(ProductDTO dto) {
		String sql = "insert into `product` values (?,?,?,?,?)";
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getProdNo());
			pstmt.setString(2, dto.getProdName());
			pstmt.setInt(3, dto.getStock());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getCompany());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
	public List<ProductDTO> selectProducts() { 
		List<ProductDTO> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `product`");
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				products.add(dto);
			}
			
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return products;
	}
	public ProductDTO selectProduct(int prodNo) {
		ProductDTO dto = null;
		
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement("select * from `product` where prodNo = ?");
			
			pstmt.setInt(1, prodNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
			
			}
			
			closeAll();
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		
		return dto; }
	public void updateProduct(ProductDTO dto) {
		String sql = "update `product` set prodName= ? , stock=? , price=?, company =? where prodNo=?";
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProdName());
			pstmt.setInt(2, dto.getStock());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getCompany());
			pstmt.setInt(5, dto.getProdNo());
			
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	public void deleteProduct(int prodNo) {
		
		String sql = "delete from `product` where prodNo = ?";
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, prodNo);
			
			pstmt.executeUpdate();
			
			closeAll();
			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	
}
