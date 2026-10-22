package question;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionListCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int page = Math.max(1, QuestionCommandSupport.intParam(request, "page"));
    int pageSize = 10;
    int blockSize = 10;
    boolean admin = QuestionCommandSupport.isAdmin(request);
    QuestionDAO dao = new QuestionDAO();
    int totalCount = dao.getQuestionCount(QuestionCommandSupport.memberId(request), admin);
    int totalPages = Math.max(1, (totalCount + pageSize - 1) / pageSize);
    page = Math.min(page, totalPages);
    int startPage = ((page - 1) / blockSize) * blockSize + 1;
    int endPage = Math.min(startPage + blockSize - 1, totalPages);
    List<QuestionVO> vos = dao.getQuestionList(QuestionCommandSupport.memberId(request), admin, (page - 1) * pageSize, pageSize);
    request.setAttribute("questionVos", vos);
    request.setAttribute("questionTotalCount", totalCount);
    request.setAttribute("questionCurrentPage", page);
    request.setAttribute("questionTotalPages", totalPages);
    request.setAttribute("questionStartPage", startPage);
    request.setAttribute("questionEndPage", endPage);
    request.setAttribute("questionPrevPage", Math.max(1, startPage - blockSize));
    request.setAttribute("questionNextPage", Math.min(totalPages, startPage + blockSize));
  }
}
