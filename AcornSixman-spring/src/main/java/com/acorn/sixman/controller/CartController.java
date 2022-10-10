package com.acorn.sixman.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.sixman.dto.CartDTO;
import com.acorn.sixman.dto.CouponDTO;
import com.acorn.sixman.dto.MemberDTO;
import com.acorn.sixman.service.CartService;
import com.acorn.sixman.service.CouponService;


@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@Autowired
	CouponService service2;
	
	@RequestMapping("/cartList")
    public String cartList(HttpSession session,Model model) {
		System.out.println("장바구니 목록 이동중");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		if(login != null) {
		    List<CartDTO> cartList = service.cartList(login.getAccountId());
	        List<CouponDTO> couponList = service2.couponList(login.getAccountId());
	        model.addAttribute("cartList",cartList);
	        model.addAttribute("couponList",couponList);
	        return "cartList";
		}else {
		    return "Main";
		}
    }
	
	@RequestMapping("/cartDelete")
	public @ResponseBody String cartDelete(@RequestParam String[] chkedCartId) {
		int n = 0;
		String cartId = "";
		for (int i = 0; i < chkedCartId.length; i++) {
			cartId = chkedCartId[i];
			n = service.cartDelete(cartId);
		}
		return "성공";
	}
	@RequestMapping("/cartUpdate")
	public @ResponseBody String cartUpdate(@RequestParam HashMap<String,  String> map, HttpSession session) {
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
		System.out.println("장바구니 수량 변경"+map);
		map.put("userId", login.getAccountId());
		int n  = service.cartUpdate2(map);
		return "성공";
	}
	@RequestMapping("/cartAdd")
	public @ResponseBody String cartAdd(@RequestParam HashMap<String, String> map, HttpSession session) {
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
		map.put("userId", login.getAccountId());
		System.out.println("장바구니 물품 추가 "+map);
		int n = service.cartSearch(map);//장바구니 목록에 있는 물품인지 확인
		if(n==0) {//장바구니 목록에 없는 물품일 경우 새로 추가
			service.cartAdd(map);
		}else if(n==1) {//장바구니 목록에 있는 물품일 경우 수량 추가
			service.cartUpdate(map);
		}
		return "성공";
	}
}
