package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do")
public class GreetingServlet extends HttpServlet{

	private static final long serialVersionUID = 7256300011072658008L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트의 요청이 Get일 때 
				System.out.println("Greeting doGet....");
				
				
				//HTML출력
				resp.setContentType("text/html;charset=utf-8");
				PrintWriter writer= resp.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset=\"UTF-8\">");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<h3>Greeting</h3>");
				writer.println("<a href='/ch09/1.ServletTest.jsp'>Servlet 메인</a><br>");
				writer.println("<a href='/ch09/hello.do'>hello.do</a><br>");
				writer.println("<a href='/ch09/welcome.do'>welcome</a><br>");
				writer.println("<a href='/ch09/greeting.do'>greeting</a><br>");
				writer.println("</body>");
				writer.println("</html>");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트의 요청이 Post일 때 
				System.out.println("Greeting doPost....");
	}
}
