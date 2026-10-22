package yoga;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
public class YogaStoryUpdateOkCommand implements YogaInterface {
  @Override
  public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
    request.setCharacterEncoding("UTF-8");
    int idx=request.getParameter("idx")==null||request.getParameter("idx").equals("")?0:Integer.parseInt(request.getParameter("idx"));
    YogaStoryDAO dao=new YogaStoryDAO();
    YogaStoryVO oldVo=dao.getYogaStoryIdx(idx);
    if(oldVo==null){
      request.setAttribute("message","수정할 요가스토리를 찾을 수 없습니다.");
      request.setAttribute("url","yogaStory.yo");
      return;
    }
    String part=request.getParameter("part")==null?"":request.getParameter("part");
    String title=request.getParameter("title")==null?"":request.getParameter("title");
    String content=request.getParameter("content")==null?"":request.getParameter("content");
    String photo=oldVo.getPhoto();
    Part filePart=request.getPart("photo");
    if(filePart!=null&&filePart.getSize()>0){
      int maxSize=1024*1024*10;
      if(filePart.getSize()>maxSize) throw new ServletException("파일 크기는 10MB를 초과할 수 없습니다.");
      String realPath=request.getServletContext().getRealPath("/images/data/yogaStory");
      File uploadDir=new File(realPath);
      if(!uploadDir.exists()) uploadDir.mkdirs();
      String originalName=Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
      photo=System.currentTimeMillis()+"_"+originalName;
      filePart.write(new File(uploadDir,photo).getAbsolutePath());
      if(oldVo.getPhoto()!=null&&!oldVo.getPhoto().isEmpty()) new File(uploadDir,oldVo.getPhoto()).delete();
    }
    YogaStoryVO vo=new YogaStoryVO();
    vo.setIdx(idx);
    vo.setPart(part);
    vo.setTitle(title);
    vo.setContent(content);
    vo.setPhoto(photo);
    int res=dao.setYogaStoryUpdate(vo);
    request.setAttribute("message",res!=0?"요가스토리가 수정되었습니다.":"요가스토리 수정에 실패했습니다.");
    request.setAttribute("url","yogaStory.yo");
  }
}
