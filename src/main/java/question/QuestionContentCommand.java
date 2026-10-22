package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionContentCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = QuestionCommandSupport.intParam(request, "idx");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO vo = dao.getQuestion(idx);
    if (vo == null || (!QuestionCommandSupport.isAdmin(request) && !QuestionCommandSupport.memberId(request).equals(vo.getMid()))) {
      request.setAttribute("questionAccessDenied", true);
      QuestionCommandSupport.message(request, "문의글을 찾을 수 없거나 조회 권한이 없습니다.", "/questionList.qu");
      return;
    }
    vo.setAnswerVos(dao.getAnswerList(idx));
    request.setAttribute("questionVo", vo);
    boolean owner = QuestionCommandSupport.memberId(request).equals(vo.getMid());
    request.setAttribute("questionCanFollowUp", owner && !QuestionCommandSupport.isAdmin(request) && dao.hasAdminAnswer(idx));
  }
}
