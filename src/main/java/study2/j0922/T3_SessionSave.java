package study2.j0922;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/T3_SessionSave")
public class T3_SessionSave extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "guest" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "guest" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "guest" : request.getParameter("name");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", nickName);
		session.setAttribute("sName", name);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('세션이 저장 되었습니다.');");
		out.println("location.href = '"+request.getContextPath()+"/T3_Session';");
		out.println("</script>");
	}
	
}
