package yoga;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import common.GetConn;
public class YogaDAO {
  private Connection conn = GetConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  private String sql = "";
  public void pstmtClose() {
    if(pstmt != null) {
      try {
        pstmt.close();
      } catch(SQLException e) {}
    }
  }
  public void rsClose() {
    if(rs != null) {
      try {
        rs.close();
      } catch(SQLException e) {}
    }
    pstmtClose();
  }
  public int setYogaInput(YogaVO vo) {
    int res = 0;
    try {
      sql = "insert into yoga values (default,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getContent());
      pstmt.setString(4, vo.getUrl());
      pstmt.setString(5, vo.getPhoto());
      res = pstmt.executeUpdate();
    } catch(SQLException e) {
      System.out.println("SQL오류(setYogaInput) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }
  public List<YogaVO> getYogaList(String part) {
    List<YogaVO> vos = new ArrayList<YogaVO>();
    try {
      if("전체".equals(part)) {
        sql = "select * from yoga order by idx desc";
        pstmt = conn.prepareStatement(sql);
      } else {
        sql = "select * from yoga where part=? order by idx desc";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, part);
      }
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vos.add(getYogaVO(rs));
      }
    } catch(SQLException e) {
      System.out.println("SQL 오류(getYogaList) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }
  public List<YogaVO> getYogaList(String part, int startIndex, int pageSize) {
    List<YogaVO> vos = new ArrayList<YogaVO>();
    try {
      if("전체".equals(part)) {
        sql = "select * from yoga order by idx desc limit ?,?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, startIndex);
        pstmt.setInt(2, pageSize);
      } else {
        sql = "select * from yoga where part=? order by idx desc limit ?,?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, part);
        pstmt.setInt(2, startIndex);
        pstmt.setInt(3, pageSize);
      }
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vos.add(getYogaVO(rs));
      }
    } catch(SQLException e) {
      System.out.println("SQL 오류(getYogaListPage) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }
  public int getYogaCount(String part) {
    int count = 0;
    try {
      if("전체".equals(part)) {
        sql = "select count(*) from yoga";
        pstmt = conn.prepareStatement(sql);
      } else {
        sql = "select count(*) from yoga where part=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, part);
      }
      rs = pstmt.executeQuery();
      if(rs.next()) {
        count = rs.getInt(1);
      }
    } catch(SQLException e) {
      System.out.println("SQL 오류(getYogaCount) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return count;
  }
  
  public YogaVO getYogaIdx(int idx) {
    YogaVO vo = new YogaVO();
    try {
      sql = "select * from yoga where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        vo = getYogaVO(rs);
      }
    } catch(SQLException e) {
      System.out.println("SQL 오류(getYogaIdx) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vo;
  }
  public int setYogaUpdate(YogaVO vo) {
    int res = 0;
    try {
      sql = "update yoga set part=?, title=?, content=?, url=?, photo=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getPart());
      pstmt.setString(2, vo.getTitle());
      pstmt.setString(3, vo.getContent());
      pstmt.setString(4, vo.getUrl());
      pstmt.setString(5, vo.getPhoto());
      pstmt.setInt(6, vo.getIdx());
      res = pstmt.executeUpdate();
    } catch(SQLException e) {
      System.out.println("SQL 오류(setYogaUpdate) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }
  public int setYogaDelete(int idx) {
    int res = 0;
    try {
      sql = "delete from yoga where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      res = pstmt.executeUpdate();
    } catch(SQLException e) {
      System.out.println("SQL오류(setYogaDelete) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }
  private YogaVO getYogaVO(ResultSet rs) throws SQLException {
    YogaVO vo = new YogaVO();
    vo.setIdx(rs.getInt("idx"));
    vo.setPart(rs.getString("part"));
    vo.setTitle(rs.getString("title"));
    vo.setContent(rs.getString("content"));
    vo.setUrl(rs.getString("url"));
    vo.setPhoto(rs.getString("photo"));
    return vo;
  }
}