package board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// 1. 현재 페이지 번호를 구한다.(처음에는 무조건 1page처리한다.)
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 현재 한 페이지의 분량을 구한다.
		int pageSize = request.getParameter("pageSize")==null || request.getParameter("pageSize").equals("") ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다.(sql문 함수중에서 count())
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 페이지 건수
		int totPage = (totRecCnt % pageSize == 0) ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
				
		// 5. 시작 인덱스 번호
		int startIndexNo = (pag - 1) * pageSize;
		
		// 6. 현재 화면에 표시될 시작 번호
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// Block페이징처리
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
