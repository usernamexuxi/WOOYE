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
		// 관리자
		model.addAttribute("board", boardDAO.cleanboardList(vo)); // Model 정보 저장
		model.addAttribute("comment", commentDAO.cleancommentList(cvo)); // Model 정보 저장
		// 회원목록 확인
		model.addAttribute("userList", userDAO.getUserList(uvo));

		// 회원
		// 전시회&공연 예약 리스트
		String id = HttpServletRequest.getParameter("id");
		System.out.println(id);
		model.addAttribute("myexconlist", exconDAO.getmyexconlist(id)); // Model 정보 저장
		// 게시글 리스트
		model.addAttribute("myboardlist", boardDAO.getMyBoardList(id));
		// 댓글 리스트
		model.addAttribute("mycommentlist", commentDAO.getMycommentList(id));
		// OTT 리스트
		model.addAttribute("myottlist", ottDAO.getMyottList(id));
		// 보유 코인
		model.addAttribute("coin_get", coinDAO.getMyCoin(id));
		return "mypage/myPage";
	}

	@RequestMapping(value = "/mypagemodify.do")
	public String modify(Model model, UserVO uvo, UserDAO userDAO, HttpSession session) {
		userDAO.mypageModify(uvo); // 회원 정보 수정
		UserVO user = userDAO.getUser(uvo);
		session.setAttribute("userId", user.getId());
		System.out.println(user.getPassword());
		session.setAttribute("userPass", user.getPassword());
		session.setAttribute("userName", user.getNickname());
		session.setAttribute("userRealName", user.getName());
		return "mypage/myPage_modify_check";
	}

	// 회원 강제탈퇴
	@RequestMapping(value = "/byemypage.do")
	public String force(Model model, UserVO uvo, UserDAO userDAO, CleanBoardVO vo, CleanCommentVO cvo,
			BoardDAO boardDAO, CommentDAO commentDAO, ExconDAO exconDAO, CoinDAO coinDAO, OttDAO userottDAO, JoinTasteDAO jointasteDAO) {
		commentDAO.dComment(uvo.getId()); // 회원이 쓴 댓글 삭제
		boardDAO.likeBoard_u(uvo.getId()); //회원이 좋아요 누른 게시글 삭제
		boardDAO.dBoard(uvo.getId()); // 회원이 쓴 게시글 삭제
		commentDAO.cdComment(uvo.getId());// 회원이 쓴 (신고)댓글 삭제
		boardDAO.cdBoard(uvo.getId());// 회원이 쓴 게시글 (신고) 삭제
		coinDAO.dCoin(uvo.getId()); // 회원 코인 삭제
		exconDAO.dExcon(uvo.getId()); // 회원 진시회/공연 삭제
		userottDAO.dUserOtt(uvo.getId()); // 회원 OTT 삭제
		userottDAO.likeOtt_u(uvo.getId()); // 회원이 좋아요 누른 OTT 삭제
		// 추천시스템 기입 정보 삭제
		jointasteDAO.deleteMyEra(uvo.getId());
		jointasteDAO.deleteMyAritist(uvo.getId());
		jointasteDAO.deleteMyMusician(uvo.getId());
		jointasteDAO.deleteMyArt(uvo.getId());
		jointasteDAO.deleteMyClassic(uvo.getId());
		userDAO.deleteUser(uvo.getId()); // 회원 강제 탈퇴
		return "mypage/myPage_check";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/byewooye.do")
	public String goodbye(Model model, UserVO uvo, UserDAO userDAO, CleanBoardVO vo, CleanCommentVO cvo,
			BoardDAO boardDAO, CommentDAO commentDAO, ExconDAO exconDAO, CoinDAO coinDAO, OttDAO userottDAO, HttpSession session, JoinTasteDAO jointasteDAO) {
		commentDAO.dComment(uvo.getId()); // 회원이 쓴 댓글 삭제
		boardDAO.likeBoard_u(uvo.getId()); //회원이 좋아요 누른 게시글 삭제
		boardDAO.dBoard(uvo.getId()); // 회원이 쓴 게시글 삭제
		commentDAO.cdComment(uvo.getId());// 회원이 쓴 (신고)댓글 삭제
		boardDAO.cdBoard(uvo.getId());// 회원이 쓴 게시글 (신고) 삭제
		coinDAO.dCoin(uvo.getId()); // 회원 코인 삭제
		exconDAO.dExcon(uvo.getId()); // 회원 진시회/공연 삭제
		userottDAO.dUserOtt(uvo.getId()); // 회원 OTT 삭제
		userottDAO.likeOtt_u(uvo.getId()); // 회원이 좋아요 누른 OTT 삭제
		// 추천시스템 기입 정보 삭제
		jointasteDAO.deleteMyEra(uvo.getId());
		jointasteDAO.deleteMyAritist(uvo.getId());
		jointasteDAO.deleteMyMusician(uvo.getId());
		jointasteDAO.deleteMyArt(uvo.getId());
		jointasteDAO.deleteMyClassic(uvo.getId());
		userDAO.deleteUser(uvo.getId()); // 회원 강제 탈퇴
		session.invalidate();
		return "main";
	}

	// 전시회/공연 예약 취소
	@RequestMapping(value = "/excondelete.do")
	public String modify(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, ExconVO vo,
			ExconDAO exconDAO) {
		exconDAO.deleteExcon(vo);
		return "mypage/myPage_excon_check";
	}

	// 게시글 관리 (확인 및 삭제)
	@RequestMapping(value = "/myboard.do")
	public String mypageboard(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, BoardVO boardvo,
			BoardDAO boardDAO, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.deleteComments(seq);
		boardDAO.likeBoard_b(seq);
		boardDAO.deleteBoard(boardvo);
		return "mypage/myPage_board_check";
	}

	// 댓글 관리 (확인 및 삭제)
	@RequestMapping(value = "/mycomment.do")
	public String mypageboard(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, BoardVO vo,
			BoardDAO boardDAO, CommentVO cvo, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.MydeleteComment(seq);
		return "mypage/myPage_board_check";
	}

	// 관리자가 신고 게시글 삭제
	@RequestMapping(value = "/myboardcut.do")
	public String mypageboardcut(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model, CleanBoardVO vo,
			BoardDAO boardDAO, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.cleandeleteComment(seq);
		boardDAO.cleandeleteBoard(seq);
		return "mypage/myPage_board_check";
	}

	// 관리자가 신고 댓글 삭제
	@RequestMapping(value = "/mycommentcut.do")
	public String mypagecommentcut(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model,
			CleanCommentVO vo, CommentDAO commentDAO) {
		int seq = Integer.parseInt(HttpServletRequest.getParameter("seq"));
		commentDAO.cleandeleteComment2(seq);
		return "mypage/myPage_board_check";
	}

	// Ott 관람
	@RequestMapping(value = "/myottlooking.do")
	public String ottLooking(Model model, OttVO vo, OttDAO ottDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		// 해당 오티티 제공
		String title = HttpServletRequest.getParameter("title");
		model.addAttribute("ott_num", HttpServletRequest.getParameter("num"));
		model.addAttribute("ott_title", title);
		model.addAttribute("ott_video", ottDAO.getvideo(title));
		return "ott/OTTLooking";
	}

	// 코인 충전
	@RequestMapping(value = "/mycoinbuy.do")
	public String coinbuy(Model model, CoinDAO coinDAO, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		String id = HttpServletRequest.getParameter("id");
		int coin = Integer.parseInt(HttpServletRequest.getParameter("coin"));
		coinDAO.insertcoin(id, coin);
		return "mypage/mypage_coin_check";
	}
}
