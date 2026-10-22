package admin.member;

import java.io.IOException;

import admin.AdminInterface;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

public class MemberLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
		int level = request.getParameter("level")==null || request.getParameter("level").equals("") ? 0 : Integer.parseInt(request.getParameter("level"));
				
		MemberDAO dao = new MemberDAO();
		
		int res = dao.setMemberLevelChange(idx, level);
		
		String str = "";
		if(res != 0) str = "1";
		else str = "0";
		
		response.getWriter().write(str);
	}

}
