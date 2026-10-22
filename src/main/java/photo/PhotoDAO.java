package photo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class PhotoDAO {
  private final Connection conn = GetConn.getConn();
  private PreparedStatement pstmt = null;
  private ResultSet rs = null;
  private String sql = "";

  private void pstmtClose() {
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException e) {}
    }
  }

  private void rsClose() {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {}
    }
    pstmtClose();
  }

  public int setPhotoInput(PhotoVO vo) {
    int res = 0;
    try {
      sql = "insert into photo (title, content, photoName) values (?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getPhotoName());
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setPhotoInput) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public List<PhotoVO> getPhotoList() {
    return getPhotoList(0);
  }

  public List<PhotoVO> getPhotoList(int limit) {
    List<PhotoVO> vos = new ArrayList<PhotoVO>();
    try {
      sql = limit > 0
        ? "select idx, title, content, photoName, photoDate from photo order by idx desc limit ?"
        : "select idx, title, content, photoName, photoDate from photo order by idx desc";
      pstmt = conn.prepareStatement(sql);
      if (limit > 0) pstmt.setInt(1, limit);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        vos.add(getPhotoVO(rs));
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getPhotoList) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vos;
  }

  public PhotoVO getPhotoIdx(int idx) {
    PhotoVO vo = null;
    try {
      sql = "select idx, title, content, photoName, photoDate from photo where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        vo = getPhotoVO(rs);
      }
    } catch (SQLException e) {
      System.out.println("SQL 오류(getPhotoIdx) : " + e.getMessage());
    } finally {
      rsClose();
    }
    return vo;
  }

  public int setPhotoUpdate(PhotoVO vo) {
    int res = 0;
    try {
      sql = "update photo set title = ?, content = ?, photoName = ? where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContent());
      pstmt.setString(3, vo.getPhotoName());
      pstmt.setInt(4, vo.getIdx());
      pstmt.executeUpdate();
      res = 1;
    } catch (SQLException e) {
      System.out.println("SQL 오류(setPhotoUpdate) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  public int setPhotoDelete(int idx) {
    int res = 0;
    try {
      sql = "delete from photo where idx = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, idx);
      res = pstmt.executeUpdate();
    } catch (SQLException e) {
      System.out.println("SQL 오류(setPhotoDelete) : " + e.getMessage());
    } finally {
      pstmtClose();
    }
    return res;
  }

  private PhotoVO getPhotoVO(ResultSet rs) throws SQLException {
    PhotoVO vo = new PhotoVO();
    vo.setIdx(rs.getInt("idx"));
    vo.setTitle(rs.getString("title"));
    vo.setContent(rs.getString("content"));
    vo.setPhotoName(rs.getString("photoName"));
    vo.setPhotoDate(rs.getString("photoDate"));
    return vo;
  }
}
