package com.acorn.sixman.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.dto.MemberDTO;
import com.acorn.sixman.service.MemberService;

@Controller
public class FindController {
    @Autowired
    MemberService service;

    @RequestMapping("/FindUserid")
    public String FindUserid(@RequestParam HashMap<String, String> map, HttpSession session) {
        MemberDTO dto = service.findid(map);
        String id = "";
        String name = "";
        String mesg = "";
        if (dto != null) {
            id = dto.getAccountId();
            name = map.get("accountName");
            System.out.println(name);
            session.setAttribute("userid", id);
            session.setAttribute("name", name);
            mesg = "findid";
        } else {
            session.setAttribute("findid", "nonid");
            mesg = "FirstFindID";
        }
        return mesg;
    }

    @RequestMapping("/FindPhone") // 폰번호로 아이디 찾기
    public String FindPhone(@RequestParam HashMap<String, String> map, HttpSession session) {
        System.out.println("파인드 아이디 폰 넘버" + map);
        MemberDTO dto = service.findidforphone(map);
        String id = "";
        String name = "";
        String mesg = "";
        if (dto != null) {
            id = dto.getAccountId();
            name = map.get("accountName");
            System.out.println(id);
            session.setAttribute("userid", id);
            session.setAttribute("name", name);
            mesg = "findid";
        } else {
            session.setAttribute("findid", "nonid");
            mesg = "FirstFindID";
        }
        return mesg;
    }
    @RequestMapping("/FindPhonePW")
    public String FindPhonePW(@RequestParam HashMap<String, String> map, HttpSession session){
        MemberDTO dto = service.findpwforphone(map);
        String id= "";
		String name = "";
        String mesg = "";
		if (dto != null) {
			id = dto.getAccountId();
			name= dto.getAccountName();
			System.out.println("FindPhonePW 아이디값"+id);
			System.out.println("FindPhonePW 이름값"+name);
			session.setAttribute("useridpw", id);
			session.setAttribute("name", name);
            mesg = "FindPWforPhone";
			
		}else {
			session.setAttribute("findid", "nonid");
            mesg = "FirstFindPW";
		}
        return mesg;
    }
    @RequestMapping("/FindUserpw")
    public String FindUserpw(@RequestParam HashMap<String, String> map, HttpSession session){
        MemberDTO dto = service.findid2(map);
        String id= "";
		String mesg = "";
        String mesg1 = "";
		if (dto != null) {
			mesg = dto.getAccountName();
			id= dto.getAccountId();
            System.out.println("유저 이름" + mesg);
			System.out.println("유저 아이디" + id);
			session.setAttribute("useridpw", id);
			session.setAttribute("name", mesg);
            mesg1 = "findipw";
			
		}else {
			session.setAttribute("findid", "nonid");
            mesg1 = "FirstFindPW";
		}
        return mesg1;
    }


}
