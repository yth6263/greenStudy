package study2.dbtest;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;

public class StudyDbtestUpdateOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = request.getParameter("age")==null ? 20 : Integer.parseInt(request.getParameter("age"));
		
		DbtestVO vo = new DbtestVO();
		
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		
		StudyDAO dao = new StudyDAO();
		
		// 회원 수정처리
		int res = dao.setUpdateOk(vo);
				
		PrintWriter out = response.getWriter();
		
		if(res != 0) {
			out.println("<script>");
			out.println("alert('회원 정보가 수정 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/dbtestForm.st';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원 정보 수정 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/dbtestUpdate.st?mid='+mid;");
			out.println("</script>");
		}
	}

}
