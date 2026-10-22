package study2.j0922;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/T2_CookiesSave")
public class T2_CookiesSave extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String mid = "hkd1234";
	  Cookie cookieMid = new Cookie("cMid", mid);
	  cookieMid.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일
	  response.addCookie(cookieMid);
	  
	  String pwd = "1234";
	  Cookie cookiePwd = new Cookie("cPwd", pwd);
	  cookiePwd.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일
	  response.addCookie(cookiePwd);
		
	  
	  String tel = "010-3423-2704";
	  Cookie cookieTel = new Cookie("cTel", tel);
	  cookieTel.setMaxAge(60*60*24);		// 쿠키의 만료시간(초) : 1일
	  response.addCookie(cookieTel);
	  
		String viewPage = "/WEB-INF/study2/0922_storage/t2_CookiesSave.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
