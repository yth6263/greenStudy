package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		
		String viewPage = "/WEB-INF/board/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		// 인증처리....(로그인 처리된 회원들만 사용할수 있다.)
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요.");
			request.setAttribute("url", "memberLogin.mem");
			viewPage = "/include/message";
		}
		else if(com.equals("boardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "boardList";
		}
		else if(com.equals("boardInput")) {
			viewPage += "boardInput";
		}
		else if(com.equals("boardInputOk")) {
		  command = new BoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("boardContent")) {
			command = new BoardContentCommand();
			command.execute(request, response);
			viewPage += "boardContent";
		}
		else if(com.equals("boardDelete")) {
			command = new BoardDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("boardUpdate")) {
			command = new BoardUpdateCommand();
			command.execute(request, response);
			viewPage += "boardUpdate";
		}
		else if(com.equals("boardUpdateOk")) {
			command = new BoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("boardSearchList")) {
			command = new BoardSearchListCommand();
			command.execute(request, response);
			viewPage += "boardSearchList";
		}
		else if(com.equals("boardGoodCheck")) {
			command = new BoardGoodCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("boardGoodCheckOk")) {
			command = new BoardGoodCheckOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("boardReplyInput")) {
			command = new BoardReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("boardReplyDelete")) {
			command = new BoardReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("boardReplyUpdateOk")) {
			command = new BoardReplyUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
