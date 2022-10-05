package com.acorn.sixman.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.service.CommonService;
import com.acorn.sixman.service.OrderService;
import com.acorn.sixman.dto.OrderDTO;
import com.acorn.sixman.dto.MemberDTO;

@Controller
public class OrderController {
	@Autowired
	OrderService service;

	@Autowired
	CommonService commonService;

	@RequestMapping("/orderList")
	public String orderList(HttpSession session, Model model) {

		String userId = "taengoov";

		Object obj = session.getAttribute("login");
		if (obj != null) {
			MemberDTO user = (MemberDTO) obj;
			userId = user.getAccountId();
		}

		List<OrderDTO> orderList = service.selectOrderByUserId(userId);

		int wp = 0;
		int cp = 0;
		int pd = 0;
		int bd = 0;
		int cd = 0;

		for (OrderDTO orderDTO : orderList) {
			if (orderDTO.getOrderStatus().equals("WP"))
				wp++;
			else if (orderDTO.getOrderStatus().equals("CP"))
				cp++;
			else if (orderDTO.getOrderStatus().equals("PD"))
				pd++;
			else if (orderDTO.getOrderStatus().equals("BD"))
				bd++;
			else if (orderDTO.getOrderStatus().equals("CD"))
				cd++;
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("wp", wp);
		map.put("cp", cp);
		map.put("pd", pd);
		map.put("bd", bd);
		map.put("cd", cd);
		model.addAttribute("status", map);
		model.addAttribute("orderList", orderList);

		// 메인용 경로
		// return "myPage";

		// 테스트용 경로
		return "order/orderList";
	}

	@RequestMapping("/orderDetail")
	public String orderDetail(@RequestParam(name = "orderId", required = true) String orderId, HttpSession session, Model model)
	{
		Object dto = session.getAttribute("login");
		if (dto == null) {
			MemberDTO user = commonService.testLogin();
			session.setAttribute("login", user);
		}

		OrderDTO order = service.selectOrderByOrderId(orderId);
		model.addAttribute("order", order);

		// 메인용 경로
		// return "orderDetail";

		// 테스트용 경로
		return "order/orderDetail";
	}
	
	public String addOrderForm()
	{
	    return "";
	}
	
	public String addOrder()
	{
	    return "";
	}
}
