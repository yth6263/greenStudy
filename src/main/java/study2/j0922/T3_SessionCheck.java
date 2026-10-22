package study2.j0922;

import java.io.IOException;
import java.util.Enumeration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/T3_SessionCheck")
public class T3_SessionCheck extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionName = "";
		
		Enumeration<String> enumCK = session.getAttributeNames();
		
		while(enumCK.hasMoreElements()) {
			sessionName = enumCK.nextElement();
			
			System.out.println(sessionName + " / " + session.getAttribute(sessionName));
		}
		
		request.setAttribute("sessionName", sessionName + ":" + session.getAttribute(sessionName));
		
		String viewPage = "/WEB-INF/study2/0922_storage/t3_SessionCheck.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
