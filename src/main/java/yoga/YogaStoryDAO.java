package yoga;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class YogaStoryDAO {
  private Connection conn = GetConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  private String sql = "";

  public void pstmtClose() {
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException e) {}
    }
  }

  public void rsClose() {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {}
    }
    pstmtClose();
  }

  // 요가스토리 등록
  public int setYogaStoryInput(YogaStoryVO vo) {
    int res = 0;
    try {
      sql = "insert into yogaStory (part, title, content, photo) values (?, ?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getContent());
      pstmt.setString(4, vo.getPhoto());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setYogaStoryInput) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  // 요가스토리 목록
  public List<YogaStoryVO> getYogaStoryList(int startIndex, int pageSize) {
    List<YogaStoryVO> vos = new ArrayList<YogaStoryVO>();
    try {
      sql = "select idx, part, title, content, photo from yogaStory order by idx desc limit ?, ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, startIndex);
      pstmt.setInt(2, pageSize);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        vos.add(getYogaStoryVO(rs));
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getYogaStoryList) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }

  // 요가스토리 전체 건수
  public int getYogaStoryCount() {
    int count = 0;
    try {
      sql = "select count(*) from yogaStory";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        count = rs.getInt(1);
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getYogaStoryCount) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return count;
  }

  // idx로 요가스토리 조회
  public YogaStoryVO getYogaStoryIdx(int idx) {
    YogaStoryVO vo = null;
    try {
      sql = "select idx, part, title, content, photo from yogaStory where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        vo = getYogaStoryVO(rs);
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getYogaStoryIdx) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vo;
  }

  // 요가스토리 수정
  public int setYogaStoryUpdate(YogaStoryVO vo) {
    int res = 0;
    try {
      sql = "update yogaStory set part = ?, title = ?, content = ?, photo = ? where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getContent());
      pstmt.setString(4, vo.getPhoto());
      pstmt.setInt(5, vo.getIdx());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setYogaStoryUpdate) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  // 요가스토리 삭제
  public int setYogaStoryDelete(int idx) {
    int res = 0;
    try {
      sql = "delete from yogaStory where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setYogaStoryDelete) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  // ResultSet -> VO 변환
  private YogaStoryVO getYogaStoryVO(ResultSet rs) throws SQLException {
    YogaStoryVO vo = new YogaStoryVO();
    vo.setIdx(rs.getInt("idx"));
    vo.setPart(rs.getString("part"));
    vo.setTitle(rs.getString("title"));
    vo.setContent(rs.getString("content"));
    vo.setPhoto(rs.getString("photo"));
    return vo;
  }
}
