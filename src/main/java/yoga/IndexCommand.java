package yoga;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class IndexCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    YogaListCommand yogaListCommand = new YogaListCommand();
    yogaListCommand.execute(request, response);
    request.setAttribute("yogaVos", request.getAttribute("vos"));
    YogaStoryListCommand yogaStoryListCommand = new YogaStoryListCommand();
    yogaStoryListCommand.execute(request, response);
    request.setAttribute("storyVos", request.getAttribute("vos"));
  }
}
