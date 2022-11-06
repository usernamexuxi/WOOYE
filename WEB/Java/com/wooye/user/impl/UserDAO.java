package com.wooye.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.wooye.board.BoardVO;
import com.wooye.common.JDBCUtil;
import com.wooye.user.UserVO;

//DAO(Data Access Object)
@Repository("userDAO")
public class UserDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String USER_GET = "select * from users where id=? and password=?";
	private final String USER_JOIN = "INSERT INTO users (ID, PASSWORD, NAME, NICKNAME, NUMBER, BIRTH) VALUES (?,?,?,?,?,?)";
	private final String USER_LIST = "select id, password, name, nickname from users";
	private final String USER_BYE = "delete from users where id=?";
	private final String MYPAGE_MODIFY = "update users set password=?, name=?, nickname=? where id=?";

	// CRUD 기능의 메소드 구현
	// 로그인
	public UserVO getUser(UserVO vo) {
		UserVO users = null;
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if (rs.next()) {
				users = new UserVO();
				users.setId(rs.getString("ID"));
				users.setPassword(rs.getString("PASSWORD"));
				users.setName(rs.getString("NAME"));
				users.setNickname(rs.getString("NICKNAME"));
				users.setRole(rs.getInt("ROLE"));
				users.setNumber(rs.getString("NUMBER"));
				users.setBirth(rs.getString("BIRTH"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return users;
	}

	// 회원가입
	public void userjoin(UserVO vo) {
		try {
			System.out.println("===> JDBC로 userjoin() 기능 처리");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_JOIN);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getNickname());
			stmt.setString(5, vo.getNumber());
			stmt.setString(6, vo.getBirth());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 마이페이지 - 회원목록
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("===> JDBC로 getUserList() 기능 처리");
		List<UserVO> userList = new ArrayList<UserVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setNickname(rs.getString("NICKNAME"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return userList;
	}

	// 글 삭제
	public void deleteUser(String id) {
		System.out.println("===> JDBC로 deleteUser() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_BYE);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 마이페이지 - 내 정보 수정
	public void mypageModify(UserVO vo) {
		System.out.println("===> JDBC로 mypageModify() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYPAGE_MODIFY);
			stmt.setString(1, vo.getPassword());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getNickname());
			stmt.setString(4, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}