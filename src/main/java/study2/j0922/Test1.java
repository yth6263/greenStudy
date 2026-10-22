package study2.j0922;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0922/Test1")
public class Test1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 study2의 Test1.java 입니다.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/0922_storage/t1.jsp");
		dispatcher.forward(request, response);
	}
	
}
