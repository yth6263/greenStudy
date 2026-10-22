package study2.pdstest;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.StudyInterface;

public class FileDownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/data/pdstest");
		
		String[] files = new File(realPath).list();
		
//		for(String file : files) {
//			System.out.println("file : " + file);
//		}
		
		request.setAttribute("files", files);
	}

}
