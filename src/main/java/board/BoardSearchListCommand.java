package board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardSearchListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");

		BoardDAO dao = new BoardDAO();
		
		List<BoardVO> vos = dao.getBoardSearchList(search, searchString);
		
		String searchStr = "";
		if(search.equals("title")) searchStr = "글제목"; 
		else if(search.equals("nickName")) searchStr = "글쓴이"; 
		else searchStr = "글내용"; 
		
		request.setAttribute("vos", vos);
		request.setAttribute("searchStr", searchStr);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCnt", vos.size());
	}

}
