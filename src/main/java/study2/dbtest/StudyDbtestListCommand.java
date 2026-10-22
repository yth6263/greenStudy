package study2.dbtest;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;

public class StudyDbtestListCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		
		List<DbtestVO> vos = dao.getList();
		
		request.setAttribute("vos", vos);
	}

}
