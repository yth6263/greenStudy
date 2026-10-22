package study2.ajax;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;
import study2.dbtest.DbtestVO;

public class StudyAjaxIdCheck3Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		DbtestVO vo = dao.getIdSearch(mid);
		System.out.println("vo : " + vo);
		
		String name = vo.getName();
		if(name.equals("")) {
			name = "찾는 자료가 없습니다.";
		}
		else {
			response.getWriter().write(name);
		}
	}

}
