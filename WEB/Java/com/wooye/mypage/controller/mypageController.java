package com.wooye.mypage.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

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
import com.wooye.excon.ExconVO;
import com.wooye.excon.impl.ExconDAO;
import com.wooye.join.impl.JoinTasteDAO;
import com.wooye.ott.CoinVO;
import com.wooye.ott.OttVO;
import com.wooye.ott.UserOttVO;
import com.wooye.ott.impl.CoinDAO;
import com.wooye.ott.impl.OttDAO;
import com.wooye.user.UserVO;
import com.wooye.user.impl.UserDAO;
import com.wooye.board.CleanBoardVO;
import com.wooye.board.CleanCommentVO;

@Controller
public class mypageController {
	@RequestMapping(value = "/mypage.do")
	public String main(Model model, ExconDAO exconDAO, UserVO uvo, UserDAO userDAO, CleanBoardVO vo, CleanCommentVO cvo,
			BoardDAO boardDAO, CommentDAO commentDAO, OttDAO ottDAO, UserOttVO uovo, CoinDAO coinDAO,
			javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// ������
		model.addAttribute("board", boardDAO.cleanboardList(vo)); // Model ���� ����
		model.addAttribute("comment", commentDAO.cleancommentList(cvo)); // Model ���� ����
		// ȸ����� Ȯ��
		model.addAttribute("userList", userDAO.getUserList(uvo));

		// ȸ��
		// ����ȸ&���� ���� ����Ʈ
		String id = HttpServletRequest.getParameter("id");
		System.out.println(id);
		model.addAttribute("myexconlist", exconDAO.getmyexconlist(id)); // Model ���� ����
		// �Խñ� ����Ʈ
		model.addAttribute("myboardlist", boardDAO.getMyBoardList(id));
		// ��� ����Ʈ
		model.addAttribute("mycommentlist", commentDAO.getMycommentList(id));
		// OTT ����Ʈ
		model.addAttribute("myottlist", ottDAO.getMyottList(id));
		// ���� ����
		model.addAttribute("coin_get", coinDAO.getMyCoin(id));
		return "mypage/myPage";
	}

	@RequestMapping(value = "/mypagemodify.do")
	public String modify(Model model, UserVO uvo, UserDAO userDAO, HttpSession session) {
		userDAO.mypageModify(uvo); // ȸ�� ���� ����
		UserVO user = userDAO.getUser(uvo);
		session.setAttribute("userId", user.getId());
		System.out.println(user.getPassword());
		session.setAttribute("userPass", user.getPassword());
		session.setAttribute("userName", user.getNickname());
		session.setAttribute("userRealName", user.getName());
		return "mypage/myPage_modify_check";
	}

	// ȸ�� ����Ż��
	@RequestMapping(value = "/byemypage.do")
	public String force(Model model, UserVO uvo, UserDAO userDAO, CleanBoardVO vo, CleanCommentVO cvo,
			BoardDAO boardDAO, CommentDAO commentDAO, ExconDAO exconDAO, CoinDAO coinDAO, OttDAO userottDAO, JoinTasteDAO jointasteDAO) {
		commentDAO.dComment(uvo.getId()); // ȸ���� �� ��� ����
		boardDAO.likeBoard_u(uvo.getId()); //ȸ���� ���ƿ� ���� �Խñ� ����
		boardDAO.dBoard(uvo.getId()); // ȸ���� �� �Խñ� ����
		commentDAO.cdComment(uvo.getId());// ȸ���� �� (�Ű�)��� ����
		boardDAO.cdBoard(uvo.getId());// ȸ���� �� �Խñ� (�Ű�) ����
		coinDAO.dCoin(uvo.getId()); // ȸ�� ���� ����
		exconDAO.dExcon(uvo.getId()); // ȸ�� ����ȸ/���� ����
		userottDAO.dUserOtt(uvo.getId()); // ȸ�� OTT ����
		userottDAO.likeOtt_u(uvo.getId()); // ȸ���� ���ƿ� ���� OTT ����
		// ��õ�ý��� ���� ���� ����
		jointasteDAO.deleteMyEra(uvo.getId());
		jointasteDAO.deleteMyAritist(uvo.getId());
		jointasteDAO.deleteMyMusician(uvo.getId());
		jointasteDAO.deleteMyArt(uvo.getId());
		jointasteDAO.deleteMyClassic(uvo.getId());
		userDAO.deleteUser(uvo.getId()); // ȸ�� ���� Ż��
		return "mypage/myPage_check";
	}
	
	// ȸ�� Ż��
	@RequestMapping(value = "/byewooye.do")
	public String goodbye(Model model, UserVO uvo, UserDAO userDAO, CleanBoardVO vo, CleanCommentVO cvo,
			BoardDAO boardDAO, CommentDAO commentDAO, ExconDAO exconDAO, CoinDAO coinDAO, OttDAO userottDAO, HttpSession session, JoinTasteDAO jointasteDAO) {
		commentDAO.dComment(uvo.getId()); // ȸ���� �� ��� ����
		boardDAO.likeBoard_u(uvo.getId()); //ȸ���� ���ƿ� ���� �Խñ� ����
		boardDAO.dBoard(uvo.getId()); // ȸ���� �� �Խñ� ����
		commentDAO.cdComment(uvo.getId());// ȸ���� �� (�Ű�)��� ����
		boardDAO.cdBoard(uvo.getId());// ȸ���� �� �Խñ� (�Ű�) ����
		coinDAO.dCoin(uvo.getId()); // ȸ�� ���� ����
		exconDAO.dExcon(uvo.getId()); // ȸ�� ����ȸ/���� ����
		userottDAO.dUserOtt(uvo.getId()); // ȸ�� OTT ����
		userottDAO.likeOtt_u(uvo.getId()); // ȸ���� ���ƿ� ���� OTT ����
		// ��õ�ý��� ���� ���� ����
		jointasteDAO.deleteMyEra(uvo.getId());
		jointasteDAO.deleteMyAritist(uvo.getId());
		jointasteDAO.deleteMyMusician(uvo.getId());
		jointasteDAO.deleteMyArt(uvo.getId());
		jointasteDAO.deleteMyClassic(uvo.getId());
		userDAO.deleteUser(uvo.getId()); // ȸ�� ���� Ż��
		session.invalidate();
		return "main";
	}

	// ����ȸ/���� ���� ���
	@RequestMapping(value = "/excondelete.do")
	public String modify(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, ExconVO vo,
			ExconDAO exconDAO) {
		exconDAO.deleteExcon(vo);
		return "mypage/myPage_excon_check";
	}

	// �Խñ� ���� (Ȯ�� �� ����)
	@RequestMapping(value = "/myboard.do")
	public String mypageboard(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, BoardVO boardvo,
			BoardDAO boardDAO, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.deleteComments(seq);
		boardDAO.likeBoard_b(seq);
		boardDAO.deleteBoard(boardvo);
		return "mypage/myPage_board_check";
	}

	// ��� ���� (Ȯ�� �� ����)
	@RequestMapping(value = "/mycomment.do")
	public String mypageboard(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, BoardVO vo,
			BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.MydeleteComment(seq);
		return "mypage/myPage_board_check";
	}

	// �����ڰ� �Ű� �Խñ� ����
	@RequestMapping(value = "/myboardcut.do")
	public String mypageboardcut(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, CleanBoardVO vo,
			BoardDAO boardDAO, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.cleandeleteComment(seq);
		boardDAO.cleandeleteBoard(seq);
		return "mypage/myPage_board_check";
	}

	// �����ڰ� �Ű� ��� ����
	@RequestMapping(value = "/mycommentcut.do")
	public String mypagecommentcut(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model,
			CleanCommentVO vo, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.cleandeleteComment2(seq);
		return "mypage/myPage_board_check";
	}

	// Ott ����
	@RequestMapping(value = "/myottlooking.do")
	public String ottLooking(Model model, OttVO vo, OttDAO ottDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// �ش� ��ƼƼ ����
		String title = HttpServletRequest.getParameter("title");
		model.addAttribute("ott_num", HttpServletRequest.getParameter("num"));
		model.addAttribute("ott_title", title);
		model.addAttribute("ott_video", ottDAO.getvideo(title));
		return "ott/OTTLooking";
	}

	// ���� ����
	@RequestMapping(value = "/mycoinbuy.do")
	public String coinbuy(Model model, CoinDAO coinDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		String id = HttpServletRequest.getParameter("id");
		int coin = Integer.parseInt(HttpServletRequest.getParameter("coin"));
		coinDAO.insertcoin(id, coin);
		return "mypage/mypage_coin_check";
	}
}
