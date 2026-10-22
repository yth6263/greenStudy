package study2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface StudyInterface {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException ;
}
