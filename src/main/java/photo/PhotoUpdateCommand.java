package photo;

import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PhotoUpdateCommand implements PhotoInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    int idx = parseIdx(request.getParameter("idx"));
    PhotoDAO dao = new PhotoDAO();
    PhotoVO oldVo = dao.getPhotoIdx(idx);
    if (oldVo == null) {
      setMessage(request, "수정할 사진·미디어를 찾을 수 없습니다.");
      return;
    }
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    if (title == null || title.isBlank() || content == null || content.isBlank()) {
      setMessage(request, "제목과 설명을 입력해주세요.");
      return;
    }
    List<String> names;
    try {
      names = PhotoFileSupport.saveUploadedFiles(request);
    } catch (ServletException e) {
      setMessage(request, e.getMessage());
      return;
    } catch (IOException e) {
      setMessage(request, "사진 파일을 저장하지 못했습니다.");
      return;
    } catch (IllegalStateException e) {
      setMessage(request, "업로드 용량을 초과했습니다. 사진 수나 크기를 줄여주세요.");
      return;
    }
    PhotoVO vo = new PhotoVO();
    vo.setIdx(idx);
    vo.setTitle(title.trim());
    vo.setContent(content.trim());
    if (names.isEmpty()) {
      vo.setPhotoName(oldVo.getPhotoName());
    } else {
      StringJoiner photoNames = new StringJoiner("|");
      for (String name : names) photoNames.add(name);
      vo.setPhotoName(photoNames.toString());
    }
    int res = dao.setPhotoUpdate(vo);
    if (res != 0 && !names.isEmpty()) PhotoFileSupport.deleteStoredFiles(request, oldVo.getPhotoName());
    if (res == 0) PhotoFileSupport.deleteFiles(request, names);
    setMessage(request, res != 0 ? "사진·미디어가 수정되었습니다." : "사진·미디어 수정에 실패했습니다.");
  }

  private int parseIdx(String value) {
    try {
      return Integer.parseInt(value);
    } catch (Exception e) {
      return 0;
    }
  }

  private void setMessage(HttpServletRequest request, String message) {
    request.setAttribute("message", message);
    request.setAttribute("url", request.getContextPath() + "/photoMain.photo");
  }
}
