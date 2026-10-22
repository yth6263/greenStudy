package photo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.photo")
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024,
  maxFileSize = 1024 * 1024 * 10,
  maxRequestSize = 1024 * 1024 * 55
)
public class PhotoController extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String com = request.getRequestURI();
    com = com.substring(com.lastIndexOf("/") + 1, com.lastIndexOf("."));
    if (!com.equals("photoList") && !com.equals("photoContent")) {
      HttpSession session = request.getSession();
      int level = session.getAttribute("sLevel") == null ? 999 : (int) session.getAttribute("sLevel");
      if (level != 0) {
        response.sendRedirect(request.getContextPath() + "/memberLogin.mem");
        return;
      }
    }
    PhotoInterface command = null;
    String viewPage = "/include/message.jsp";
    if (com.equals("photoInput")) {
      command = new PhotoInputCommand();
    } else if (com.equals("photoUpdate")) {
      command = new PhotoUpdateCommand();
    } else if (com.equals("photoDelete")) {
      command = new PhotoDeleteCommand();
    } else if (com.equals("photoList")) {
      command = new PhotoListCommand();
      viewPage = "/WEB-INF/photo/photoList.jsp";
    } else if (com.equals("photoContent")) {
      command = new PhotoContentCommand();
      viewPage = "/WEB-INF/photo/photoContent.jsp";
    } else {
      command = new PhotoListCommand();
      viewPage = "/WEB-INF/photo/photoMain.jsp";
    }
    command.execute(request, response);
    request.getRequestDispatcher(viewPage).forward(request, response);
  }
}
