package yoga;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class YogaUpdateOkCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int maxSize = 1024 * 1024 * 10;
    int idx = request.getParameter("idx") == null || request.getParameter("idx").equals("") ? 0 : Integer.parseInt(request.getParameter("idx"));
    String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
    String listPart = request.getParameter("listPart") == null ? "전체" : request.getParameter("listPart");
    String oldPhoto = request.getParameter("oldPhoto") == null ? "" : request.getParameter("oldPhoto");
    String part = request.getParameter("part") == null ? "" : request.getParameter("part");
    String title = request.getParameter("title") == null ? "" : request.getParameter("title");
    String content = request.getParameter("content") == null ? "" : request.getParameter("content");
    String url = request.getParameter("url") == null ? "" : request.getParameter("url");
    String realPath = request.getServletContext().getRealPath("/images/data/yoga/");
    File uploadDir = new File(realPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();
    String photo = oldPhoto;
    Part filePart = request.getPart("photo");
    if (filePart != null && filePart.getSize() > 0) {
      if (filePart.getSize() > maxSize) throw new ServletException("파일 크기는 10MB를 초과할 수 없습니다.");
      String oFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
      photo = System.currentTimeMillis() + "_" + oFileName;
      filePart.write(new File(uploadDir, photo).getAbsolutePath());
      if (!oldPhoto.equals("")) {
        File oldFile = new File(uploadDir, oldPhoto);
        if (oldFile.exists()) oldFile.delete();
      }
    }
    YogaVO vo = new YogaVO();
    vo.setIdx(idx);
    vo.setPart(part);
    vo.setTitle(title);
    vo.setContent(content);
    vo.setUrl(url);
    vo.setPhoto(photo);
    YogaDAO dao = new YogaDAO();
    int res = dao.setYogaUpdate(vo);
    if (res != 0) {
      request.setAttribute("message", "요가글이 수정되었습니다.");
      request.setAttribute("url", "yogaList.yo?page=" + page + "&part=" + listPart);
    }
    else {
      request.setAttribute("message", "요가글 수정에 실패했습니다.");
      request.setAttribute("url", "yogaUpdate.yo?idx=" + idx + "&page=" + page + "&part=" + listPart);
    }
  }
}
