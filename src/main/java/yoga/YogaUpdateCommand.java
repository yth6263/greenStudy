package yoga;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class YogaUpdateCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = request.getParameter("idx") == null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
    String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
    String part = request.getParameter("part") == null ? "전체" : request.getParameter("part");
    YogaDAO dao = new YogaDAO();
    YogaVO vo = dao.getYogaIdx(idx);
    request.setAttribute("vo", vo);
    request.setAttribute("page", page);
    request.setAttribute("part", part);
  }
}
