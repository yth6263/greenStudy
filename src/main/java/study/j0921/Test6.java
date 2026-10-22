package study.j0921;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test6")
public class Test6 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0921/test6.jsp");
//		dispatcher.forward(request, response);
		
		String viewPage = "/study/0921/test6.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
		
	}
	
}
