package controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 2053973570967237161L;
	
	private CustomerService service = CustomerService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//로거생성
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		List<CustomerDTO> customers = service.selectCustomers();
		
		//로그 생성
		logger.debug("customer - "+customers);
		
		req.setAttribute("customers", customers);
		
		RequestDispatcher dispatcher =  req.getRequestDispatcher("/WEB-INF/customer/list.jsp");
	 dispatcher.forward(req, resp);
	 
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
