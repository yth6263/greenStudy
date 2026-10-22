package question;

import java.io.IOException;
import java.util.Objects;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class QuestionUpdateCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int idx = QuestionCommandSupport.intParam(request, "idx");
    QuestionDAO dao = new QuestionDAO();
    QuestionVO oldVo = dao.getQuestion(idx);
    if (!canManage(request, oldVo)) {
      QuestionCommandSupport.message(request, "문의글을 찾을 수 없거나 수정 권한이 없습니다.", "/questionList.qu");
      return;
    }
    String part = request.getParameter("part");
    String content = request.getParameter("content");
    if (!QuestionCommandSupport.validPart(part) || content == null || content.isBlank()) {
      QuestionCommandSupport.message(request, "문의 분류와 내용을 입력해주세요.", "/questionUpdate.qu?idx=" + idx);
      return;
    }
    Part photoPart = request.getPart("questionPhoto");
    String photo = photoPart == null || photoPart.getSize() == 0 ? oldVo.getQuestionPhoto() : QuestionFileSupport.save(request, photoPart);
    QuestionVO vo = new QuestionVO();
    vo.setIdx(idx);
    vo.setPart(part);
    vo.setContent(content.trim());
    vo.setQuestionPhoto(photo);
    int res = dao.setQuestionUpdate(vo);
    if (res > 0 && !Objects.equals(photo, oldVo.getQuestionPhoto())) QuestionFileSupport.delete(request, oldVo.getQuestionPhoto());
    if (res == 0 && !Objects.equals(photo, oldVo.getQuestionPhoto())) QuestionFileSupport.delete(request, photo);
    QuestionCommandSupport.message(request, res > 0 ? "문의가 수정되었습니다." : "문의 수정에 실패했습니다.", "/questionContent.qu?idx=" + idx);
  }

  private boolean canManage(HttpServletRequest request, QuestionVO vo) {
    return vo != null && (QuestionCommandSupport.isAdmin(request) || QuestionCommandSupport.memberId(request).equals(vo.getMid()));
  }
}
