package study2.jstl;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/jstl/El")
public class El extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("address", "busan");
		request.setAttribute("age", 33);
		
		String viewPage = "/WEB-INF/study2/jstl/el.jsp?juso=seoul&nai=22";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
