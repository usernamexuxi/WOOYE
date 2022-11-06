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
	// JDBC ���� ����
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL ��ɾ��
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

	// ��� ���
	public void commentInput(CommentVO vo) {
		System.out.println("===> JDBC�� commentInput() ��� ó��");
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

	// ��� ����Ʈ
	public List<CommentVO> getcommentList(CommentVO vo, String num) {
		System.out.println("===> JDBC�� getcommentList() ��� ó��");
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

	// ��� ����
	public void updateComment(CommentVO cvo, String num) {
		System.out.println("===> JDBC�� updateComment() ��� ó��");
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

	// ��� ����
	public void deleteComment(CommentVO cvo) {
		System.out.println("===> JDBC�� deleteComment() ��� ó��");
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

	// �Խñ� ���� �� �ش� �Խñ� ��� ��� ����
	public void deleteComments(int seq) {
		System.out.println("===> JDBC�� deleteComments() ��� ó��");
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

	// �Խñ� ��� �Ű� ���
	public void boardcmtclean(String id, int bnum, int cnum, String writer, String content) {
		System.out.println("===> JDBC�� boardcmtclean() ��� ó��");
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

	// �Ű� ��� ����Ʈ
	public List<CleanCommentVO> cleancommentList(CleanCommentVO vo) {
		System.out.println("===> JDBC�� cleancommentList() ��� ó��");
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

	// �Ű� ��� ���� : �Խñ� ���� ��
	public void cleandeleteComment(int seq) {
		System.out.println("===> JDBC�� cleandeleteComment() ��� ó��");
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

	// �Ű� ��� ���� : ��� ���� ��
	public void cleandeleteComment2(int seq) {
		System.out.println("===> JDBC�� cleandeleteComment2() ��� ó��");
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

	// Ż�� ȸ�� �Ű� ��� ����
	public void cdComment(String id) {
		System.out.println("===> JDBC�� cdComment() ��� ó��");
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

	// Ż�� ȸ�� ��� ����
	public void dComment(String id) {
		System.out.println("===> JDBC�� dComment() ��� ó��");
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

	// ���������� : ��� ����Ʈ
	public List<CommentVO> getMycommentList(String id) {
		System.out.println("===> JDBC�� getMycommentList() ��� ó��");
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

	// ���������� ���� �� ��� ���� : �Ű� ��� ����
	public void MycleandeleteComment(int seq) {
		System.out.println("===> JDBC�� MycleandeleteComment() ��� ó��");
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

	// ���������� ���� �� ��� ���� : ��� ����
	public void MydeleteComment(int seq) {
		System.out.println("===> JDBC�� MydeleteComment() ��� ó��");
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
