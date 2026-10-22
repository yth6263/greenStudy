package photo;

public class PhotoVO {
  private int idx;
  private String title;
  private String content;
  private String photoName;
  private String photoDate;

  public int getIdx() {
    return idx;
  }

  public void setIdx(int idx) {
    this.idx = idx;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public String getPhotoName() {
    return photoName;
  }

  public void setPhotoName(String photoName) {
    this.photoName = photoName;
  }

  public String getPhotoDate() {
    return photoDate;
  }

  public void setPhotoDate(String photoDate) {
    this.photoDate = photoDate;
  }
}
