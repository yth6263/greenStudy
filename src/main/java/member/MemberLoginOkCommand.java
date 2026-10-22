package member;

import java.io.IOException;

import common.SecurityUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 회원 인증 처리
		if(vo.getPwd() == null) {
			request.setAttribute("message", "입력하신 회원정보가 없습니다.\\n 확인하고 다시 로그인 하세요.");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		// 회원아이디가 존재할경우 비밀번호가 맞는지 확인한다.
		String salt = vo.getPwd().substring(0, 4);
		
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(4).equals(pwd)) {
			request.setAttribute("message", "비밀번호가 틀립니다.\\n 확인하고 다시 로그인 하세요.");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		// 로그인 '인증성공' 처리 된후 처리하는곳
		
		// 쿠키에 아이디 저장/해제
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		
		
		// 세션 저장 처리
		HttpSession session = request.getSession();
		session.setAttribute("sMid", vo.getMid());
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sLastDate", vo.getLastDate());
		
		// 로그인 성공시 접속시간이 현재 접속자의 최종 접속 시간이 된다.
		dao.setLastDateUpdate(mid);
		
		request.setAttribute("message", vo.getNickName() + "님 로그인 되었습니다.");
		
		if(request.getParameter("flag").equals("study")) request.setAttribute("url", "memberMain.mem");
		else request.setAttribute("url", "index.yo");
		
	}

}
