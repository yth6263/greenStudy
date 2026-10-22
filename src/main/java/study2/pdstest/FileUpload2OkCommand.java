package study2.pdstest;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyInterface;

public class FileUpload2OkCommand implements StudyInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/data/pdstest");
		int maxSize = 1024 * 1024 * 20;	// 20MByte까지 서버에 저장 허용처리
		String encoding = "UTF-8";
		
		File upLoadDir = new File(realPath);
		if(!upLoadDir.exists()) upLoadDir.mkdir();
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 여러 파일의 정보를 추출시켜본다.
		String fNames = multipartRequest.getParameter("fNames");
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String oFileName = "";
		String sFileName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			oFileName += multipartRequest.getOriginalFileName(file) + "/";
			sFileName += multipartRequest.getFilesystemName(file) + "/";
		}
		oFileName = oFileName.substring(0, oFileName.lastIndexOf("/"));
		sFileName = sFileName.substring(0, sFileName.lastIndexOf("/"));
		
		System.out.println("원본 파일명 : " + oFileName);
		System.out.println("서버에 저장된 파일명 : " + sFileName);
		System.out.println("클라이언트에서 업로드된 여러파일명 : " + fNames);
		
		// 업로드 완료후 메세지 처리
		if(oFileName != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일 업로드 성공!");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패~~~");
		}
		request.setAttribute("url", "fileUpload2.st");
	}

}
