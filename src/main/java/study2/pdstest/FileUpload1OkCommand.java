package study2.pdstest;

import java.io.File;
import java.io.IOException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyInterface;

public class FileUpload1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드처리
		String realPath = request.getServletContext().getRealPath("/images/data/pdstest");
		int maxSize = 1024 * 1024 * 10;	// 10MByte까지 서버에 저장 허용처리
		String encoding = "UTF-8";
		
		File upLoadDir = new File(realPath);
		if(!upLoadDir.exists()) upLoadDir.mkdir();
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String oFileName = multipartRequest.getOriginalFileName("fName");
		String sFileName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명 : " + oFileName);
		System.out.println("서버에 저장된 파일명 : " + sFileName);
		
		// 업로드 완료후 메세지 처리
		if(oFileName != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일 업로드 성공!");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패~~");
		}
		request.setAttribute("url", "fileUpload1.st");
	}

}
