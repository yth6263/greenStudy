package photo;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PhotoListCommand implements PhotoInterface {
  private final int limit;

  public PhotoListCommand() {
    this(0);
  }

  public PhotoListCommand(int limit) {
    this.limit = limit;
  }

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PhotoDAO dao = new PhotoDAO();
    request.setAttribute("photoVos", limit > 0 ? dao.getPhotoList(limit) : dao.getPhotoList());
  }
}
