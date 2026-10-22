package yoga;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class YogaInputOkCommand implements YogaInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int maxSize = 1024 * 1024 * 10;
		
    // 파일 업로드 경로
    String realPath = request.getServletContext().getRealPath("/images/data/yoga");

    // 업로드 폴더없다면 생성
    File uploadDir = new File(realPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();

    // 업로드 파일정보 가져오기
    Part filePart = request.getPart("photo");

    String sFileName = "";
    if (filePart != null && filePart.getSize() > 0) {
      if (filePart.getSize() > maxSize) throw new ServletException("파일 크기는 10MB를 초과할 수 없습니다.");
      
      // 원본 파일명 가져오기
      String oFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

      // 파일명 중복 방지
      sFileName = System.currentTimeMillis() + "_" + oFileName;
      System.out.println("sFileName..." + sFileName);

      // 실제 파일 저장
      filePart.write(new File(uploadDir, sFileName).getAbsolutePath());
      
      request.setAttribute("message", "파일 업로드 성공!");
    }
    else request.setAttribute("message", "파일 업로드 실패~~");
    
    // 일반 자료 가져오기
    String part = request.getParameter("part")==null ? "" : request.getParameter("part");
    String title = request.getParameter("title")==null ? "" : request.getParameter("title");
    String content = request.getParameter("content")==null ? "" : request.getParameter("content");
    String url = request.getParameter("url")==null ? "" : request.getParameter("url");
    
    YogaVO vo = new YogaVO();
    
    vo.setPart(part);
    vo.setTitle(title);
    vo.setContent(content);
    vo.setUrl(url);
    vo.setPhoto(sFileName);
    
    YogaDAO dao= new YogaDAO();
    int res = dao.setYogaInput(vo);

		if(res != 0) {
			request.setAttribute("message", "요가글이 등록되었습니다.");
			request.setAttribute("url", "yogaInput.yo");
		}
		else {
			request.setAttribute("message", "요가글 등록실패~");
			request.setAttribute("url", "yogaInput.yo");
		}
	}

}
