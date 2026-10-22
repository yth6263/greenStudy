package yoga;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class YogaStoryContentCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
    int idx=request.getParameter("idx")==null||request.getParameter("idx").equals("")?0:Integer.parseInt(request.getParameter("idx"));
    YogaStoryDAO dao=new YogaStoryDAO();
    YogaStoryVO vo=dao.getYogaStoryIdx(idx);
    if(vo==null){
      request.setAttribute("message","존재하지 않는 요가스토리입니다.");
      request.setAttribute("url","yogaStory.yo");
      return;
    }
    request.setAttribute("vo",vo);
  }
}