package yoga;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class YogaStoryDeleteCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
    int idx=request.getParameter("idx")==null||request.getParameter("idx").equals("")?0:Integer.parseInt(request.getParameter("idx"));
    YogaStoryDAO dao=new YogaStoryDAO();
    YogaStoryVO vo=dao.getYogaStoryIdx(idx);
    if(vo==null){
      request.setAttribute("message","삭제할 요가스토리를 찾을 수 없습니다.");
      request.setAttribute("url","yogaStory.yo");
      return;
    }
    int res=dao.setYogaStoryDelete(idx);
    if(res!=0){
      String realPath=request.getServletContext().getRealPath("/images/data/yogaStory/");
      if(vo.getPhoto()!=null&&!vo.getPhoto().isEmpty()) new File(realPath+vo.getPhoto()).delete();
      request.setAttribute("message","요가스토리가 삭제되었습니다.");
    }else{
      request.setAttribute("message","요가스토리 삭제에 실패했습니다.");
    }
    request.setAttribute("url","yogaStory.yo");
  }
}
