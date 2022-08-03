package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.common.IDGenerator;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.ProductDTO_Temp;
import com.service.OrderService;
import com.service.ProductService;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		const order = {
//		cartId : ""
//		,productId : productId
//		,amount : parseInt(qty)
//	}
	
//	input : 위와 같은 형식 객체들이 담긴 리스트의 json 포맷
//	=> key - value pair 가 2개인 객체의 리스트
		
		String userId = "";
		Object dto = request.getSession().getAttribute("login");
		if (dto != null)
		{
			MemberDTO user = (MemberDTO)dto;
			userId = user.getAccountId();
		}
		
		String recvName = request.getParameter("name");
		String recvAddrRoad = request.getParameter("addr1");
		String recvAddrNumber = request.getParameter("addr2");
		String phoneNumber = request.getParameter("phoneNumber");
		String payMethodDesc = request.getParameter("payMethodDesc");
		String jsonStr = request.getParameter("jsonStr");
		
		System.out.println(jsonStr);
		JSONArray jsonArray = null;
		JSONParser parser = new JSONParser();
		try
		{
			jsonArray = (JSONArray)parser.parse(jsonStr);
			OrderService orderService = new OrderService();
			ProductService prodService = new ProductService();
			List<ProductDTO_Temp> orderInfoList = new ArrayList<ProductDTO_Temp>(); 
			for (Object obj : jsonArray)
			{
				JSONObject json = (JSONObject)obj;
				if (json != null)
				{
					String cartId = (String)json.get("cartId");
					String productId = (String)json.get("productId");
					int amount = Integer.parseInt(json.get("amount").toString());
					ProductDTO_Temp product = prodService.getProductByProductId(productId);
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
					order.setOrderPayMethod(orderService.selectPayMethodIdByDesc(payMethodDesc));
					
					int result = orderService.insertOrder(order, cartId);
					if (result > 0)
						orderInfoList.add(product);
				}
			}
			
			request.setAttribute("orderInfoList", orderInfoList);
			
//			메인용 경로
			RequestDispatcher dis = request.getRequestDispatcher("orderDone.jsp");
			
//			테스트용 경로
//			RequestDispatcher dis = request.getRequestDispatcher("order/orderDone.jsp");
			
			dis.forward(request, response);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().append(e.toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements())
		{
			String key = params.nextElement();
			String val = request.getParameter(key);
			System.out.println(key + " : " + val);
		}
		doGet(request, response);
	}

}
