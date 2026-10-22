package yoga;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class YogaListCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String part = request.getParameter("part");
    if(part == null || part.isBlank()) {
      part = "전체";
    }
    int page = 1;
    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch(Exception e) {
      page = 1;
    }
    if(page < 1) {
      page = 1;
    }
    int pageSize = 10;
    int blockSize = 10;
    YogaDAO dao = new YogaDAO();
    int totalCount = dao.getYogaCount(part);
    int totalPage = (totalCount + pageSize - 1) / pageSize;
    if(totalPage == 0) {
      totalPage = 1;
    }
    if(page > totalPage) {
      page = totalPage;
    }
    int startIndex = (page - 1) * pageSize;
    List<YogaVO> vos = dao.getYogaList(part, startIndex, pageSize);
    int startPage = ((page - 1) / blockSize) * blockSize + 1;
    int endPage = Math.min(startPage + blockSize - 1, totalPage);
    int startNo = totalCount - ((page - 1) * pageSize);
    request.setAttribute("yogaVos", vos);
    request.setAttribute("yogaPart", part);
    request.setAttribute("yogaCurrentPage", page);
    request.setAttribute("yogaPageSize", pageSize);
    request.setAttribute("yogaTotalCount", totalCount);
    request.setAttribute("yogaTotalPage", totalPage);
    request.setAttribute("yogaStartPage", startPage);
    request.setAttribute("yogaEndPage", endPage);
    request.setAttribute("yogaStartNo", startNo);
  }
}