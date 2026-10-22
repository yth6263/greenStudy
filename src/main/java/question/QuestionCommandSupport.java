package question;

import java.util.Set;

import jakarta.servlet.http.HttpServletRequest;

final class QuestionCommandSupport {
  private static final Set<String> PARTS = Set.of("요가", "요가스토리", "명상", "포토갤러리", "회원");

  private QuestionCommandSupport() {}

  static boolean validPart(String part) {
    return PARTS.contains(part);
  }

  static int intParam(HttpServletRequest request, String name) {
    try { return Integer.parseInt(request.getParameter(name)); } catch (Exception e) { return 0; }
  }

  static boolean isAdmin(HttpServletRequest request) {
    return request.getSession().getAttribute("sLevel") != null
        && Integer.valueOf(0).equals(request.getSession().getAttribute("sLevel"));
  }

  static String memberId(HttpServletRequest request) {
    return (String) request.getSession().getAttribute("sMid");
  }

  static void message(HttpServletRequest request, String message, String url) {
    request.setAttribute("message", message);
    request.setAttribute("url", request.getContextPath() + url);
  }
}
