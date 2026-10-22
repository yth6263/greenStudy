package yoga;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import photo.PhotoListCommand;
@SuppressWarnings("serial")
@WebServlet("*.yo")
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 10,
  maxRequestSize = 1024 * 1024 * 55
)
public class YogaController extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    YogaInterface command = null;
    String viewPage = "/WEB-INF/yoga/";
    String com = request.getRequestURI();
    com = com.substring(com.lastIndexOf("/") + 1, com.lastIndexOf("."));
    HttpSession session = request.getSession();
    int level = session.getAttribute("sLevel") == null ? 999 : (int) session.getAttribute("sLevel");
    if(level > 4) {
      request.setAttribute("message", "로그인후 사용하세요.");
      request.setAttribute("url", "memberLogin.mem");
      viewPage = "/include/message";
    } else if(com.equals("yogaMain")) {
      viewPage += "yogaMain";
    } else if(com.equals("yogaLeft")) {
      viewPage += "yogaLeft";
    } else if(com.equals("yogaRight")) {
      viewPage += "yogaRight";
    } else if(com.equals("yoga11")) {
      viewPage += "yoga11";
    } else if(com.equals("yogaInput")) {
      viewPage += "yogaInput";
    } else if(com.equals("yogaInputOk")) {
      command = new YogaInputOkCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("yogaAdminList")) {
      command = new YogaListCommand();
      command.execute(request, response);
      viewPage += "yogaAdminList";
    } else if(com.equals("yogaList")) {
      command = new YogaListCommand();
      command.execute(request, response);
      viewPage += "yogaList";
    } else if(com.equals("yogaDelete")) {
      command = new YogaDeleteCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("Jstl4")) {
      viewPage = "/WEB-INF/study2/jstl/jstl4";
    } else if(com.equals("index")) {
      command = new YogaListCommand();
      command.execute(request, response);
      command = new YogaStoryListCommand();
      command.execute(request, response);
      new PhotoListCommand(6).execute(request, response);
      viewPage += "index";
    } else if(com.equals("admin")) {
      viewPage += "admin";
    } else if(com.equals("yogaMusic")) {
      viewPage += "yogaMusic";
    } else if(com.equals("yogaUpdate")) {
      command = new YogaUpdateCommand();
      command.execute(request, response);
      viewPage += "yogaUpdate";
    } else if(com.equals("yogaUpdateOk")) {
      command = new YogaUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("yogaContent")) {
      command = new YogaContentCommand();
      command.execute(request, response);
      viewPage += "yogaContent";
    } else if(com.equals("yogaStoryList")) {
      command = new YogaStoryListCommand();
      command.execute(request, response);
      viewPage += "yogaStoryList";
    } else if(com.equals("yogaStoryInput")) {
      viewPage += "yogaStoryInput";
    } else if(com.equals("yogaStoryInputOk")) {
      command = new YogaStoryInputOkCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("yogaStoryUpdate")) {
      command = new YogaStoryUpdateCommand();
      command.execute(request, response);
      viewPage += "yogaStoryUpdate";
    } else if(com.equals("yogaStoryUpdateOk")) {
      command = new YogaStoryUpdateOkCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("yogaStoryDelete")) {
      command = new YogaStoryDeleteCommand();
      command.execute(request, response);
      viewPage = "/include/message";
    } else if(com.equals("yogaStoryContent")) {
      command = new YogaStoryContentCommand();
      command.execute(request, response);
      viewPage += "yogaStoryContent";
    }
    viewPage += ".jsp";
    request.getRequestDispatcher(viewPage).forward(request, response);
  }
}
