package com.acorn.sixman.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.sixman.service.CommonService;
import com.acorn.sixman.service.OrderService;
import com.acorn.sixman.service.ProductService;
import com.acorn.sixman.dto.OrderDTO;
import com.acorn.sixman.dto.OrderRequestDTO;
import com.acorn.sixman.dto.PayMethodDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
import com.acorn.sixman.common.IDGenerator;
import com.acorn.sixman.common.OrderRequestType;
import com.acorn.sixman.dto.MemberDTO;

@Controller
public class OrderController {
	@Autowired
	OrderService service;

	@Autowired
	CommonService commonService;

	@Autowired
	ProductService productService;

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
	public String orderDetail(@RequestParam(name = "orderId", required = true) String orderId, HttpSession session,
			Model model) {
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

	@RequestMapping("/addOrderForm")
	public String addOrderForm(@RequestParam(name = "jsonStr") String jsonStr, Model model) {
		JSONArray jsonArray = null;
		JSONParser parser = new JSONParser();
		try {
			jsonArray = (JSONArray) parser.parse(jsonStr);
			List<ProductDTO_Temp> orderInfoList = new ArrayList<ProductDTO_Temp>();
			for (Object obj : jsonArray) {
				JSONObject json = (JSONObject) obj;
				if (json != null) {
					int amount = Integer.parseInt(json.get("amount").toString());
					String productId = (String) json.get("productId");

					ProductService service = new ProductService();
					ProductDTO_Temp product = service.selectProductByProductId(productId);
					product.setOrderAmount(amount);

					orderInfoList.add(product);
				}
			}
			// 셋 어트리뷰트

			model.addAttribute("orderInfoList", orderInfoList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		OrderService service = new OrderService();
		List<PayMethodDTO> payMethodList = service.selectPayMethodList();
		model.addAttribute("payMethodList", payMethodList);

		// 메인연결용 경로
		// return "addOrderFrom";

		// 테스트용 경로
		return "order/addOrderFrom";
	}

	@RequestMapping("/addOrder")
	public String addOrder(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		String userId = "";
		Object dto = session.getAttribute("login");
		if (dto != null) {
			MemberDTO user = (MemberDTO) dto;
			userId = user.getAccountId();
		}

		String recvName = map.get("name");
		String recvAddrRoad = map.get("addr1");
		String recvAddrNumber = map.get("addr2");
		String phoneNumber = map.get("phoneNumber");
		String payMethodDesc = map.get("payMethodDesc");
		String jsonStr = map.get("jsonStr");

		System.out.println(jsonStr);
		JSONArray jsonArray = null;
		JSONParser parser = new JSONParser();
		try {
			jsonArray = (JSONArray) parser.parse(jsonStr);
			ProductService prodService = new ProductService();
			List<ProductDTO_Temp> orderInfoList = new ArrayList<ProductDTO_Temp>();
			List<OrderRequestDTO> orderRequestList = new ArrayList<OrderRequestDTO>();
			for (Object obj : jsonArray) {
				JSONObject json = (JSONObject) obj;
				if (json != null) {
					String cartId = (String) json.get("cartId");
					String productId = (String) json.get("productId");
					int amount = Integer.parseInt(json.get("amount").toString());
					ProductDTO_Temp product = prodService.selectProductByProductId(productId);
					product.setOrderAmount(amount);

					int pPrice = product.getProductPrice();
					int pDelivery = product.getProductDeliveryPrice();
					int payment = (pPrice * amount) + pDelivery;
					String sellerId = product.getProductSeller();

					OrderDTO order = new OrderDTO();
					order.setOrderId(IDGenerator.getNewOrderId());
					order.setOrderProductId(productId);
					order.setOrderUserId(userId);
					order.setOrderSellerId(sellerId);
					order.setOrderRecvPhone(phoneNumber);
					order.setOrderAmount(amount);
					order.setOrderRecvAddressNumber(recvAddrNumber);
					order.setOrderPaymentPrice(payment);
					order.setOrderRecvAddressRoad(recvAddrRoad);
					order.setOrderProdPrice(pPrice);
					order.setOrderDeliveryPrice(pDelivery);
					order.setOrderRecvName(recvName);
					order.setOrderPayMethod(service.selectPayMethodIdByDesc(payMethodDesc));

					int result = service.insertOrder(order, cartId);
					if (result > 0) {
						orderInfoList.add(product);

						OrderRequestDTO orderRequest = new OrderRequestDTO();
						orderRequest.setOrderId(order.getOrderId());
						orderRequest.setOrderStatus("WP");
						orderRequest.setProductName(product.getProductName());
						orderRequest.setRequestId(
								IDGenerator.getNewOrderRequestId(order.getOrderId(), OrderRequestType.PAYMENT));
						orderRequest.setRequestType(OrderRequestType.PAYMENT.toString());
						orderRequest.setUserId(userId);
						orderRequestList.add(orderRequest);
					}
				}
			}

			model.addAttribute("orderInfoList", orderInfoList);
			model.addAttribute("orderRequestList", orderRequestList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// Order Request 추가 서블릿으로 forward
		return "forward:addOrderRequest";
	}
}
