package com.wooye.favorite.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wooye.join.impl.JoinTasteDAO;
import com.wooye.user.UserVO;

@Controller
public class favController {
	@RequestMapping(value = "/favmain.do")
	public String main(Model model, javax.servlet.http.HttpServletRequest HttpServletRequest,
			JoinTasteDAO jointasteDAO) {
		String id = HttpServletRequest.getParameter("id");
		// 테스트 아이디 넣기
		jointasteDAO.testid_d(id);
		jointasteDAO.testid(id);

		// 회원가입 때 기입한 취향 리스트 가져오기
		// 시대
		model.addAttribute("eraList", jointasteDAO.EraList(id));
		// 화가
		model.addAttribute("artistList", jointasteDAO.ArtistList(id));
		// 음악가
		model.addAttribute("musicianList", jointasteDAO.MusicianList(id));
		// 명화
		model.addAttribute("artList", jointasteDAO.ArtList(id));
		// 클래식
		model.addAttribute("classicList", jointasteDAO.ClassicList(id));
		return "favorite/favorite_main";
	}

	@RequestMapping(value = "/newmyfav.do")
	public String newmyfav(Model model, javax.servlet.http.HttpServletRequest HttpServletRequest) {
		String id = HttpServletRequest.getParameter("id");
		return "favorite/favorite_check";
	}

	@RequestMapping(value = "/newmyfav_submit.do")
	public String favsubmit(JoinTasteDAO joinDAO, javax.servlet.http.HttpServletRequest HttpServletRequest,
			Model model, JoinTasteDAO jointasteDAO) {
		String id = HttpServletRequest.getParameter("id");

		// 취향 기입 전 디비 비우기
		jointasteDAO.deleteMyEra(id);
		jointasteDAO.deleteMyAritist(id);
		jointasteDAO.deleteMyMusician(id);
		jointasteDAO.deleteMyArt(id);
		jointasteDAO.deleteMyClassic(id);

		// 시대
		String[] era = HttpServletRequest.getParameterValues("e1");
		for (int i = 0; i < era.length; i++)
			joinDAO.insert_era(id, era[i]);

		// 음악가
		String[] musician = HttpServletRequest.getParameterValues("e2");
		for (int i = 0; i < musician.length; i++)
			joinDAO.insert_musician(id, musician[i]);

		// 화가
		String[] artist = HttpServletRequest.getParameterValues("e3");
		for (int i = 0; i < artist.length; i++)
			joinDAO.insert_artist(id, artist[i]);

		// 명화
		String[] art = HttpServletRequest.getParameterValues("e4");
		for (int i = 0; i < art.length; i++)
			joinDAO.insert_art(id, art[i]);

		// 클래식
		String[] classic = HttpServletRequest.getParameterValues("e5");
		for (int i = 0; i < classic.length; i++)
			joinDAO.insert_classic(id, classic[i]);
		model.addAttribute("userId", id);
		return "favorite/myfavnew_check";
	}

	@RequestMapping(value = "/myfav_co.do", method = RequestMethod.GET)
	public ModelAndView Test1(javax.servlet.http.HttpServletRequest HttpServletRequest, JoinTasteDAO jointasteDAO) {
		String id = HttpServletRequest.getParameter("id");
		ModelAndView mav = new ModelAndView();
		String url = "http://127.0.0.1:5000/recomco";
		//String url = "http://54.175.21.133:5000/recomco";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line = null;
			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				System.out.println("myfav_co");
			}
			br.close();
			System.out.println("" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("start_list", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
		// sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		mav.setViewName("favorite/myfav_co"); // jsp파일 이름
		return mav;
	}

	@RequestMapping(value = "/myfav_cn.do", method = RequestMethod.GET)
	public ModelAndView Test2(javax.servlet.http.HttpServletRequest HttpServletRequest, JoinTasteDAO jointasteDAO) {
		String id = HttpServletRequest.getParameter("id");
		ModelAndView mav = new ModelAndView();
		String url = "http://127.0.0.1:5000/recomcn";
		//String url = "http://172.31.84.84:5000/recomcn";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line = null;
			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				System.out.println("myfav_cn");
			}
			br.close();
			System.out.println("" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("recomm_masterpiece_list", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
		// sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		mav.setViewName("favorite/myfav_cn"); // jsp파일 이름
		return mav;
	}

	@RequestMapping(value = "/myfav_cp.do", method = RequestMethod.GET)
	public ModelAndView Test3() {
		ModelAndView mav = new ModelAndView();
		String url = "http://127.0.0.1:5000/recomcp";
		//String url = "http://172.31.84.84:5000/recomcp";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line = null;
			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				System.out.println("myfav_cp");
			}
			br.close();
			System.out.println("" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.addObject("re_ma_title", sb.toString()); // "test1"는 jsp파일에서 받을때 이름,
		// sb.toString은 value값(여기에선 test)
		mav.addObject("fail", false);
		mav.setViewName("favorite/myfav_cp"); // jsp파일 이름
		return mav;
	}
}
