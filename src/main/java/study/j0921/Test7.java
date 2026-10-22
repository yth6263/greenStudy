package study.j0921;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet({"/Test7", "/t7"})
public class Test7 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// response.sendRedirect(request.getContextPath() + "/study/0921/test7.jsp");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0921/test7.jsp");
		dispatcher.forward(request, response);
	}
	
}
