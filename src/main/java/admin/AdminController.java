package admin;

import java.io.IOException;

import admin.member.MemberContentCommand;
import admin.member.MemberLevelChangeCommand;
import admin.member.MemberListCommand;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		
		String viewPage = "/WEB-INF/admin/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		// 인증처리....
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 0) {
			request.setAttribute("message", "로그인후 사용하세요.");
			request.setAttribute("url", request.getContextPath()+"/memberLogin.mem");
			viewPage = "/include/message";
		}
		else if(com.equals("adminMain")) {
			viewPage += "adminMain";
		}
		else if(com.equals("adminLeft")) {
			viewPage += "adminLeft";
		}
		else if(com.equals("adminRight")) {
			viewPage += "adminRight";
		}
		else if(com.equals("memberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "member/memberList";
		}
		else if(com.equals("memberContent")) {
			command = new MemberContentCommand();
			command.execute(request, response);
			viewPage += "member/memberContent";
		}
//		else if(com.equals("")) {
//			command = new MemberLoginOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message";
//		}
		else if(com.equals("memberLevelChange")) {
			command = new MemberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
