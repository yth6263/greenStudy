package photo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PhotoContentCommand implements PhotoInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int idx = 0;
    try {
      idx = Integer.parseInt(request.getParameter("idx"));
    } catch (Exception e) {}
    request.setAttribute("photoVo", new PhotoDAO().getPhotoIdx(idx));
  }
}
