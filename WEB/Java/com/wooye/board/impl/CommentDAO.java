package com.wooye.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wooye.board.BoardVO;
import com.wooye.board.CleanCommentVO;
import com.wooye.board.CommentVO;
import com.wooye.common.JDBCUtil;

@Repository("CommentDAO")
public class CommentDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	private final String COMMENT_INSERT = "insert into board_comment(comment_num, comment_content, board_num, id, comment_date) values((select IFNULL(max(comment_num), 0)+1 from board_comment ALIAS_FOR_SUBQUERY),?,?,?,?)";
	private final String COMMENT_LIST = "select comment_num, comment_content, comment_date, id from board_comment inner join board on board_comment.board_num = board.seq where board_comment.board_num = ? order by comment_num ASC";
	private final String COMMENT_UPDATE = "update board_comment set comment_content=? where comment_num=?";
	private final String COMMENT_DELETE = "delete from board_comment where comment_num=?";
	private final String COMMENTS_DELETE = "delete from board_comment where board_num=?";
	private final String CLEAN_COMMENT = "INSERT INTO clean_comment(seq, id, board_num, comment_num, comment_writer, comment_content) values ((select IFNULL(max(seq), 0)+1 from clean_comment ALIAS_FOR_SUBQUERY), ?, ?, ?, ?, ?)";
	private final String CLEANCOMMENT_LIST = "select * from clean_comment order by comment_num desc";
	//private final String CLEANCOMMENT_LIST = "select id, board_num, comment_num, comment_content from clean_comment inner join board_comment on board_comment.comment_num = clean_comment.comment_num order by comment_num desc";
	private final String CLEANCOMMENT_DELETE = "delete from clean_comment where board_num=?";
	private final String CLEANCOMMENT_DELETE2 = "delete from clean_comment where seq=?";
	private final String F_CDELETE = "delete from clean_comment where id=?";
	private final String F_DELETE = "delete from board_comment where id=?";
	private final String MYCOMMENT_LIST = "select comment_num, comment_content, comment_date, id from board_comment where id= ? order by comment_num ASC";

	// 댓글 등록
	public void commentInput(CommentVO vo) {
		System.out.println("===> JDBC로 commentInput() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_INSERT);
			stmt.setString(1, vo.getComment_content());
			stmt.setInt(2, vo.getBoard_num());
			stmt.setString(3, vo.getId());
			stmt.setString(4, vo.getComment_date());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 댓글 리스트
	public List<CommentVO> getcommentList(CommentVO vo, String num) {
		System.out.println("===> JDBC로 getcommentList() 기능 처리");
		List<CommentVO> commentList = new ArrayList<CommentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_LIST);
			stmt.setString(1, num);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setComment_num(rs.getInt("comment_num"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setId(rs.getString("id"));
				comment.setComment_date(rs.getString("comment_date"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return commentList;
	}

	// 댓글 수정
	public void updateComment(CommentVO cvo, String num) {
		System.out.println("===> JDBC로 updateComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_UPDATE);
			stmt.setString(1, cvo.getComment_content());
			stmt.setString(2, num);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 댓글 삭제
	public void deleteComment(CommentVO cvo) {
		System.out.println("===> JDBC로 deleteComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_DELETE);
			stmt.setInt(1, cvo.getComment_num());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 게시글 삭제 시 해당 게시글 댓글 모두 삭제
	public void deleteComments(int seq) {
		System.out.println("===> JDBC로 deleteComments() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENTS_DELETE);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 게시글 댓글 신고 등록
	public void boardcmtclean(String id, int bnum, int cnum, String writer, String content) {
		System.out.println("===> JDBC로 boardcmtclean() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEAN_COMMENT);
			stmt.setString(1, id);
			stmt.setInt(2, bnum);
			stmt.setInt(3, cnum);
			stmt.setString(4, writer);
			stmt.setString(5, content);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 신고 댓글 리스트
	public List<CleanCommentVO> cleancommentList(CleanCommentVO vo) {
		System.out.println("===> JDBC로 cleancommentList() 기능 처리");
		List<CleanCommentVO> commentList = new ArrayList<CleanCommentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANCOMMENT_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CleanCommentVO comment = new CleanCommentVO();
				comment.setSeq(rs.getInt("seq"));
				comment.setId(rs.getString("id"));
				comment.setBoard_num(rs.getInt("board_num"));
				comment.setComment_num(rs.getInt("comment_num"));
				comment.setComment_writer(rs.getString("comment_writer"));
				comment.setComment_content(rs.getString("comment_content"));
				commentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return commentList;
	}

	// 신고 댓글 삭제 : 게시글 지울 때
	public void cleandeleteComment(int seq) {
		System.out.println("===> JDBC로 cleandeleteComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANCOMMENT_DELETE);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 신고 댓글 삭제 : 댓글 지울 때
	public void cleandeleteComment2(int seq) {
		System.out.println("===> JDBC로 cleandeleteComment2() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANCOMMENT_DELETE2);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 탈퇴 회원 신고 댓글 삭제
	public void cdComment(String id) {
		System.out.println("===> JDBC로 cdComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(F_CDELETE);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 탈퇴 회원 댓글 삭제
	public void dComment(String id) {
		System.out.println("===> JDBC로 dComment() 기능 처리");
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

	// 마이페이지 : 댓글 리스트
	public List<CommentVO> getMycommentList(String id) {
		System.out.println("===> JDBC로 getMycommentList() 기능 처리");
		List<CommentVO> mycommentList = new ArrayList<CommentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYCOMMENT_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setComment_num(rs.getInt("comment_num"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setId(rs.getString("id"));
				comment.setComment_date(rs.getString("comment_date"));
				mycommentList.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return mycommentList;
	}

	// 마이페이지 내가 쓴 댓글 삭제 : 신고 댓글 삭제
	public void MycleandeleteComment(int seq) {
		System.out.println("===> JDBC로 MycleandeleteComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANCOMMENT_DELETE2);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 마이페이지 내가 쓴 댓글 삭제 : 댓글 삭제
	public void MydeleteComment(int seq) {
		System.out.println("===> JDBC로 MydeleteComment() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COMMENT_DELETE);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}
