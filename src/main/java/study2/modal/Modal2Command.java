package study2.modal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberVO;
import study2.StudyInterface;

public class Modal2Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = "hkd1234";
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		request.setAttribute("vo", vo);
		
		// 회원 리스트
		//List<MemberVO> vos = new ArrayList<MemberVO>();
		List<MemberVO> vos = dao.getMemberList();
		request.setAttribute("vos", vos);
	}

}
