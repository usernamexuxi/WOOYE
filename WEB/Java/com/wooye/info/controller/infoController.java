package com.wooye.info.controller;

import java.io.File;
import java.nio.file.Paths;
import java.util.Arrays;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
import com.wooye.user.UserVO;
import com.wooye.user.impl.UserDAO;

interface GlobalVals {
	String title = "Samre";
	String contents = "contents";
}

@Controller
public class infoController {
	@RequestMapping(value = "/infomain.do")
	public String main(Model model) {
		return "info/info_main";
	}

	@RequestMapping(value = "/infosearch.do", method = RequestMethod.GET)
	public String search(javax.servlet.http.HttpServletRequest HttpServletRequest, Model model) {
		String title = "";
		String contents = "";
		String artist = HttpServletRequest.getParameter("artist");
		// String[] arr1 = new String[50000];
		// String[] arr2 = new String[50000];
		// String[][] arr = new String[1000][2];
		String artist_title = "";
		String artist_contents = "";
		try {
			// 파일 경로
			// File stocks = new
			// File("C:\\Users\\chamm\\WooyeWeb\\src\\main\\java\\com\\wooye\\info\\xmlfile\\kowiki.xml");
			File stocks = new File("xmlfile/kowiki.xml");
			// 파일 읽기
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(stocks);
			doc.getDocumentElement().normalize();

			System.out.println("파일출력");

			// 읽어들인 파일 불러오기
			NodeList nodes = doc.getElementsByTagName("page");
			// if (node.getNodeType() == Node.ELEMENT_NODE) {

			for (int temp = 0; temp < nodes.getLength(); temp++) {
				// for(int temp=100; temp<103; temp++) {
				Node nNode = nodes.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					int i = temp + 1;
					title = getValue("title", eElement).toString();
					// contents = getValue("text",eElement).toString();

					// arr1[i]=title.toString();
					// arr2[i]=contents.toString();

					// arr[i][0]=title.toString();
					// arr[i][1]=contents.toString();
					// System.out.println(Arrays.deepToString(arr[i]));
					// String test = Arrays.deepToString(arr[i]);

					// System.out.println("내용 : "+ arr2[i]);
					// System.out.println("test : "+test.toString());
					// String arr2 = Arrays.deepToString(arr);

					// if(arr1[i].equals(artist)) {
					if (title.equals(artist)) {

						artist_title = title;
						System.out.println("제목: " + artist_title);

						artist_contents = getValue("text", eElement).toString();
						System.out.println("내용: " + artist_contents);

						System.out.println("===============================================");
					}
					// System.out.println("제목 : "+arr1[i]);
					// System.out.println("내용" + arr2[i]);
					// System.out.println("-------------------------------------------------------");
					// System.out.println("2"+Arrays.toString(arr));
					// System.out.println("3"+Arrays.deepToString(arr));
				}
			}
//            for (int k = 100; k < 103; k++) {
//                Node node = nodes.item(k);
//                
//                if (node.getNodeType() == Node.ELEMENT_NODE) {
//                    Element element = (Element) node;
//                     title = getValue("title",element).toString();
//                 	contents = getValue("text",element);
//                    //System.out.println(title);
//                 	
//                    if(title == " 로봇") {
//                    	//contents = getValue("text",element);
//                    	//System.out.println("내용 : "+ contents);
//                    	System.out.println("로봇임");
//                    	break;
//                    }
//                }
//                	System.out.println("title: " + title);
//                	//System.out.println("내용 : "+ contents);
//                	System.out.println("=========================================================");
//                	//continue;

			model.addAttribute("artist_title", artist_title);
			model.addAttribute("artist_contents", artist_contents);
//                
//            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "info/info_search";
	}

	private static String getValue(String tag, Element element) {
		NodeList nodes = element.getElementsByTagName(tag).item(0).getChildNodes();
		Node node = (Node) nodes.item(0);
		return node.getNodeValue();
	}

	@RequestMapping(value = "/info_submit_hisa.do")
	public String submit1() {
		return "info/info_more_hisa";	
	}
	
	@RequestMapping(value = "/info_submit_beethoven.do")
	public String submit2() {
		return "info/info_more_beethoven";	
	}
	
	@RequestMapping(value = "/info_submit_mozart.do")
	public String submit3() {
		return "info/info_more_mozart";	
	}
	
	@RequestMapping(value = "/info_submit_gogh.do")
	public String submit4() {
		return "info/info_more_gogh";	
	}
	
	@RequestMapping(value = "/info_submit_monet.do")
	public String submit5() {
		return "info/info_more_monet";	
	}
	
	@RequestMapping(value = "/info_submit_munch.do")
	public String submit6() {
		return "info/info_more_munch";	
	}
    
}
