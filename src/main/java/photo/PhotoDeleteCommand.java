package photo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PhotoDeleteCommand implements PhotoInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = 0;
    try {
      idx = Integer.parseInt(request.getParameter("idx"));
    } catch (Exception e) {}
    PhotoDAO dao = new PhotoDAO();
    PhotoVO vo = dao.getPhotoIdx(idx);
    if (vo == null) {
      setMessage(request, "삭제할 사진·미디어를 찾을 수 없습니다.");
      return;
    }
    int res = dao.setPhotoDelete(idx);
    if (res != 0) PhotoFileSupport.deleteStoredFiles(request, vo.getPhotoName());
    setMessage(request, res != 0 ? "사진·미디어가 삭제되었습니다." : "사진·미디어 삭제에 실패했습니다.");
  }

  private void setMessage(HttpServletRequest request, String message) {
    request.setAttribute("message", message);
    request.setAttribute("url", request.getContextPath() + "/photoMain.photo");
  }
}
