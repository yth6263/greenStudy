package study2.ajax;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;
import study2.dbtest.DbtestVO;

public class StudyAjaxIdCheck1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		DbtestVO vo = dao.getIdSearch(mid);
		System.out.println("vo : " + vo);
		request.setAttribute("name", vo.getName());
	}

}
