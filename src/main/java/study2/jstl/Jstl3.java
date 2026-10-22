package study2.jstl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study2/jstl/Jstl3")
public class Jstl3 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = "Welcome to Korea!!!";
		request.setAttribute("str", str);
		
		String[] habbys = {"등산","낚시","수영","바이크","독서","영화감상","바둑"};
		request.setAttribute("habbys", habbys);
		
		List<String> vos = new ArrayList<>();
		vos.add("홍길동");
		vos.add("김말숙");
		vos.add("이기자");
		vos.add("김연아");
		vos.add("강감찬");
		request.setAttribute("vos", vos);
		
		String tel1 = "02";
		String tel2 = "1234";
		String tel3 = "5678";
		String tel = tel1 + "-" + tel2 + "-" + tel3;
		request.setAttribute("tel", tel);		
		
		Date today = new Date();
		request.setAttribute("today", today);
		
		String viewPage = "/WEB-INF/study2/jstl/jstl3.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
