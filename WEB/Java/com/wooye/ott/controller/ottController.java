package com.wooye.ott.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wooye.board.BoardVO;
import com.wooye.board.impl.BoardDAO;
import com.wooye.ott.OttVO;
import com.wooye.ott.impl.OttDAO;
import com.wooye.user.UserVO;

@Controller
public class ottController {
	@RequestMapping(value = "/ottmain.do", method = RequestMethod.GET)
	public String main(Model model, OttVO vo, OttDAO ottDAO) {
		return "ott/OttPage";
	}

	@RequestMapping(value = "/ottbooking.do")
	public String booking(Model model, OttVO vo, OttDAO ottDAO, String src) {
		OttVO getvo = ottDAO.getOtt(vo);
		model.addAttribute("ott", getvo);
		return "ott/OttBooking";
	}

	@RequestMapping(value = "/ottcompl.do")
	public String Compl(UserVO uvo, OttVO vo, OttDAO ottDAO) {
		String id = uvo.getId();
		String title = vo.getTitle();
		String price = vo.getPrice();
		if (ottDAO.checkOtt(id, title) == 0) {
			if (ottDAO.howCash(id, Integer.parseInt(price)) == 1) {
				ottDAO.buyott(id, Integer.parseInt(price));
				ottDAO.insertOtt(id, vo);
			} else {
				System.out.println("������ �����մϴ�.");
			}
		} else {
			System.out.println("�̹� ������ ��ƼƼ�Դϴ�.");
		}

		return "ott/OttCheck";
	}

	// OTT ���ƿ�
	@RequestMapping(value = "/likeott.do")
	public String insertBoardPage(Model model, javax.servlet.http.HttpServletRequest HttpServletRequest, OttVO ottVO, OttDAO ottDAO) {
		String id = HttpServletRequest.getParameter("id");
		String num = HttpServletRequest.getParameter("ott_num");
		if(ottDAO.OttLikeCheck(id, num) == 1) {
			// ������ �� -> ���ƿ� ��� -> ���̱�
			ottDAO.OttLikeF(id, num);
			int heart = ottDAO.OttLikeHow(num);
			ottDAO.OttLike(num, heart);
		} else {
			//�� ������ �� -> ���ƿ� �߰� -> ���̱�
			ottDAO.OttLikeT(id, num);
			int heart = ottDAO.OttLikeHow(num);
			ottDAO.OttLike(num, heart);
		}
		model.addAttribute("ott_num", num);
		return "ott/OttLike_check";
	}

}
