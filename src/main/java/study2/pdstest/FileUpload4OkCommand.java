package study2.pdstest;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import study2.StudyInterface;

public class FileUpload4OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		long maxFileSize = 1024 * 1024 * 10;
		long maxTotalSize = 1024 * 1024 * 50;
		long totalSize = 0;
		int uploadCount = 0;
		
    // 파일 업로드 경로
    String realPath = request.getServletContext().getRealPath("/images/data/pdstest");
    if (realPath == null) throw new ServletException("업로드 경로를 확인할 수 없습니다.");

    // 업로드 폴더없다면 생성
    File uploadDir = new File(realPath);
    if(!uploadDir.exists() && !uploadDir.mkdirs()) throw new IOException("업로드 폴더 생성 실패~");
    if(!uploadDir.isDirectory()) throw new IOException("업로드 경로가 폴더가 아닙니다.");
    
    // 확장자 체크
    Set<String> allowedExt = Set.of("zip", "jpg", "gif", "png","txt", "doc", "pdf", "hwp");
    
    // 업로드파일 검사를 위한 저장객체 생성
    List<Part> validFiles = new ArrayList<Part>();

    // 전체 업로드 파일정보 가져와서 검사후 파일 업로드 시킨다.
    
    // 1. 전체 파일 검사
    for(Part part : request.getParts()) {
    	if(!"fName".equals(part.getName())) continue;
    	if(part.getSubmittedFileName() == null || part.getSubmittedFileName().isBlank()) continue;
    	if(part.getSize() == 0) continue;
    	
    	if(part.getSize() > maxFileSize) {
    		request.setAttribute("message", "개별 업로드 파일의 크기는 10MByte를 초가할수 없습니다.");
    		return;
    	}
    	
    	totalSize += part.getSize();
    	
    	if(totalSize > maxTotalSize) {
        request.setAttribute("message", "전체 업로드 파일의 크기는 50MB를 초과할 수 없습니다.");
        return;
    	}
    	
    	String fileName = Paths.get(part.getSubmittedFileName().replace("\\", "/")).getFileName().toString();
    	
    	int dot = fileName.lastIndexOf(".");
    	String ext = dot == -1 ? "" : fileName.substring(dot + 1).toLowerCase(Locale.ROOT);	// 운영체제의 언어와 관계없이 처리
    	
    	if(!allowedExt.contains(ext)) {
    		request.setAttribute("message", "허용되지 않는 파일 형식입니다.");
    		return;
    	}
    	
    	validFiles.add(part);
    }
    	
    // 파일 선택 여부 확인
    if (validFiles.isEmpty()) {
        request.setAttribute("message", "업로드할 파일이 없습니다.");
        return;
    }
  	
  	// 2. 정상파일들에 대한 여러 파일 저장
  	for(Part filePart : validFiles) {
    	// 원본 파일명 가져오기
    	String oFileName = Paths.get(filePart.getSubmittedFileName().replace("\\", "/")).getFileName().toString();
    	
    	// 파일명 중복 방지
    	String sFileName = UUID.randomUUID().toString().substring(0, 8) + "_" + oFileName;
    	System.out.println("sFileName..." + sFileName);
    	
    	// 실제 파일 저장
    	filePart.write(new File(uploadDir, sFileName).getAbsolutePath());
    	
    	uploadCount++;
    	
    	System.out.println("원본 파일명 : " + oFileName);
    	System.out.println("저장 파일명 : " + sFileName);
    	System.out.println("파일 크기 : " + filePart.getSize());
    	System.out.println("-----------------------");
  	}
  	System.out.println("총 파일 크기 : " + totalSize);
  	request.setAttribute("message", uploadCount + "개 파일 업로드 성공!");
  }

}
