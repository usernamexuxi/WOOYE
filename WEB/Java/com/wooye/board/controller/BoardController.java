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

	// �� ��� ��ȸ, �Խ��� ������ �̵�
	@RequestMapping(value = "/boardmain.do", method = RequestMethod.GET)
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model) {
		// Model ���� ����
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		List boardList = new ArrayList();
		boardList = boardDAO.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} �������� ���ͼ� ���⼭ ������ */
		Collections.reverse(boardList);
		model.addAttribute("boardList_nick", boardList);
		return "board/board_main"; // View �̸� ����
	}

	// �� �� ��ȸ
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model, BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// �Խñ� ��ȸ��
		boardDAO.getBoardCnt(vo);
		BoardVO getvo = boardDAO.getBoard(vo);
		model.addAttribute("board", getvo); // Model ���� ����
		String name = boardDAO.getnameBoard(getvo);
		model.addAttribute("name", name);
		// ��� ����Ʈ ��������
		String num = HttpServletRequest.getParameter("seq");
		model.addAttribute("commentList", commentDAO.getcommentList(cvo, num));
		return "board/getBoard"; // View �̸� ����
	}
	
	// �Խñ� ���ƿ�
	@RequestMapping(value = "/likeboard.do")
	public String insertBoardPage(Model model, BoardVO vo, BoardDAO boardDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		String id = HttpServletRequest.getParameter("id");
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		if(boardDAO.BoardLikeCheck(id, seq) == 1) {
			// ������ �� -> ���ƿ� ��� -> ���̱�
			boardDAO.BoardLikeF(id, seq);
			int heart = boardDAO.BoardLikeHow(seq);
			boardDAO.BoardLike(seq, heart);
		} else {
			//�� ������ �� -> ���ƿ� �߰� -> ���̱�
			boardDAO.BoardLikeT(id, seq);
			int heart = boardDAO.BoardLikeHow(seq);
			boardDAO.BoardLike(seq, heart);
		}
		model.addAttribute("board_seq", seq);
		return "board/likeBoard_check";
	}

	// �� ��� ������ �̵�
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoardPage(Model model) {
		return "board/insertBoard";
	}

	// �� ���
	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		boardDAO.insertBoard(vo);
		return "board/insertBoard_check";

	}

	// �� ����
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, BoardDAO boardDAO) {
		boardDAO.updateBoard(vo);
		return "board/modifyBoard_check";
	}

	// �� ����
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO, CommentDAO commentDAO) {
		// ��ۺ��� ����
		int seq = vo.getSeq();
		commentDAO.deleteComments(seq);
		boardDAO.likeBoard_b(seq);
		boardDAO.deleteBoard(vo);
		return "board/deleteBoard_check";
	}

	// �˻� ���� ��� ����
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("����", "TITLE");
		conditionMap.put("����", "CONTENT");
		return conditionMap;
	}

	// �Խñ� �˻�
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
					.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} �������� ���ͼ� ���⼭ ������ */
			Collections.reverse(boardList);
			model.addAttribute("boardList_nick", boardList);
		} else if (value.equals("CONTENT")) {
			vo.setContent(searchKeyword);
			model.addAttribute("searchBoardList", boardDAO.searchBoardList_C(vo));
			boardList = boardDAO
					.getnameBoardlist(vo); /* getBoardList.jsp ${boardList_nick[i.index]} �������� ���ͼ� ���⼭ ������ */
			Collections.reverse(boardList);
			model.addAttribute("boardList_nick", boardList);
		}
		// �г������� ������ ��ġ��
		return "board/searchBoardlist"; // View �̸� ����
	}

	// ��� ���
	@RequestMapping(value = "/boardcmt_input.do", method = RequestMethod.POST)
	public String commentInput(CommentVO cvo, CommentDAO commentDAO, Model model, BoardVO vo, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		commentDAO.commentInput(cvo);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/boardComment_check";
	}

	// ��� ����
	@RequestMapping("/boardcmt_update.do")
	public String commentupdat(@ModelAttribute("comment") CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest, BoardVO vo, Model model) {
		String num = HttpServletRequest.getParameter("cnum");
		commentDAO.updateComment(cvo, num);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/boardComment_check";
	}

	// ��� ����
	@RequestMapping("/boardcmt_delete.do")
	public String commentdelete(CommentVO cvo, CommentDAO commentDAO, BoardVO vo, javax.servlet.http.HttpServletRequest HttpServletRequest, Model model) {
		commentDAO.deleteComment(cvo);
		model.addAttribute("board_seq", HttpServletRequest.getParameter("board_seq"));
		return "board/deleteComment_check";
	}

	// �Խñ� �Ű�
	@RequestMapping("/board_clean.do")
	public String cleanboard(UserVO uvo, BoardVO vo, BoardDAO boardDAO) {
		// �Ű��� ���̵�
		String id = uvo.getId();
		int num = vo.getSeq();
		String writer = vo.getWriter();
		String title = vo.getTitle();
		boardDAO.boardclean(id, num, writer, title);
		return "board/clean_check";
	}

	// �Խñ� ��� �Ű�
	@RequestMapping("/boardcmt_clean.do")
	public String cleanboardcmt(UserVO uvo, BoardVO vo, CommentVO cvo, CommentDAO commentDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// �Ű��� ���̵�
		String id = uvo.getId();
		int bnum = Integer.parseInt(HttpServletRequest.getParameter("bnum"));
		int cnum = Integer.parseInt(HttpServletRequest.getParameter("cnum"));
		String writer = HttpServletRequest.getParameter("writer");
		String content = HttpServletRequest.getParameter("content");
		commentDAO.boardcmtclean(id, bnum, cnum, writer, content);
		return "board/clean_check";
	}
}
