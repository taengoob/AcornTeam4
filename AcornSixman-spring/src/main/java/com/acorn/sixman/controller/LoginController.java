package com.acorn.sixman.controller;

import java.util.HashMap;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.dto.MemberDTO;
import com.acorn.sixman.service.MemberService;

@Controller
public class LoginController {
    @Autowired
    MemberService service;

    @RequestMapping("/LoginUI")
    public String LoginUI() {
        return "Login";
    }

    @RequestMapping("/login")
    public String login(@RequestParam HashMap<String, String> map, HttpSession session, Model model) {
        MemberDTO dto = service.Login(map);
        String mes = "";
        if (dto != null) {
            mes = "redirect:/";
            session.setAttribute("login", dto);
            session.setMaxInactiveInterval(60 * 60);
        } else {
            mes = "redirect:/LoginUI";
            session.setAttribute("nologin", "로그인 정보를 확인해 주세요");

        }
        return mes;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        MemberDTO dto = (MemberDTO) session.getAttribute("login");
        String mes = "";
        if (dto != null) {
            session.setAttribute("logout", "로그아웃임다");
            session.removeAttribute("login");
            mes = "/";
        } else {
            mes = "LoginUi";
        }
        return mes;
    }

}