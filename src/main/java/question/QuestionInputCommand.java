package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class QuestionInputCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    String part = request.getParameter("part");
    String content = request.getParameter("content");
    if (!QuestionCommandSupport.validPart(part) || content == null || content.isBlank()) {
      QuestionCommandSupport.message(request, "문의 분류와 내용을 입력해주세요.", "/questionMain.qu");
      return;
    }
    String questionPhoto = QuestionFileSupport.save(request, request.getPart("questionPhoto"));
    QuestionVO vo = new QuestionVO();
    vo.setPart(part);
    vo.setMid(QuestionCommandSupport.memberId(request));
    vo.setContent(content.trim());
    vo.setQuestionPhoto(questionPhoto);
    int res = new QuestionDAO().setQuestionInput(vo);
    if (res == 0) QuestionFileSupport.delete(request, questionPhoto);
    QuestionCommandSupport.message(request, res > 0 ? "문의가 등록되었습니다." : "문의 등록에 실패했습니다.", "/questionMain.qu");
  }
}
