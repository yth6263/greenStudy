package question;

import java.util.List;

public class QuestionVO {
  private int idx;
  private String part;
  private String mid;
  private String content;
  private String questionDate;
  private String questionPhoto;
  private int answerIdx;
  private int qIdx;
  private String answerMid;
  private String answerContent;
  private String answerDate;
  private int answerLevel;
  private List<QuestionVO> answerVos;
  private int answerCount;

  public int getIdx() { return idx; }
  public void setIdx(int idx) { this.idx = idx; }
  public String getPart() { return part; }
  public void setPart(String part) { this.part = part; }
  public String getMid() { return mid; }
  public void setMid(String mid) { this.mid = mid; }
  public String getContent() { return content; }
  public void setContent(String content) { this.content = content; }
  public String getQuestionDate() { return questionDate; }
  public void setQuestionDate(String questionDate) { this.questionDate = questionDate; }
  public String getQuestionPhoto() { return questionPhoto; }
  public void setQuestionPhoto(String questionPhoto) { this.questionPhoto = questionPhoto; }
  public int getAnswerIdx() { return answerIdx; }
  public void setAnswerIdx(int answerIdx) { this.answerIdx = answerIdx; }
  public int getqIdx() { return qIdx; }
  public void setqIdx(int qIdx) { this.qIdx = qIdx; }
  public String getAnswerMid() { return answerMid; }
  public void setAnswerMid(String answerMid) { this.answerMid = answerMid; }
  public String getAnswerContent() { return answerContent; }
  public void setAnswerContent(String answerContent) { this.answerContent = answerContent; }
  public String getAnswerDate() { return answerDate; }
  public void setAnswerDate(String answerDate) { this.answerDate = answerDate; }
  public int getAnswerLevel() { return answerLevel; }
  public void setAnswerLevel(int answerLevel) { this.answerLevel = answerLevel; }
  public List<QuestionVO> getAnswerVos() { return answerVos; }
  public void setAnswerVos(List<QuestionVO> answerVos) { this.answerVos = answerVos; }
  public int getAnswerCount() { return answerCount; }
  public void setAnswerCount(int answerCount) { this.answerCount = answerCount; }
}
