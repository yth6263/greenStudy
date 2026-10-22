package yoga;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class YogaStoryListCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int page = 1;
    try {
      page = Integer.parseInt(request.getParameter("page"));
    } catch(Exception e) {}
    if(page < 1) {
      page = 1;
    }
    int pageSize = 10;
    int blockSize = 10;
    YogaStoryDAO dao = new YogaStoryDAO();
    int totalCount = dao.getYogaStoryCount();
    int totalPages = (totalCount + pageSize - 1) / pageSize;
    if(totalPages == 0) {
      totalPages = 1;
    }
    if(page > totalPages) {
      page = totalPages;
    }
    int startIndex = (page - 1) * pageSize;
    List<YogaStoryVO> vos = dao.getYogaStoryList(startIndex, pageSize);
    int startPage = ((page - 1) / blockSize) * blockSize + 1;
    int endPage = Math.min(startPage + blockSize - 1, totalPages);
    
    request.setAttribute("storyVos", vos);
    request.setAttribute("storyTotalCount", totalCount);
    request.setAttribute("storyCurrentPage", page);
    request.setAttribute("storyTotalPages", totalPages);
    request.setAttribute("storyStartPage", startPage);
    request.setAttribute("storyEndPage", endPage);
    request.setAttribute("storyPrevPage", Math.max(1, startPage - blockSize));
    request.setAttribute("storyNextPage", Math.min(totalPages, startPage + blockSize));
  }
}
