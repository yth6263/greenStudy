package admin.member;

import java.io.IOException;
import java.util.List;

import admin.AdminInterface;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberVO;

public class MemberListCommand implements AdminInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    MemberDAO dao = new MemberDAO();
    int page = 1;
    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch(Exception e) {}
    if(page < 1) page = 1;
    int pageSize = 10;
    int blockSize = 10;
    int totalCount = dao.getMemberCount();
    int totalPage = (totalCount + pageSize - 1) / pageSize;
    if(totalPage == 0) totalPage = 1;
    if(page > totalPage) page = totalPage;
    int startIndex = (page - 1) * pageSize;
    List<MemberVO> vos = dao.getMemberList(startIndex, pageSize);
    int startPage = ((page - 1) / blockSize) * blockSize + 1;
    int endPage = Math.min(startPage + blockSize - 1, totalPage);
    request.setAttribute("vos", vos);
    request.setAttribute("memberCurrentPage", page);
    request.setAttribute("memberTotalPage", totalPage);
    request.setAttribute("memberTotalCount", totalCount);
    request.setAttribute("memberStartPage", startPage);
    request.setAttribute("memberEndPage", endPage);
    request.setAttribute("memberStartNo", totalCount - startIndex);
  }
}
