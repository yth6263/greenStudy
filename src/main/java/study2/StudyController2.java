package study2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import study2.ajax.StudyAjaxIdCheck1Command;
import study2.ajax.StudyAjaxIdCheck2Command;
import study2.ajax.StudyAjaxIdCheck3Command;
import study2.dbtest.StudyDbtestDeleteCommand;
import study2.dbtest.StudyDbtestInputOkCommand;
import study2.dbtest.StudyDbtestListCommand;
import study2.dbtest.StudyDbtestSearchCommand;
import study2.dbtest.StudyDbtestUpdateCommand;
import study2.dbtest.StudyDbtestUpdateOkCommand;
import study2.modal.Modal2CheckCommand;
import study2.modal.Modal2Command;
import study2.password.StudyPasswordOkCommand;
import study2.pdstest.FileDeleteCheckCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.FileDownloadCommand;
import study2.pdstest.FileUpload1OkCommand;
import study2.pdstest.FileUpload2OkCommand;
import study2.pdstest.FileUpload3OkCommand;
import study2.pdstest.FileUpload4OkCommand;
import study2.uuid.UuidCheckCommand;

@SuppressWarnings("serial")
//@WebServlet("*.st")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 55
)
public class StudyController2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		
		String viewPage = "/WEB-INF/study2/";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("ajax")) {
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("ajaxIdCheck1")) {
			command = new StudyAjaxIdCheck1Command();
			command.execute(request, response);
			viewPage += "ajax/ajaxForm";
		}
		else if(com.equals("ajaxIdCheck2")) {
			command = new StudyAjaxIdCheck2Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("ajaxIdCheck3")) {
			command = new StudyAjaxIdCheck3Command();
			command.execute(request, response);
			return;
		}
		else if(com.equals("password")) {
			viewPage += "password/passwordForm";
		}
		else if(com.equals("passwordOk")) {
			command = new StudyPasswordOkCommand();
			command.execute(request, response);
			viewPage += "password/passwordForm";
		}
		else if(com.equals("dbtestForm")) {
			viewPage += "dbtest/dbtestForm";
		}
		else if(com.equals("dbtestInput")) {
			viewPage += "dbtest/dbtestInput";
		}
		else if(com.equals("dbtestInputOk")) {
			command = new StudyDbtestInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("dbtestSearch")) {
			command = new StudyDbtestSearchCommand();
			command.execute(request, response);
			viewPage += "dbtest/dbtestSearch";
		}
		else if(com.equals("dbtestList")) {
			command = new StudyDbtestListCommand();
			command.execute(request, response);
			viewPage += "dbtest/dbtestList";
		}
		else if(com.equals("dbtestUpdate")) {
			command = new StudyDbtestUpdateCommand();
			command.execute(request, response);
			viewPage += "dbtest/dbtestUpdate";
		}
		else if(com.equals("dbtestUpdateOk")) {
			command = new StudyDbtestUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("dbtestDelete")) {
			command = new StudyDbtestDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("fileUploadForm")) {
			viewPage += "pdstest/fileUploadForm";
		}
		else if(com.equals("fileUpload1")) {
			viewPage += "pdstest/fileUpload1";
		}
		else if(com.equals("fileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("fileDownload")) {
			command = new FileDownloadCommand();
			command.execute(request, response);
			viewPage += "pdstest/fileDownload";
		}
		else if(com.equals("fileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("fileDeleteCheck")) {
			command = new FileDeleteCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("fileUpload2")) {
			viewPage += "pdstest/fileUpload2";
		}
		else if(com.equals("fileUpload2Ok")) {
			command = new FileUpload2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("fileUpload3")) {
			viewPage += "pdstest/fileUpload3";
		}
		else if(com.equals("fileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message";
		}
		else if(com.equals("fileUpload4")) {
			viewPage += "pdstest/fileUpload4";
		}
		else if(com.equals("fileUpload4Ok")) {
			command = new FileUpload4OkCommand();
			command.execute(request, response);
			request.setAttribute("url", "fileUpload4.st");
			viewPage = "/include/message";
		}
		else if(com.equals("uuidForm")) {
			viewPage += "uuid/uuidForm";
		}
		else if(com.equals("uuidCheck")) {
			command = new UuidCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("modal1")) {
			viewPage += "modal/modal1";
		}
		else if(com.equals("modal2")) {
			command = new Modal2Command();
			command.execute(request, response);
			viewPage += "modal/modal2";
		}
		else if(com.equals("modal2Check")) {
			command = new Modal2CheckCommand();
			command.execute(request, response);
			return;
		}
		
		viewPage += ".jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
