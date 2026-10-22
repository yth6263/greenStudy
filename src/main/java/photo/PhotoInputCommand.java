package photo;

import java.io.IOException;
import java.util.List;
import java.util.StringJoiner;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PhotoInputCommand implements PhotoInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
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
    if (names.isEmpty()) {
      setMessage(request, "사진을 한 장 이상 선택해주세요.");
      return;
    }
    StringJoiner photoNames = new StringJoiner("|");
    for (String name : names) photoNames.add(name);
    PhotoVO vo = new PhotoVO();
    vo.setTitle(title.trim());
    vo.setContent(content.trim());
    vo.setPhotoName(photoNames.toString());
    int res = new PhotoDAO().setPhotoInput(vo);
    if (res == 0) PhotoFileSupport.deleteFiles(request, names);
    setMessage(request, res != 0 ? "사진·미디어가 등록되었습니다." : "사진·미디어 등록에 실패했습니다.");
  }

  private void setMessage(HttpServletRequest request, String message) {
    request.setAttribute("message", message);
    request.setAttribute("url", request.getContextPath() + "/photoMain.photo");
  }
}
