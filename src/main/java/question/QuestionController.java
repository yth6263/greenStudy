package question;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.qu")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 12)
public class QuestionController extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String com = request.getRequestURI();
    com = com.substring(com.lastIndexOf("/") + 1, com.lastIndexOf("."));
    HttpSession session = request.getSession();
    int level = session.getAttribute("sLevel") == null ? 999 : (int) session.getAttribute("sLevel");
    String viewPage = "/WEB-INF/question/";
    QuestionInterface command = null;
    if (level > 4) {
      command = new QuestionLoginRequiredCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("questionMain")) {
      command = new QuestionListCommand();
      command.execute(request, response);
      viewPage += "questionMain.jsp";
    } else if (com.equals("questionList")) {
      command = new QuestionListCommand();
      command.execute(request, response);
      viewPage += "questionList.jsp";
    } else if (com.equals("questionInput")) {
      viewPage += "questionInput.jsp";
    } else if (com.equals("questionInputOk")) {
      command = new QuestionInputCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("questionContent")) {
      command = new QuestionContentCommand();
      command.execute(request, response);
      if (Boolean.TRUE.equals(request.getAttribute("questionAccessDenied"))) {
        viewPage = "/include/message.jsp";
      } else {
        viewPage += "questionContent.jsp";
      }
    } else if (com.equals("questionUpdate")) {
      command = new QuestionUpdateViewCommand();
      command.execute(request, response);
      if (Boolean.TRUE.equals(request.getAttribute("questionAccessDenied"))) {
        viewPage = "/include/message.jsp";
      } else {
        viewPage += "questionUpdate.jsp";
      }
    } else if (com.equals("questionUpdateOk")) {
      command = new QuestionUpdateCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("questionDelete")) {
      command = new QuestionDeleteCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("answerInput")) {
      command = new AnswerInputCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("answerUpdate")) {
      command = new AnswerUpdateCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else if (com.equals("answerDelete")) {
      command = new AnswerDeleteCommand();
      command.execute(request, response);
      viewPage = "/include/message.jsp";
    } else {
      viewPage += "questionList.jsp";
      command = new QuestionListCommand();
      command.execute(request, response);
    }
    request.getRequestDispatcher(viewPage).forward(request, response);
  }
}
