package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardReplyUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		String content = request.getParameter("idx")==null ? "" : request.getParameter("idx");
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardReplyUpdateOk(idx, content);
		
		response.getWriter().write(res + "");
	}

}
