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
import com.acorn.sixman.dto.PayMethodDTO;
import com.acorn.sixman.dto.ProductDTO_Temp;
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
	
	@RequestMapping("/orderAddForm")
	public String orderAdd(@RequestParam (name = "jsonStr", required = true) String jsonStr, HttpSession session, Model model)
	{
	    System.out.println(jsonStr);
        
        JSONArray jsonArray = null;
        JSONParser parser = new JSONParser();
        try
        {
            jsonArray = (JSONArray)parser.parse(jsonStr);
            List<ProductDTO_Temp> orderInfoList = new ArrayList<ProductDTO_Temp>();
            for (Object obj : jsonArray)
            {
                JSONObject json = (JSONObject)obj;
                if (json != null)
                {
                    int amount = Integer.parseInt(json.get("amount").toString());
                    String productId = (String)json.get("productId");
                    
                    ProductDTO_Temp product = productService.selectProductByProductId(productId);
                    product.setOrderAmount(amount);
                    
                    System.out.println("product 확인 : "+product);
                    
                    orderInfoList.add(product);
                }
            }
            //셋 어트리뷰트
            
            model.addAttribute("orderInfoList",orderInfoList);
            System.out.println("orderInfoList : "+orderInfoList);
        }
        catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
            //response.getWriter().append(e.toString());
        }
       
        List<PayMethodDTO> payMethodList = service.selectPayMethodList();
        model.addAttribute("payMethodList",payMethodList);
        System.out.println("payMethodList : "+ payMethodList);
        return "addOrderFrom";
	}
}
