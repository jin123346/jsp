package controller.product;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

@WebServlet("/product/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 1447710284933673809L;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProductService service = ProductService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/product/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodNo= req.getParameter("prodNo");
		String prodName= req.getParameter("prodName");
		String stock= req.getParameter("stock");
		String price= req.getParameter("price");
		String company= req.getParameter("company");
		
		ProductDTO dto = new ProductDTO();
		
		dto.setProdNo(Integer.parseInt(prodNo));
		dto.setProdName(prodName);
		dto.setStock(Integer.parseInt(stock));
		dto.setPrice(Integer.parseInt(price));
		dto.setCompany(company);
		
		logger.debug(dto.toString());
		
		service.insertProduct(dto);
		
		resp.sendRedirect("/ch11/product/list.do");
		
	}

}
