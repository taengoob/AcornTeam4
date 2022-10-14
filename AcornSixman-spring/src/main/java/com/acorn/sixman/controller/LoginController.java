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
            mes = "redirect:main";
            session.setAttribute("login", dto);
            session.setMaxInactiveInterval(60 * 60);
        } else {
            mes = "redirect:LoginUI";
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
            mes = "redirect:main";
        } else {
            mes = "redirect:LoginUI";
        }
        return mes;
    }

    @RequestMapping("/navercollback")
    public String navercollback() {
        return "member/navercollback";
    }

    @RequestMapping("/kakaologin")
    public String kakaologin(@RequestParam String name, @RequestParam String email, HttpSession session) {
        String accountName = name;
        String accountEmailId1 = email;
        String email1 = accountEmailId1;
        String tempEmail[] = email1.split("@");
        String accountEmailId = tempEmail[0];
        String accountEmailDomain = tempEmail[1];
        String mesg = "";
        HashMap<String, String> kakao = new HashMap<String, String>();
        kakao.put("accountName", accountName);
        kakao.put("accountEmailId", accountEmailId);
        kakao.put("accountEmailDomain", accountEmailDomain);
        MemberDTO dto = service.Loginforkakao(kakao);
        if (dto != null) {
            session.setAttribute("login", dto);
            mesg = "redirect:main";
            System.out.println("sns 로그인");

        } else {
            session.setAttribute("nameforkakao", accountName);
            session.setAttribute("emailforkakao", accountEmailId);
            session.setAttribute("domainforkakao", accountEmailDomain);
            mesg = "kakaologin";
            System.out.println("sns 회원가입");
        }
        return mesg;

    }

}