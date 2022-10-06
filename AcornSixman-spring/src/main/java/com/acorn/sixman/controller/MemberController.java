package com.acorn.sixman.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.sixman.dto.MemberDTO;
import com.acorn.sixman.service.MemberService;

@Controller
public class MemberController {
  @Autowired
  MemberService service;

  @RequestMapping("/MainJoinUp")
  public String MainJoinUp() {
    return "member/MainJoinUp";
  }

  @RequestMapping("/MemberAdd") // 회원 정보 db 저장
  public String MemberAdd(MemberDTO dto, Model model) {
    System.out.println(dto);
    String m = "";
    int list = service.memberAdd(dto);
    if (list == 1) {
      model.addAttribute("mesg", dto.getAccountId());
      m = "finish";
    } else {
      System.out.println("에러떴어요~ 회원가입 에러~");
    }
    return m;
  }

  @RequestMapping("//MemberIdCheck")//회원가입 시 아이디 체크
  @ResponseBody
  public String MemberIdCheck(@RequestParam("userid") String userid) {
    System.out.println("체크 서블릿");
    int count = service.idCheck(userid);// 중복 count
    String mesg = "아이디 사용 가능";
    if (count == 1) {
      mesg = "아이디 중복";
    }
    return mesg;
  }
  
}
