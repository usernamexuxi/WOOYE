package com.wooye.excon.controller;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wooye.board.BoardVO;
import com.wooye.excon.ExconVO;
import com.wooye.excon.impl.ExconDAO;
import com.wooye.user.UserVO;

public class exconController {
	
	@RequestMapping(value = "/exconmain.do")
	public String main(Model model) {
		return "excon/ExConPage";
	}

	@RequestMapping(value = "/exconsearch.do", method = RequestMethod.GET)
	public String search(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model) {
		try {
			String sido = HttpServletRequest.getParameter("sido");
			String[][] arr = new String[100][10];

			/*
			 * StringBuilder urlBuilder = null; urlBuilder = new StringBuilder(
			 * "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/area"); //
			 * URL -> area는 지역별 urlBuilder.append("?" + URLEncoder.encode("serviceKey",
			 * "UTF-8") +
			 * "=8Cv3k8m6paszauOsiWNRx1UYzdoQzHZuU7fPHIx3GV0BtyON4YdjSgnsQFNNFkx0Z1VcHtxeyz7QsJIc4W%2BoVw%3D%3D"
			 * ); //서비스키1번 urlBuilder.append("&" + URLEncoder.encode("sido", "UTF-8") + "="
			 * + URLEncoder.encode(sido, "UTF-8"));
			 */

			StringBuilder urlBuilder = new StringBuilder(
					"http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=8Cv3k8m6paszauOsiWNRx1UYzdoQzHZuU7fPHIx3GV0BtyON4YdjSgnsQFNNFkx0Z1VcHtxeyz7QsJIc4W%2BoVw%3D%3D"); 
			urlBuilder.append("&" + URLEncoder.encode("cPage", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /**/
			urlBuilder
					.append("&" + URLEncoder.encode("rows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 10=10개임 */
			urlBuilder.append("&" + URLEncoder.encode("keyword", "UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8"));
			URL url = new URL(urlBuilder.toString());

			String parsingUrl = "";
			parsingUrl = url.toString();

			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(parsingUrl);
			doc.getDocumentElement().normalize();

			System.out.println("Root element : " + doc.getDocumentElement().getNodeName());

			// xml에서 가져올 태그 선정하는거임
			NodeList nList = doc.getElementsByTagName("perforList");
			System.out.println("-----------------");

			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					// String sort =
					// nList.item(temp).getAttributes().getNamedItem("seq").getNodeValue();
					// System.out.println(sort);
					int i = temp + 1;

					arr[i][0] = getTagValue("seq", eElement);
					arr[i][1] = getTagValue("title", eElement);
					arr[i][2] = getTagValue("startDate", eElement);
					arr[i][3] = getTagValue("endDate", eElement);
					arr[i][4] = getTagValue("place", eElement);
					arr[i][5] = getTagValue("realmName", eElement);
//					arr[i][6] = getTagValue("area", eElement);
//					arr[i][7] = getTagValue("thumnail", eElement);
//					arr[i][8] = getTagValue("gpsX", eElement);
//					arr[i][9] = getTagValue("gpsY", eElement);
				}
			}
			model.addAttribute("exconarr", arr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "excon/ExConSearch";
	}

	private static String getTagValue(String tag, Element eElement) {
		Node nValue = null;

		NodeList x = eElement.getElementsByTagName(tag);
		Node test = x.item(0);
		NodeList t = null;
		if (test != null) {
			t = test.getChildNodes();
			if ((Node) t.item(0) != null) {
				nValue = (Node) t.item(0);
			}
		}
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	@RequestMapping(value = "/exconmore.do")
	public String more(Model model) {
		return "excon/ExConBooking";
	}
	
	@RequestMapping(value = "/exconmore2.do")
	public String more2(Model model) {
		return "excon/ExConBooking2";
	}
	
	@RequestMapping(value = "/exconmore3.do")
	public String more3(ExconVO vo, ExconDAO exconDAO, Model model, javax.servlet.http.HttpServletRequest HttpServletRequest, HttpServletResponse response) throws ServletException, IOException{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpServletRequest.setCharacterEncoding("UTF-8");
		
		String []arr2 = new String[7];
		arr2[0] = HttpServletRequest.getParameter("user_id");
		arr2[1] = HttpServletRequest.getParameter("excon_seq");
		arr2[2] = HttpServletRequest.getParameter("excon_name");
		arr2[3] = HttpServletRequest.getParameter("excon_start");
		arr2[4] = HttpServletRequest.getParameter("excon_end");
		arr2[5] = HttpServletRequest.getParameter("excon_place");
		arr2[6] = HttpServletRequest.getParameter("excon_genre");
		System.out.println(arr2[2]);
		model.addAttribute("exconarr2", arr2);
		return "excon/ExConBooking3";
	}
	
	@RequestMapping(value = "/exconcompl.do")
	public String compl(ExconVO vo, ExconDAO exconDAO, Model model) {
		String id = vo.getUser_id();
		String seq = vo.getExcon_seq();
		if (exconDAO.checkExcon(id, seq) == 0) {
			exconDAO.insertExcon(vo);
		} else {
			System.out.println("이미 예약한 전시회입니다.");
		}
		return "excon/ExConCompl";
	}
}
