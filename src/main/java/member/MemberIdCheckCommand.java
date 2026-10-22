package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MemberIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
	  MemberVO vo = dao.getMemberIdCheck(mid);
	  
	  String res = "";
	  
	  if(vo.getMid() != null) res = "1";
	  else res = "0";
	  
	  response.getWriter().write(res);
	}

}
