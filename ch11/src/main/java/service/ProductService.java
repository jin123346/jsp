package service;

import java.util.List;

import DAO.ProductDAO;
import dto.ProductDTO;

//enum에서 instance 할 수 있음 ***
public enum ProductService {
	
	INSTANCE;
	
	private ProductDAO dao = ProductDAO.getInstance();
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	public List<ProductDTO> selectProducts() { 
		List<ProductDTO> products = dao.selectProducts();
		return products;}
	public ProductDTO selectProduct(int prodNo) {
		ProductDTO dto = dao.selectProduct(prodNo);
		return dto; }
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
	}
	public void deleteProduct(int prodNo) {
		dao.deleteProduct(prodNo);
	}
}
