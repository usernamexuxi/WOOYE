package com.wooye.join.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wooye.board.BoardVO;
import com.wooye.board.impl.BoardDAO;
import com.wooye.join.impl.JoinTasteDAO;
import com.wooye.ott.impl.CoinDAO;
import com.wooye.user.UserVO;
import com.wooye.user.impl.UserDAO;

@Controller
public class joinController {
	@RequestMapping(value = "/join.do")
	public String main(Model model) {
		return "join/join_up";	
	}

	@RequestMapping(value = "/join_submit1.do")
	public String submit1(@ModelAttribute("users") UserVO vo, UserDAO UserDAO, CoinDAO CoinDAO, Model model) {
		UserDAO.userjoin(vo);
		CoinDAO.defaultcoin(vo.getId());
		model.addAttribute("userId", vo.getId());
		model.addAttribute("userName", vo.getName());
		return "join/join_check";	
	}
	
	@RequestMapping(value = "/join_submit2.do")
	public String submit2(JoinTasteDAO joinDAO, javax.servlet.http.HttpServletRequest HttpServletRequest, Model model) {
		String id = HttpServletRequest.getParameter("id");
		
		// 시대
		String[] era = HttpServletRequest.getParameterValues("e1");
		    for(int i = 0; i < era.length; i++)
		    	joinDAO.insert_era(id, era[i]);

		// 음악가
		String[] musician = HttpServletRequest.getParameterValues("e2");
		    for(int i = 0;i < musician.length; i++)
		    	joinDAO.insert_musician(id, musician[i]);
		
		// 화가
		String[] artist = HttpServletRequest.getParameterValues("e3");
		    for(int i = 0;i < artist.length; i++)
		    	joinDAO.insert_artist(id, artist[i]);
		
		// 명화
		String[] art = HttpServletRequest.getParameterValues("e4");
		    for(int i = 0;i < art.length; i++)
		    	joinDAO.insert_art(id, art[i]);
		
		// 클래식
		String[] classic = HttpServletRequest.getParameterValues("e5");
		    for(int i = 0;i < classic.length; i++)
		    	joinDAO.insert_classic(id, classic[i]);
		
		return "login/login";
	}
}
