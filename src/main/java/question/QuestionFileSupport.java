package question;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

final class QuestionFileSupport {
  private static final String PHOTO_DIRECTORY = "/images/data/question";
  private static final long MAX_FILE_SIZE = 10L * 1024 * 1024;

  private QuestionFileSupport() {}

  static String save(HttpServletRequest request, Part part) throws IOException, ServletException {
    if (part == null || part.getSize() == 0) return "";
    if (part.getSize() > MAX_FILE_SIZE) throw new ServletException("사진은 10MB 이하만 첨부할 수 있습니다.");
    String name = Paths.get(part.getSubmittedFileName().replace("\\", "/")).getFileName().toString();
    int dot = name.lastIndexOf('.');
    String extension = dot < 0 ? "" : name.substring(dot).toLowerCase();
    if (!extension.matches("\\.(jpg|jpeg|png|gif|webp)")) {
      throw new ServletException("JPG, PNG, GIF, WEBP 파일만 첨부할 수 있습니다.");
    }
    File directory = new File(request.getServletContext().getRealPath(PHOTO_DIRECTORY));
    if (!directory.exists() && !directory.mkdirs()) throw new IOException("첨부사진 폴더를 만들 수 없습니다.");
    String savedName = UUID.randomUUID().toString().replace("-", "") + extension;
    part.write(new File(directory, savedName).getAbsolutePath());
    return savedName;
  }

  static void delete(HttpServletRequest request, String fileName) {
    if (fileName == null || fileName.isBlank()) return;
    new File(request.getServletContext().getRealPath(PHOTO_DIRECTORY), fileName).delete();
  }
}
