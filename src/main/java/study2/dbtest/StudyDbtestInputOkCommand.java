package study2.dbtest;

import java.io.IOException;
import java.io.PrintWriter;

import common.SecurityUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyDAO;
import study2.StudyInterface;

public class StudyDbtestInputOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = request.getParameter("age")==null ? 20 : Integer.parseInt(request.getParameter("age"));
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		
		int salt = (int)(Math.random()*(9999-1000+1)) + 1000;
		pwd = salt + security.encryptSHA256(pwd + salt);
		System.out.println("salt : " + salt);
		
		DbtestVO vo = new DbtestVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		
		StudyDAO dao = new StudyDAO();
		
		PrintWriter out = response.getWriter();
		
		// 회원 아이디 중복 처리
		DbtestVO vo2 = dao.getIdSearch(mid);
		if(vo2.getMid() != null) {
			out.println("<script>");
			out.println("alert('아이디가 사용중입니다. 다른 아이디로 가입하세요.');");
			out.println("location.href='"+request.getContextPath()+"/dbtestInput.st';");
			out.println("</script>");
			return;
		}
		
		// 회원 가입처리
		int res = dao.setDbtestInput(vo);
		
		if(res != 0) {
			out.println("<script>");
			out.println("alert('회원 가입 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/dbtestForm.st';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('회원 가입 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/dbtestForm.st';");
			out.println("</script>");
		}
	}

}
