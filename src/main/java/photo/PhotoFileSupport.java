package photo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

final class PhotoFileSupport {
  private static final long MAX_FILE_SIZE = 10L * 1024 * 1024;
  private static final String PHOTO_DIRECTORY = "/images/data/photo";

  private PhotoFileSupport() {}

  static List<String> saveUploadedFiles(HttpServletRequest request) throws IOException, ServletException {
    List<String> savedNames = new ArrayList<String>();
    File uploadDir = new File(request.getServletContext().getRealPath(PHOTO_DIRECTORY));
    if (!uploadDir.exists() && !uploadDir.mkdirs()) {
      throw new IOException("사진 저장 폴더를 만들 수 없습니다.");
    }
    try {
      for (Part part : request.getParts()) {
        if (!"photoFiles".equals(part.getName()) || part.getSize() == 0) continue;
        if (part.getSize() > MAX_FILE_SIZE) {
          throw new ServletException("사진 한 장의 크기는 10MB를 초과할 수 없습니다.");
        }
        String submittedName = part.getSubmittedFileName();
        String originalName = Paths.get(submittedName.replace("\\", "/")).getFileName().toString();
        int dot = originalName.lastIndexOf('.');
        String extension = dot < 0 ? "" : originalName.substring(dot).toLowerCase();
        if (!extension.matches("\\.(jpg|jpeg|png|gif|webp)")) {
          throw new ServletException("JPG, PNG, GIF, WEBP 사진 파일만 등록할 수 있습니다.");
        }
        String savedName = UUID.randomUUID().toString().replace("-", "") + extension;
        savedNames.add(savedName);
        part.write(new File(uploadDir, savedName).getAbsolutePath());
      }
    } catch (IOException | ServletException | RuntimeException e) {
      deleteFiles(request, savedNames);
      throw e;
    }
    return savedNames;
  }

  static void deleteFiles(HttpServletRequest request, List<String> names) {
    String realPath = request.getServletContext().getRealPath(PHOTO_DIRECTORY);
    for (String name : names) {
      new File(realPath, name).delete();
    }
  }

  static void deleteStoredFiles(HttpServletRequest request, String photoNameList) {
    if (photoNameList == null || photoNameList.isEmpty()) return;
    List<String> names = new ArrayList<String>();
    for (String name : photoNameList.split("\\|")) {
      if (!name.isBlank()) names.add(name);
    }
    deleteFiles(request, names);
  }
}
