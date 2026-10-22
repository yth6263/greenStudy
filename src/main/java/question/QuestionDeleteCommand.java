package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionDeleteCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = QuestionCommandSupport.intParam(request, "idx");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO vo = dao.getQuestion(idx);
    if (vo == null || (!QuestionCommandSupport.isAdmin(request) && !QuestionCommandSupport.memberId(request).equals(vo.getMid()))) {
      QuestionCommandSupport.message(request, "문의글을 찾을 수 없거나 삭제 권한이 없습니다.", "/questionList.qu");
      return;
    }
    int res = dao.setQuestionDelete(idx);
    if (res > 0) QuestionFileSupport.delete(request, vo.getQuestionPhoto());
    QuestionCommandSupport.message(request, res > 0 ? "문의가 삭제되었습니다." : "문의 삭제에 실패했습니다.", "/questionList.qu");
  }
}
