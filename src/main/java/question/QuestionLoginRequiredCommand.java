package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuestionLoginRequiredCommand implements QuestionInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("message", "로그인후 사용하세요.");
    request.setAttribute("url", request.getContextPath() + "/memberLogin.mem");
  }
}
