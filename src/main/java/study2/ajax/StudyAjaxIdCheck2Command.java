package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;
import study2.dbtest.DbtestVO;

public class StudyAjaxIdCheck2Command implements StudyInterface {

	@SuppressWarnings("deprecation")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		DbtestVO vo = dao.getIdSearch(mid);
		System.out.println("vo : " + vo);
		//request.setAttribute("name", vo.getName());
		
		String name = vo.getName();
		if(name.equals("")) {
			name = "찾는 자료가 없습니다.";
		}
		else {
			// PrintWriter out = response.getWriter();
			// out.println(name);
			// out.write(name);;
			
			//response.getWriter().write(name);
			response.sendRedirect(request.getContextPath()+"/WEB-INF/study2/ajax/ajaxForm.jsp?name="+URLEncoder.encode(name));
		}
	}

}
