package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionUpdateViewCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = QuestionCommandSupport.intParam(request, "idx");
    QuestionVO vo = new QuestionDAO().getQuestion(idx);
    if (vo == null || (!QuestionCommandSupport.isAdmin(request) && !QuestionCommandSupport.memberId(request).equals(vo.getMid()))) {
      QuestionCommandSupport.message(request, "문의글을 찾을 수 없거나 수정 권한이 없습니다.", "/questionList.qu");
      request.setAttribute("questionAccessDenied", true);
      return;
    }
    request.setAttribute("questionVo", vo);
  }
}
