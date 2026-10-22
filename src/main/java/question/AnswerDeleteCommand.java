package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AnswerDeleteCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = QuestionCommandSupport.intParam(request, "idx");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO vo = dao.getAnswer(idx);
    if (vo == null) {
      QuestionCommandSupport.message(request, "답변을 찾을 수 없습니다.", "/questionList.qu");
      return;
    }
    if (!QuestionCommandSupport.isAdmin(request) && !QuestionCommandSupport.memberId(request).equals(vo.getAnswerMid())) {
      QuestionCommandSupport.message(request, "답변 작성자 또는 관리자만 삭제할 수 있습니다.", "/questionContent.qu?idx=" + vo.getqIdx());
      return;
    }
    int res = dao.setAnswerDelete(idx);
    QuestionCommandSupport.message(request, res > 0 ? "답변이 삭제되었습니다." : "답변 삭제에 실패했습니다.", "/questionContent.qu?idx=" + vo.getqIdx());
  }
}
