package study2.pdstest;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import study2.StudyInterface;

public class FileUpload3OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int maxSize = 1024 * 1024 * 10;
		
    // 파일 업로드 경로
    String realPath = request.getServletContext().getRealPath("/images/data/pdstest");

    // 업로드 폴더없다면 생성
    File uploadDir = new File(realPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();

    // 업로드 파일정보 가져오기
    Part filePart = request.getPart("fName");

    if (filePart != null && filePart.getSize() > 0) {
      if (filePart.getSize() > maxSize) throw new ServletException("파일 크기는 10MB를 초과할 수 없습니다.");
      
      // 원본 파일명 가져오기
      String oFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

      // 파일명 중복 방지
      String sFileName = System.currentTimeMillis() + "_" + oFileName;
      System.out.println("sFileName..." + sFileName);

      // 실제 파일 저장
      filePart.write(new File(uploadDir, sFileName).getAbsolutePath());
      
      request.setAttribute("message", "파일 업로드 성공!");
    }
    else request.setAttribute("message", "파일 업로드 실패~~");

    request.setAttribute("url", "fileUpload3.st");
	}

}
