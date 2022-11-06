package com.wooye.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wooye.user.UserVO;
import com.wooye.user.impl.UserDAO;
import com.wooye.user.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public String loginView(@ModelAttribute("user") UserVO vo) {
        System.out.println("로그인 화면으로 이동...");
        return "login/login";
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(UserVO vo, UserDAO userDAO, HttpSession session) throws Exception {
        UserVO user = userDAO.getUser(vo);
        if (user != null) {
        	session.setAttribute("userId", user.getId());
        	System.out.println(user.getPassword());
        	session.setAttribute("userPass", user.getPassword());
            session.setAttribute("userName", user.getNickname());
            session.setAttribute("userRealName", user.getName());
            System.out.println("/login.do POST 통과");
            return "main";
        } else
            return "login/login";
    }
}