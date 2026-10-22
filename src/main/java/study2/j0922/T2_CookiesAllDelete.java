package study2.j0922;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/T2_CookiesAllDelete")
public class T2_CookiesAllDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		Cookie[] cookies = request.getCookies();
		
		for(int i=0; i<cookies.length; i++) {
			cookies[i].setMaxAge(0);
			response.addCookie(cookies[i]);
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('모든 쿠키가 삭제 되었습니다.');");
		out.println("location.href = '"+request.getContextPath()+"/T2_Cookies';");
		out.println("</script>");
	}
	
}
