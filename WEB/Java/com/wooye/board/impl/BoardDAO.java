package com.wooye.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.wooye.board.BoardVO;
import com.wooye.board.CleanBoardVO;
import com.wooye.board.CommentVO;
import com.wooye.common.JDBCUtil;

// DAO(Data Access Object)
@Repository("boardDAO")
public class BoardDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL 명령어들
	// private final String BOARD_INSERT = "insert into board(seq, title, writer,
	// content) values((select nvl(max(seq), 0)+1 from board
	// ALIAS_FOR_SUBQUERY),?,?,?)";
	private final String BOARD_INSERT = "insert into board(seq, title, writer, content, regdate) values((select IFNULL(max(seq), 0)+1 from board ALIAS_FOR_SUBQUERY),?,?,?,?)";
	private final String BOARD_GETNAME = "select NICKNAME from board inner join users on board.WRITER = users.ID where board.WRITER = ?";
	private final String BOARD_GETNAMELIST = "select NICKNAME from board inner join users on board.WRITER = users.ID where not board.WRITER is NULL ORDER BY SEQ ASC";
	private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
	private final String BOARD_DELETE = "delete from board where seq=?";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_LIST_T = "select * from board where title like CONCAT('%', ?, '%') order by seq desc";
	private final String BOARD_LIST_C = "select * from board where content like CONCAT('%', ?, '%') order by seq desc";
	private final String CLEAN_BOARD = "INSERT INTO clean_board(seq, id, board_num, board_writer, board_title) values ((select IFNULL(max(seq), 0)+1 from clean_board ALIAS_FOR_SUBQUERY), ?, ?, ?, ?)";
	private final String CLEANBOARD_LIST = "select * from clean_board order by board_num desc";
	private final String CLEANBOARD_DELETE = "delete from clean_board where seq=?";
	private final String F_CDELETE = "delete from clean_board where id=?";
	private final String F_DELETE = "delete from board where writer=?";
	private final String MY_BOARD = "select * from board where writer=? order by seq desc";
	private final String LIKE_CHECK = "select board_num from board_like where id=?";
	private final String BOARDLIKE_T = "insert into board_like(seq, id, board_num) values((select IFNULL(max(seq), 0)+1 from board_like ALIAS_FOR_SUBQUERY),?,?)";
	private final String BOARDLIKE_F = "delete from board_like where id=? and board_num=?";
	private final String BOARD_LIKEHOW = "select * from board_like where board_num=?";
	private final String BOARD_LIKE = "update board set heart=? where seq=?";
	private final String BOARDLIKE_B = "delete from board_like where board_num=?";
	private final String BOARDLIKE_U = "delete from board_like where id=?";

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setString(4, vo.getRegDate());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 아이디로 닉네임 가져오기 : 하나하나
	public String getnameBoard(BoardVO vo) {
		System.out.println("===> JDBC로 getnametBoard() 기능 처리");
		String name = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GETNAME);
			stmt.setString(1, vo.getWriter());
			rs = stmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("NICKNAME");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return name;
	}

	// 아이디로 닉네임 가져오기 : 리스트
	public List<String> getnameBoardlist(BoardVO vo) {
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		List<String> boardList = new ArrayList<String>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GETNAMELIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("NICKNAME");
				boardList.add(name);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		System.out.println(boardList);
		return boardList;
	}

	// 글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 상세 조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		BoardVO board = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();

			if (rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getString("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setHeart(rs.getInt("HEART"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return board;
	}

	// 글 상세 조회 : 조회수
	public void getBoardCnt(BoardVO vo) {
		System.out.println("===> JDBC로 getBoardCnt() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			String sql = "update board set cnt = cnt + 1 where seq=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
			System.out.println("조회수 +1");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}

	// 게시글 좋아요 눌렀는 지 확인
	public int BoardLikeCheck(String id, int seq) {
		System.out.println("===> JDBC로 BoardLikeCheck() 기능 처리");
		int num = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(LIKE_CHECK);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				if (rs.getInt("board_num") == seq) {
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

	// 게시글 좋아요 추가
	public void BoardLikeT(String id, int seq) {
		System.out.println("===> JDBC로 BoardLikeT() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARDLIKE_T);
			stmt.setString(1, id);
			stmt.setInt(2, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 게시글 좋아요 취소
	public void BoardLikeF(String id, int seq) {
		System.out.println("===> JDBC로 BoardLikeF() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARDLIKE_F);
			stmt.setString(1, id);
			stmt.setInt(2, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 게시글 좋아요 수 구하기
	public int BoardLikeHow(int seq) {
		System.out.println("===> JDBC로 BoardLikeHow() 기능 처리");
		int heart = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIKEHOW);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				heart += 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return heart;
	}
	
	// 좋아요 수 board.heart에 넣기
	public void BoardLike(int seq, int heart) {
		System.out.println("===> JDBC로 BoardLike() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIKE);
			stmt.setInt(1, heart);
			stmt.setInt(2, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 게시글 좋아요-유저 디비 삭제 : 글 삭제 시
	public void likeBoard_b(int seq) {
		System.out.println("===> JDBC로 likeBoard_b() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARDLIKE_B);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 게시글 좋아요-유저 디비 삭제 : 회원 탈퇴 시
	public void likeBoard_u(String id) {
		System.out.println("===> JDBC로 likeBoard_u() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARDLIKE_U);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// 글 목록 조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getString("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setHeart(rs.getInt("HEART"));
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}

	// 글 검색 (제목)
	public List<BoardVO> searchBoardList_T(BoardVO vo) {
		System.out.println("===> JDBC로 searchBoardList_T() 기능 처리");
		List<BoardVO> searchBoardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST_T);
			stmt.setString(1, vo.getTitle());
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setTitle(rs.getString("TITLE"));
				board.setSeq(rs.getInt("SEQ"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getString("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setHeart(rs.getInt("HEART"));
				searchBoardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return searchBoardList;
	}

	// 글 검색 (내용)
	public List<BoardVO> searchBoardList_C(BoardVO vo) {
		System.out.println("===> JDBC로 searchBoardList_C() 기능 처리");
		List<BoardVO> searchBoardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST_C);
			stmt.setString(1, vo.getContent());
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setContent(rs.getString("CONTENT"));
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setRegDate(rs.getString("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setHeart(rs.getInt("HEART"));
				searchBoardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return searchBoardList;
	}

	// 게시글 신고 등록
	public void boardclean(String id, int num, String writer, String title) {
		System.out.println("===> JDBC로 boardclean() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEAN_BOARD);
			stmt.setString(1, id);
			stmt.setInt(2, num);
			stmt.setString(3, writer);
			stmt.setString(4, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 신고 게시글 리스트
	public List<CleanBoardVO> cleanboardList(CleanBoardVO vo) {
		System.out.println("===> JDBC로 cleanboardList() 기능 처리");
		List<CleanBoardVO> boardList = new ArrayList<CleanBoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANBOARD_LIST);
			rs = stmt.executeQuery();
			while (rs.next()) {
				CleanBoardVO board = new CleanBoardVO();
				board.setSeq(rs.getInt("seq"));
				board.setId(rs.getString("id"));
				board.setBoard_num(rs.getInt("board_num"));
				board.setBoard_writer(rs.getString("board_writer"));
				board.setBoard_title(rs.getString("board_title"));
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return boardList;
	}

	// 신고 게시글 삭제
	public void cleandeleteBoard(int seq) {
		System.out.println("===> JDBC로 cleandeleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CLEANBOARD_DELETE);
			stmt.setInt(1, seq);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 탈퇴 회원 신고 댓글 삭제
	public void cdBoard(String id) {
		System.out.println("===> JDBC로 cdBoard() 기능 처리");
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

	// 탈퇴 회원 게시글 삭제
	public void dBoard(String id) {
		System.out.println("===> JDBC로 dBoard() 기능 처리");
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

	// 마이페이지 게시글 목록 조회
	public List<BoardVO> getMyBoardList(String id) {
		System.out.println("===> JDBC로 getMyBoardList() 기능 처리");
		List<BoardVO> myboardList = new ArrayList<BoardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MY_BOARD);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegDate(rs.getString("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setHeart(rs.getInt("HEART"));
				myboardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return myboardList;
	}

}