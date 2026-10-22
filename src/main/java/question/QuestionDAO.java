package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class QuestionDAO {
  private final Connection conn = GetConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;

  private void pstmtClose() {
    if (pstmt != null) {
      try { pstmt.close(); } catch (SQLException e) {}
    }
  }

  private void rsClose() {
    if (rs != null) {
      try { rs.close(); } catch (SQLException e) {}
    }
    pstmtClose();
  }

  public List<QuestionVO> getQuestionList(String mid, boolean admin, int startIndex, int pageSize) {
    List<QuestionVO> vos = new ArrayList<QuestionVO>();
    try {
      String sql = "select q.*, (select count(*) from answer a where a.qIdx=q.idx) as answerCount from question q";
      if (!admin) sql += " where q.mid = ?";
      sql += " order by q.idx desc limit ?, ?";
      pstmt = conn.prepareStatement(sql);
      int param = 1;
      if (!admin) pstmt.setString(param++, mid);
      pstmt.setInt(param++, startIndex);
      pstmt.setInt(param, pageSize);
      rs = pstmt.executeQuery();
      while (rs.next()) vos.add(toQuestionVO(rs));
    } catch (SQLException e) {
      System.out.println("SQL 오류(getQuestionList) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }

  public int getQuestionCount(String mid, boolean admin) {
    int count = 0;
    try {
      String sql = admin ? "select count(*) from question" : "select count(*) from question where mid = ?";
      pstmt = conn.prepareStatement(sql);
      if (!admin) pstmt.setString(1, mid);
      rs = pstmt.executeQuery();
      if (rs.next()) count = rs.getInt(1);
    } catch (SQLException e) {
      System.out.println("SQL 오류(getQuestionCount) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return count;
  }

  public QuestionVO getQuestion(int idx) {
    QuestionVO vo = null;
    try {
      pstmt = conn.prepareStatement("select * from question where idx = ?");
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if (rs.next()) vo = toQuestionVO(rs);
    } catch (SQLException e) {
      System.out.println("SQL 오류(getQuestion) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vo;
  }

  public List<QuestionVO> getAnswerList(int qIdx) {
    List<QuestionVO> vos = new ArrayList<QuestionVO>();
    try {
      pstmt = conn.prepareStatement("select a.*, m.level as answerLevel from answer a join member m on a.mid = m.mid where a.qIdx = ? order by a.idx asc");
      pstmt.setInt(1, qIdx);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        QuestionVO vo = new QuestionVO();
        vo.setAnswerIdx(rs.getInt("idx"));
        vo.setqIdx(rs.getInt("qIdx"));
        vo.setAnswerMid(rs.getString("mid"));
        vo.setAnswerContent(rs.getString("content"));
        vo.setAnswerDate(rs.getString("answerDate"));
        vo.setAnswerLevel(rs.getInt("answerLevel"));
        vos.add(vo);
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getAnswerList) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }

  public boolean hasAdminAnswer(int qIdx) {
    boolean exists = false;
    try {
      pstmt = conn.prepareStatement("select count(*) from answer a join member m on a.mid = m.mid where a.qIdx = ? and m.level = 0");
      pstmt.setInt(1, qIdx);
      rs = pstmt.executeQuery();
      if (rs.next()) exists = rs.getInt(1) > 0;
    } catch (SQLException e) {
      System.out.println("SQL 오류(hasAdminAnswer) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return exists;
  }

  public int setQuestionInput(QuestionVO vo) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("insert into question (part, mid, content, questionPhoto) values (?, ?, ?, ?)");
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getMid());
      pstmt.setString(3, vo.getContent());
      pstmt.setString(4, vo.getQuestionPhoto());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setQuestionInput) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setQuestionUpdate(QuestionVO vo) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("update question set part = ?, content = ?, questionPhoto = ? where idx = ?");
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getQuestionPhoto());
      pstmt.setInt(4, vo.getIdx());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setQuestionUpdate) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setQuestionDelete(int idx) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("delete from question where idx = ?");
      pstmt.setInt(1, idx);
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setQuestionDelete) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setAnswerInput(QuestionVO vo) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("insert into answer (qIdx, mid, content) values (?, ?, ?)");
      pstmt.setInt(1, vo.getqIdx());
      pstmt.setString(2, vo.getAnswerMid());
      pstmt.setString(3, vo.getAnswerContent());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setAnswerInput) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setAnswerUpdate(int idx, String content) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("update answer set content = ? where idx = ?");
      pstmt.setString(1, content);
      pstmt.setInt(2, idx);
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setAnswerUpdate) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setAnswerDelete(int idx) {
    int res = 0;
    try {
      pstmt = conn.prepareStatement("delete from answer where idx = ?");
      pstmt.setInt(1, idx);
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setAnswerDelete) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public QuestionVO getAnswer(int idx) {
    QuestionVO vo = null;
    try {
      pstmt = conn.prepareStatement("select a.*, m.level as answerLevel from answer a join member m on a.mid = m.mid where a.idx = ?");
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        vo = new QuestionVO();
        vo.setAnswerIdx(rs.getInt("idx"));
        vo.setqIdx(rs.getInt("qIdx"));
        vo.setAnswerMid(rs.getString("mid"));
        vo.setAnswerContent(rs.getString("content"));
        vo.setAnswerDate(rs.getString("answerDate"));
        vo.setAnswerLevel(rs.getInt("answerLevel"));
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getAnswer) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vo;
  }

  private QuestionVO toQuestionVO(ResultSet rs) throws SQLException {
    QuestionVO vo = new QuestionVO();
    vo.setIdx(rs.getInt("idx"));
    vo.setPart(rs.getString("part"));
    vo.setMid(rs.getString("mid"));
    vo.setContent(rs.getString("content"));
    vo.setQuestionDate(rs.getString("questionDate"));
    vo.setQuestionPhoto(rs.getString("questionPhoto"));
    try { vo.setAnswerCount(rs.getInt("answerCount")); } catch (SQLException e) {}
    return vo;
  }
}
