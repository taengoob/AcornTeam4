package com.acorn.sixman.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    return "MainJoinUp";
  }

  @RequestMapping("/memberUpdatePage")
  public String memberUpdatePage() {
    return "memberUpdate";
  }

  @RequestMapping("/FirstJoinUpPage")
  public String FirstJoinUpPage() {
    return "FirstJoinUpPage";
  }

  @RequestMapping("/MemberAdd") // 회원 정보 db 저장
  public String MemberAdd(MemberDTO dto, HttpSession session) {
    System.out.println(dto);
    String m = "";
    int list = service.memberAdd(dto);
    if (list == 1) {
      session.setAttribute("mesg", dto.getAccountId());
      m = "finish";
    } else {
      System.out.println("에러떴어요~ 회원가입 에러~");
    }
    return m;
  }

  @RequestMapping("/MemberIdCheck") // 회원가입 시 아이디 체크
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

  @RequestMapping("/MemberUpdate") // 회원가입 수정
  public String MemberUpdate(MemberDTO dto, HttpSession session) {
    MemberDTO gDTO = (MemberDTO) session.getAttribute("login");
    String mesg = "";
    if (gDTO != null) {
      int list = service.update(dto);
      System.out.println("업데이트 된 갯수" + list);
      if (list == 1) {
        session.setAttribute("memberupdate", "회원정보가 수정되었습니다.");
        mesg = "redirect:main";
      }
    } else {
      mesg = "redirect:LoginUI";
    }
    return mesg;
  }

  @RequestMapping("/MyPage")
  public String MyPage(HttpSession session) {
    MemberDTO gDTO = (MemberDTO) session.getAttribute("login");
    String mesg = "";
    if (gDTO != null) {
      mesg = "redirect:orderList";
    } else {
      mesg = "redirect:LoginUI";
    }
    return mesg;
  }

  @RequestMapping("/ChangePasswd")
  public String ChangePasswd(@RequestParam HashMap<String, String> map, HttpSession session) {
    int list = service.changePW(map);
    String mesg = "";
    String mesg1 = "";
    if (list != 0) {
      mesg = "비밀번호가 변경되었습니다.";
      session.setAttribute("changepw", mesg);
      mesg1 = "redirect:LoginUI";
    }
    return mesg1;
  }

}
