package study.j0921;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Test8Ok")
public class Test8Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("이곳은 Test8Ok.java 입니다.");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] cards = request.getParameterValues("card");
		String job = request.getParameter("job");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : " + pwd);
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("직업 : " + job);
		System.out.println("자기소개서 : " + content);
		
		String tempCard = "";
		for(String card : cards) {
			System.out.println(card);
			tempCard += card + "/";
		}
		tempCard = tempCard.substring(0, tempCard.length()-1);
		System.out.println("card : " + tempCard);

		/*
		PrintWriter out = response.getWriter();
		out.println("<p>아이디 : "+mid+"</p>");
		out.println("<p>비밀번호 : "+pwd+"</p>");
		out.println("<p>성명 : "+name+"</p>");
		out.println("<p>나이 : "+age+"</p>");
		out.println("<p>성별 : "+gender+"</p>");
		out.println("<p>직업 : "+job+"</p>");
		out.println("<p>자기소개서 : "+content+"</p>");
		// out.println("<p><a href='"+request.getContextPath()+"/t8'>돌아가기</a></p>");
		out.println("<p><a href='t8'>돌아가기</a></p>");
		*/
		
		//response.sendRedirect(request.getContextPath()+"/study/0921/test8Res.jsp?mid="+mid+"&pwd="+pwd+"&name="+URLEncoder.encode(name)+"&age="+age);
		//response.sendRedirect(request.getContextPath()+"/study/0921/test8Res.jsp?mid="+mid+"&pwd="+pwd+"&name="+URLEncoder.encode(name)+"&age="+age+"&gender="+URLEncoder.encode(gender)+"&job="+URLEncoder.encode(job)+"&content="+URLEncoder.encode(content));
		
		//String viewPage = "/study/0921/test8Res.jsp?mid="+mid+"&pwd="+pwd+"&name="+URLEncoder.encode(name)+"&age="+age+"&gender="+URLEncoder.encode(gender)+"&job="+URLEncoder.encode(job)+"&content="+URLEncoder.encode(content);
		String viewPage = "/study/0921/test8Res.jsp?card="+tempCard;
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
