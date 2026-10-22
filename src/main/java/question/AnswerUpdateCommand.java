package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AnswerUpdateCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = QuestionCommandSupport.intParam(request, "idx");
    String content = request.getParameter("answerContent");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO vo = dao.getAnswer(idx);
    if (vo == null) {
      QuestionCommandSupport.message(request, "답변을 찾을 수 없습니다.", "/questionList.qu");
      return;
    }
    if (!QuestionCommandSupport.memberId(request).equals(vo.getAnswerMid())) {
      QuestionCommandSupport.message(request, "답변을 작성한 사람만 수정할 수 있습니다.", "/questionContent.qu?idx=" + vo.getqIdx());
      return;
    }
    if (content == null || content.isBlank()) {
      QuestionCommandSupport.message(request, "수정할 답변 내용을 입력해주세요.", "/questionContent.qu?idx=" + vo.getqIdx());
      return;
    }
    int res = dao.setAnswerUpdate(idx, content.trim());
    QuestionCommandSupport.message(request, res > 0 ? "답변이 수정되었습니다." : "답변 수정에 실패했습니다.", "/questionContent.qu?idx=" + vo.getqIdx());
  }
}
