package controller;

import java.io.IOException;

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

@WebServlet("/customer/register.do")
public class RegisterController extends HttpServlet{
	private static final long serialVersionUID = 2053973570967237161L;
	
	private CustomerService service  = CustomerService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger("RegisterController");

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 RequestDispatcher dispatcher =  req.getRequestDispatcher("/WEB-INF/customer/register.jsp");
	 dispatcher.forward(req, resp);
	 
	 
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String custId = req.getParameter("custId");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String addr = req.getParameter("addr");
		String redate = req.getParameter("redate");
		
		logger.debug("custId : "+custId);
		logger.debug("name : "+name);
		logger.debug("redate : "+redate);
		
		CustomerDTO dto = new CustomerDTO();
		
		dto.setCustId(custId);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAddr(addr);
		dto.setRedate(redate);
		
		//System.out.println(dto);   => 권장되지않음 (메모리 사용률 높음)  
		//배포시에는 제거해줘야함 
		
		logger.info(dto.toString());
		
		
		//서비스 실행
		
		service.insertCustomer(dto);
		
		resp.sendRedirect("/ch11/customer/list.do");
		
		
		
	}

}
