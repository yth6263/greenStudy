package study2.mapping;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class DoController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DoInterface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		System.out.println("uri : " + uri);
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("mapping")) {
			viewPage += "mapping.jsp";
		}
		else if(com.equals("admin")) {
			command = new DoAdminCommand();
			command.execute(request, response);
			viewPage += "admin.jsp";
		}
		else if(com.equals("member")) {
			command = new DoMemberCommand();
			command.execute(request, response);
			viewPage += "member.jsp";
		}
		else if(com.equals("guest")) {
			command = new DoGuestCommand();
			command.execute(request, response);
			viewPage += "guest.jsp";
		}
		else if(com.equals("board")) {
			command = new DoBoardCommand();
			command.execute(request, response);
			viewPage += "board.jsp";
		}
		else if(com.equals("pds")) {
			command = new DoPdsCommand();
			command.execute(request, response);
			viewPage += "pds.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
