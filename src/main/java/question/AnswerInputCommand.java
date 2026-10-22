package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AnswerInputCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int qIdx = QuestionCommandSupport.intParam(request, "qIdx");
    String content = request.getParameter("answerContent");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO question = dao.getQuestion(qIdx);
    boolean admin = QuestionCommandSupport.isAdmin(request);
    boolean owner = question != null && QuestionCommandSupport.memberId(request).equals(question.getMid());
    if (question == null) {
      QuestionCommandSupport.message(request, "문의글을 찾을 수 없습니다.", "/questionList.qu");
      return;
    }
    if (content == null || content.isBlank()) {
      QuestionCommandSupport.message(request, admin ? "답변 내용을 입력해주세요." : "추가 문의 내용을 입력해주세요.", "/questionContent.qu?idx=" + qIdx);
      return;
    }
    if (!admin && (!owner || !dao.hasAdminAnswer(qIdx))) {
      QuestionCommandSupport.message(request, "관리자 답변이 등록된 문의의 작성자만 추가 문의를 남길 수 있습니다.", "/questionContent.qu?idx=" + qIdx);
      return;
    }
    QuestionVO vo = new QuestionVO();
    vo.setqIdx(qIdx);
    vo.setAnswerMid(QuestionCommandSupport.memberId(request));
    vo.setAnswerContent(content.trim());
    int res = dao.setAnswerInput(vo);
    String successMessage = admin ? "답변이 등록되었습니다." : "추가 문의가 등록되었습니다.";
    String failureMessage = admin ? "답변 등록에 실패했습니다." : "추가 문의 등록에 실패했습니다.";
    QuestionCommandSupport.message(request, res > 0 ? successMessage : failureMessage, "/questionContent.qu?idx=" + qIdx);
  }
}
