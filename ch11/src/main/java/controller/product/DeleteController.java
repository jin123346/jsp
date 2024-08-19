package controller.product;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

@WebServlet("/product/delete.do")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = -6383548614151362954L;
	
	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 수신
		String prodNo= req.getParameter("prodNo");
		logger.debug("custId : "+prodNo);
		
		//서비스 데이터 삭제
		service.deleteProduct(Integer.parseInt(prodNo));
		//리다이렉트
		resp.sendRedirect("/ch11/product/list.do");
		
	}
	

	
	
}
