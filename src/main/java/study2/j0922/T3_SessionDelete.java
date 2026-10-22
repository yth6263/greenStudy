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
@WebServlet("/T3_SessionDelete")
public class T3_SessionDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		
		// 닉네임 세션 삭제
		session.removeAttribute("sNickName");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('세션 닉네임이 삭제 되었습니다.');");
		out.println("location.href = '"+request.getContextPath()+"/T3_Session';");
		out.println("</script>");
	}
	
}
