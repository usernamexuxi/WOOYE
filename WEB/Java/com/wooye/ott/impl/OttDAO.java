package com.wooye.ott.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import com.wooye.ott.OttVO;
import com.wooye.ott.UserOttVO;
import com.wooye.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("OttDAO")
public class OttDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들

	private final String ott_INSERT = "INSERT INTO user_ott(id, ott_num, title, period, content, place, price, support, artist, heart) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	private final String ott_CHECK = "select title from user_ott where id=?";
	private final String ott_GET = "select * from ott where ott_num=?";
	private final String ott_LIST = "select * from ott order by seq desc";
	private final String ott_MYLIST = "select * from user_ott where id=?";
	private final String ott_MYHOW = "select cash_get from cash where id=?";
	private final String ott_BUY = "UPDATE cash SET cash_get = cash_get - ? WHERE id=? ";
	private final String F_DELETE = "delete from user_ott where id=?";
	private final String LIKE_CHECK = "select ott_num from ott_like where id=?";
	private final String OTTLIKE_T = "insert into ott_like(seq, id, ott_num) values(((select IFNULL(max(seq), 0)+1 from ott_like ALIAS_FOR_SUBQUERY)),?,?)";
	private final String OTTLIKE_F = "delete from ott_like where id=? and ott_num=?";
	private final String OTT_LIKEHOW = "select * from ott_like where ott_num=?";
	private final String OTT_LIKE = "update ott set heart=? where ott_num=?";
	private final String OTTLIKE_U = "delete from ott_like where id=?";
	private final String GET_VIDEO = "select video from ott where title=?";

	// CRUD 기능의 메소드 구현
	// DB 등록

	// user_ott 중복 등록 검사해서 중복값 못 넣게
	public int checkOtt(String id, String title) {
		int num = 0;
		System.out.println("===> JDBC로 checkOtt() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				if (title.equals(rs.getString("title"))) {
					num = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return num;
	}

	// user_ott 등록
	public void insertOtt(String id, OttVO vo) {
		System.out.println("===> JDBC로 insertOtt() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, vo.getOtt_num());
			stmt.setString(3, vo.getTitle());
			stmt.setString(4, vo.getPeriod());
			stmt.setString(5, vo.getContent());
			stmt.setString(6, vo.getPlace());
			stmt.setString(7, vo.getPrice());
			stmt.setString(8, vo.getSupport());
			stmt.setString(9, vo.getArtist());
			stmt.setInt(10, vo.getHeart());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 금액 확인 : 결제 가능한 금액이 남았는 지에 대해...
	public int howCash(String id, int price) {
		int num = 0;
		System.out.println("===> JDBC로 howCash() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_MYHOW);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("cash_get") >= price) {
					num = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return num;
	}

	// OTT 구매
	public void buyott(String id, int price) {
		System.out.println("===> JDBC로 buyott() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_BUY);
			stmt.setInt(1, price);
			stmt.setString(2, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ott 상세 조회
	public OttVO getOtt(OttVO vo) {
		System.out.println("===> JDBC로 getOtt() 기능 처리");
		OttVO ott = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_GET);
			stmt.setString(1, vo.getOtt_num());
			rs = stmt.executeQuery();

			if (rs.next()) {
				ott = new OttVO();
				ott.setOtt_num(rs.getString("ott_num"));
				ott.setTitle(rs.getString("title"));
				ott.setPeriod(rs.getString("period"));
				ott.setContent(rs.getString("content"));
				ott.setPlace(rs.getString("place"));
				ott.setPrice(rs.getString("price"));
				ott.setSupport(rs.getString("support"));
				ott.setArtist(rs.getString("artist"));
				ott.setHeart(rs.getInt("HEART"));
				ott.setImg(rs.getString("img"));
				ott.setVideo(rs.getString("video"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ott;
	}

	// ott 목록 조회
	public List<OttVO> getOttList(OttVO vo) {
		System.out.println("===> JDBC로 getOttList() 기능 처리");
		List<OttVO> ottList = new ArrayList<OttVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_LIST);
			rs = stmt.executeQuery();

			while (rs.next()) {
				OttVO ott = new OttVO();
				ott.setOtt_num(rs.getString("ott_num"));
				ott.setTitle(rs.getString("title"));
				ott.setPeriod(rs.getString("period"));
				ott.setContent(rs.getString("content"));
				ott.setPlace(rs.getString("place"));
				ott.setPrice(rs.getString("price"));
				ott.setSupport(rs.getString("support"));
				ott.setArtist(rs.getString("artist"));
				ott.setHeart(rs.getInt("HEART"));
				ottList.add(ott);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ottList;
	}

	// 마이페이지 OTT 조회 : getMyottList
	public List<UserOttVO> getMyottList(String id) {
		System.out.println("===> JDBC로 getMyottList() 기능 처리");
		List<UserOttVO> ottList = new ArrayList<UserOttVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(ott_MYLIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserOttVO ott = new UserOttVO();
				ott.setOtt_num(rs.getString("ott_num"));
				ott.setTitle(rs.getString("title"));
				ott.setPeriod(rs.getString("period"));
				ott.setContent(rs.getString("content"));
				ott.setPlace(rs.getString("place"));
				ott.setPrice(rs.getString("price"));
				ott.setSupport(rs.getString("support"));
				ott.setArtist(rs.getString("artist"));
				ott.setHeart(rs.getInt("HEART"));
				ottList.add(ott);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return ottList;
	}

	// 탈퇴 회원 유저오티티 삭제
	public void dUserOtt(String id) {
		System.out.println("===> JDBC로 dUserOtt() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(F_DELETE);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 좋아요 눌렀는 지 확인
	public int OttLikeCheck(String id, String num) {
		System.out.println("===> JDBC로 OttLikeCheck() 기능 처리");
		int btn = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(LIKE_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				if (rs.getString("ott_num").equals(num)) {
					btn = 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return btn;
	}

	// OTT 좋아요 추가
	public void OttLikeT(String id, String num) {
		System.out.println("===> JDBC로 OttLikeT() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OTTLIKE_T);
			stmt.setString(1, id);
			stmt.setString(2, num);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 좋아요 취소
	public void OttLikeF(String id, String num) {
		System.out.println("===> JDBC로 OttLikeF() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OTTLIKE_F);
			stmt.setString(1, id);
			stmt.setString(2, num);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 좋아요 수 구하기
	public int OttLikeHow(String num) {
		System.out.println("===> JDBC로 OttLikeHow() 기능 처리");
		int heart = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OTT_LIKEHOW);
			stmt.setString(1, num);
			rs = stmt.executeQuery();
			if (rs.next()) {
				heart += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return heart;
	}

	// 좋아요 수 ott.heart에 넣기
	public void OttLike(String num, int heart) {
		System.out.println("===> JDBC로 OttLike() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OTT_LIKE);
			stmt.setInt(1, heart);
			stmt.setString(2, num);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 좋아요-유저 디비 삭제 : 회원 탈퇴 시
	public void likeOtt_u(String id) {
		System.out.println("===> JDBC로 likeOtt_u() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(OTTLIKE_U);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// OTT 제목으로 비디오 가져오기
	public String getvideo(String title) {
		System.out.println("===> JDBC로 getvideo() 기능 처리");
		String video = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(GET_VIDEO);
			stmt.setString(1, title);
			rs = stmt.executeQuery();
			if (rs.next()) {
				video = rs.getString("video");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		} 
		return video;
	}

}