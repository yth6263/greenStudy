package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.GetConn;

public class MemberDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	
	// conn객체 닫기
	public void connClose() {
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {}
	}
	
	// pstmt객체 닫기
	public void pstmtClose() {
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {}
	}
	
	// rs객체 닫기
	public void rsClose() {
		if(rs != null)
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
	}

	// 아이디 검색
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(getMemberIdCheck) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원 가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberJoinOk) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 접속자의 최종 접속 시간 업데이트 처리
	public void setLastDateUpdate(String mid) {
		try {
			sql = "update member set lastDate = now() where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberJoinOk) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 전체 회원 수
	public int getMemberCount() {
	  int totalCount = 0;
	  try {
	    sql = "select count(*) from member";
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery();
	    if(rs.next()) totalCount = rs.getInt(1);
	  } catch (SQLException e) {
	    System.out.println("SQL 오류(getMemberCount) : " + e.getMessage());
	  } finally {
	    rsClose();
	  }
	  return totalCount;
	}

	// 전체 리스트
	public List<MemberVO> getMemberList() {
	  return getMemberList(0, -1);
	}

	// 페이징 회원 리스트
	public List<MemberVO> getMemberList(int startIndex, int pageSize) {
	  List<MemberVO> vos = new ArrayList<MemberVO>();
	  try {
	    if(pageSize < 0) {
	      sql = "select * from member order by idx desc";
	      pstmt = conn.prepareStatement(sql);
	    } else {
	      sql = "select * from member order by idx desc limit ?, ?";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, startIndex);
	      pstmt.setInt(2, pageSize);
	    }
	    rs = pstmt.executeQuery();
	    while(rs.next()) {
	      MemberVO vo = new MemberVO();
	      vo.setIdx(rs.getInt("idx"));
	      vo.setMid(rs.getString("mid"));
	      vo.setPwd(rs.getString("pwd"));
	      vo.setNickName(rs.getString("nickName"));
	      vo.setName(rs.getString("name"));
	      vo.setGender(rs.getString("gender"));
	      vo.setBirthday(rs.getString("birthday"));
	      vo.setTel(rs.getString("tel"));
	      vo.setAddress(rs.getString("address"));
	      vo.setEmail(rs.getString("email"));
	      vo.setHomePage(rs.getString("homePage"));
	      vo.setJob(rs.getString("job"));
	      vo.setHobby(rs.getString("hobby"));
	      vo.setPhoto(rs.getString("photo"));
	      vo.setContent(rs.getString("content"));
	      vo.setUserInfor(rs.getString("userInfor"));
	      vo.setUserDel(rs.getString("userDel"));
	      vo.setPoint(rs.getInt("point"));
	      vo.setLevel(rs.getInt("level"));
	      vo.setVisitCnt(rs.getInt("visitCnt"));
	      vo.setStartDate(rs.getString("startDate"));
	      vo.setLastDate(rs.getString("lastDate"));
	      vo.setTodayCnt(rs.getInt("todayCnt"));
	      vos.add(vo);
	    }
	  } catch (SQLException e) {
	    System.out.println("SQL 오류(getMemberList) : " + e.getMessage());
	  } finally {
	    rsClose();
	  }
	  return vos;
	}

	// 회원 등급 변경 처리
	public int setMemberLevelChange(int idx, int level) {
		int res = 0;
		try {
			sql = "update member set level = ? where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류(setMemberLevelChange) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 닉네임 중복체크(닉네임으로 자료수집처리)
	public MemberVO getMemberNickCheck(String nickName) {
		MemberVO vo = new MemberVO();
		try {
			sql = "select * from member where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
}
