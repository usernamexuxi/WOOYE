package com.wooye.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wooye.board.BoardVO;
import com.wooye.board.CommentVO;
import com.wooye.board.BoardService;
import com.wooye.board.impl.BoardDAO;
import com.wooye.board.impl.CommentDAO;
import com.wooye.user.UserVO;
import com.wooye.board.CleanBoardVO;
import com.wooye.board.CleanCommentVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	// 글 목록 조회, 게시판 페이지 이동
	@RequestMapping(value = "/boardmain.do", method = RequestMethod.GET)
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model) {
		// Model 정보 저장
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		List boardList = new ArrayList();
		boardList = boardDAO.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} 역순으로 나와서 여기서 뒤집음 */
		Collections.reverse(boardList);
		model.addAttribute("boardList_nick", boardList);
		return "board/board_main"; // View 이름 리턴
	}

	// 글 상세 조회
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model, BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// 게시글 조회수
		boardDAO.getBoardCnt(vo);
		BoardVO getvo = boardDAO.getBoard(vo);
		model.addAttribute("board", getvo); // Model 정보 저장
		String name = boardDAO.getnameBoard(getvo);
		model.addAttribute("name", name);
		// 댓글 리스트 가져오기
		String num = HttpServletRequest.getParameter("seq");
		model.addAttribute("commentList", commentDAO.getcommentList(cvo, num));
		return "board/getBoard"; // View 이름 리턴
	}
	
	// 게시글 좋아요
	@RequestMapping(value = "/likeboard.do")
	public String insertBoardPage(Model model, BoardVO vo, BoardDAO boardDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		String id = HttpServletRequest.getParameter("id");
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		if(boardDAO.BoardLikeCheck(id, seq) == 1) {
			// 눌렀을 때 -> 좋아요 취소 -> 보이기
			boardDAO.BoardLikeF(id, seq);
			int heart = boardDAO.BoardLikeHow(seq);
			boardDAO.BoardLike(seq, heart);
		} else {
			//안 눌렀을 때 -> 좋아요 추가 -> 보이기
			boardDAO.BoardLikeT(id, seq);
			int heart = boardDAO.BoardLikeHow(seq);
			boardDAO.BoardLike(seq, heart);
		}
		model.addAttribute("board_seq", seq);
		return "board/likeBoard_check";
	}

	// 글 등록 페이지 이동
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoardPage(Model model) {
		return "board/insertBoard";
	}

	// 글 등록
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		boardDAO.insertBoard(vo);
		return "board/insertBoard_check";

	}

	// 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, BoardDAO boardDAO) {
		boardDAO.updateBoard(vo);
		return "board/modifyBoard_check";
	}

	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO, CommentDAO commentDAO) {
		// 댓글부터 삭제
		int seq = vo.getSeq();
		commentDAO.deleteComments(seq);
		boardDAO.likeBoard_b(seq);
		boardDAO.deleteBoard(vo);
		return "board/deleteBoard_check";
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 게시글 검색
	@RequestMapping(value = "/boardmain.do", method = RequestMethod.POST)
	public String searchBoardList(javax.servlet.http.HttpServletRequest HttpServletRequest, BoardVO vo,
			BoardDAO boardDAO, Model model) throws IOException {
		String value;
		if (HttpServletRequest.getParameter("value") == null) {
			value = "TITLE";
		} else {
			value = HttpServletRequest.getParameter("value");
		}
		String searchKeyword = HttpServletRequest.getParameter("searchKeyword");
		List boardList = new ArrayList();
		if (value.equals("TITLE")) {
			vo.setTitle(searchKeyword);
			model.addAttribute("searchBoardList", boardDAO.searchBoardList_T(vo));
			boardList = boardDAO
					.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} 역순으로 나와서 여기서 뒤집음 */
			Collections.reverse(boardList);
			model.addAttribute("boardList_nick", boardList);
		} else if (value.equals("CONTENT")) {
			vo.setContent(searchKeyword);
			model.addAttribute("searchBoardList", boardDAO.searchBoardList_C(vo));
			boardList = boardDAO
					.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} 역순으로 나와서 여기서 뒤집음 */
			Collections.reverse(boardList);
			model.addAttribute("boardList_nick", boardList);
		}
		// 닉네임으로 나오게 고치기
		return "board/searchBoardlist"; // View 이름 리턴
	}

	// 댓글 등록
	@RequestMapping(value = "/boardcmt_input.do", method = RequestMethod.POST)
	public String commentInput(CommentVO cvo, CommentDAO commentDAO, Model model, BoardVO vo, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		commentDAO.commentInput(cvo);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/boardComment_check";
	}

	// 댓글 수정
	@RequestMapping("/boardcmt_update.do")
	public String commentupdat(@ModelAttribute("comment") CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest, BoardVO vo, Model model) {
		String num = HttpServletRequest.getParameter("cnum");
		commentDAO.updateComment(cvo, num);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/boardComment_check";
	}

	// 댓글 삭제
	@RequestMapping("/boardcmt_delete.do")
	public String commentdelete(CommentVO cvo, CommentDAO commentDAO, BoardVO vo, javax.servlet.http.HttpServletRequest HttpServletRequest, Model model) {
		commentDAO.deleteComment(cvo);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/deleteComment_check";
	}

	// 게시글 신고
	@RequestMapping("/board_clean.do")
	public String cleanboard(UserVO uvo, BoardVO vo, BoardDAO boardDAO) {
		// 신고자 아이디
		String id = uvo.getId();
		int num = vo.getSeq();
		String writer = vo.getWriter();
		String title = vo.getTitle();
		boardDAO.boardclean(id, num, writer, title);
		return "board/clean_check";
	}

	// 게시글 댓글 신고
	@RequestMapping("/boardcmt_clean.do")
	public String cleanboardcmt(UserVO uvo, BoardVO vo, CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// 신고자 아이디
		String id = uvo.getId();
		int bnum = Integer.parseInt(HttpServletRequest.getParameter("bnum"));
		int cnum = Integer.parseInt(HttpServletRequest.getParameter("cnum"));
		String writer = HttpServletRequest.getParameter("writer");
		String content = HttpServletRequest.getParameter("content");
		commentDAO.boardcmtclean(id, bnum, cnum, writer, content);
		return "board/clean_check";
	}
}
