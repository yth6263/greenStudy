package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		
		String viewPage = "/WEB-INF/member/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		// 인증처리....(로그인 처리된 회원들만 사용할수 있다.)
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(com.equals("memberLogin")) {
			command = new MemberLoginCommand();
			command.execute(request, response);
			viewPage += "memberLogin";
		}
		else if(com.equals("memberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("memberJoin")) {
			viewPage += "memberJoin";
		}
		else if(com.equals("memberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("memberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("memberNickCheck")) {
			command = new MemberNickCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("memberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요.");
			request.setAttribute("url", "memberLogin.mem");
			viewPage = "/include/message";
		}
		else if(com.equals("memberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "memberMain";
		}
		else if(com.equals("memberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "memberList";
		}
		else if(com.equals("memberContent")) {
			command = new MemberContentCommand();
			command.execute(request, response);
			viewPage += "memberContent";
		}
		
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
