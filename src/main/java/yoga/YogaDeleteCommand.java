package yoga;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class YogaDeleteCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = parseInt(request.getParameter("idx"));
    int page = parseInt(request.getParameter("page"));
    if(page < 1) {
      page = 1;
    }
    String part = request.getParameter("part");
    if(part == null || part.isBlank()) {
      part = "전체";
    }
    YogaDAO dao = new YogaDAO();
    YogaVO vo = dao.getYogaIdx(idx);
    String realPath = request.getServletContext().getRealPath("/images/data/yoga/");
    if(vo != null && vo.getPhoto() != null && !vo.getPhoto().isBlank()) {
      new File(realPath + vo.getPhoto()).delete();
    }
    int res = dao.setYogaDelete(idx);
    request.setAttribute("message", res != 0 ? "요가글이 삭제되었습니다." : "요가글 삭제에 실패했습니다.");
    request.setAttribute("url", "yogaList.yo?page=" + page + "&part=" + part);
  }
  private int parseInt(String value) {
    try {
      return Integer.parseInt(value);
    } catch(Exception e) {
      return 0;
    }
  }
}