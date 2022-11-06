package com.wooye.excon.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.wooye.excon.ExconVO;
import com.wooye.user.UserVO;
import com.wooye.board.BoardVO;
import com.wooye.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("ExconDAO")
public class ExconDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들

	private final String EXCON_INSERT = "INSERT INTO excon_user(seq, user_id, excon_seq, excon_name, start_date, end_date, place, genre) values ((select IFNULL(max(seq), 0)+1 from excon_user ALIAS_FOR_SUBQUERY), ?, ?, ?, ?, ?, ?, ?);";
	private final String MYEXCON_LIST = "select seq, excon_seq, excon_name, start_date, end_date, place, genre from excon_user where user_id =?";
	private final String MYEXCON_DELETE = "delete from excon_user where seq=?";
	private final String F_DELETE = "delete from excon_user where user_id=?";
	private final String EXCON_CHECK = "select excon_seq from excon_user where user_id=?";

	// CRUD 기능의 메소드 구현
	// DB 등록

	// 전시회_유저 중복 등록 검사해서 중복값 못 넣게
	public int checkExcon(String id, String seq) {
		int num = 0;
		System.out.println("===> JDBC로 checkExcon() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EXCON_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				if (seq.equals(rs.getString("excon_seq"))) {
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

	// insert
	public void insertExcon(ExconVO vo) {
		System.out.println("===> JDBC로 insertExcon() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(EXCON_INSERT);
			stmt.setString(1, vo.getUser_id());
			stmt.setString(2, vo.getExcon_seq());
			stmt.setString(3, vo.getExcon_name());
			stmt.setString(4, vo.getStart_date());
			stmt.setString(5, vo.getEnd_date());
			stmt.setString(6, vo.getPlace());
			stmt.setString(7, vo.getGenre());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("excon_user");
			JDBCUtil.close(stmt, conn);
		}
	}

	// 마이페이지 전시회/공연 예약 내역
	public List<ExconVO> getmyexconlist(String id) {
		System.out.println("===> JDBC로 getmyexconlist() 기능 처리");
		List<ExconVO> exconList = new ArrayList<ExconVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYEXCON_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ExconVO excon = new ExconVO();
				excon.setSeq(rs.getInt("seq"));
				excon.setExcon_seq(rs.getString("excon_seq"));
				excon.setExcon_name(rs.getString("excon_name"));
				excon.setStart_date(rs.getString("start_date"));
				excon.setEnd_date(rs.getString("end_date"));
				excon.setPlace(rs.getString("place"));
				excon.setGenre(rs.getString("genre"));
				exconList.add(excon);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return exconList;
	}

	// 글 삭제
	public ExconVO deleteExcon(ExconVO vo) {
		System.out.println("===> JDBC로 deleteExcon() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYEXCON_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return vo;
	}

	// 탈퇴 회원 전시회/공연 삭제
	public void dExcon(String id) {
		System.out.println("===> JDBC로 dExcon() 기능 처리");
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

}