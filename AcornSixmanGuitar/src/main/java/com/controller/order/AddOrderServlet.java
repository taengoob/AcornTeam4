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
import com.dto.OrderDTO;
import com.service.OrderService;

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
		
		String recvName = request.getParameter("name");
		String recvAddrRoad = request.getParameter("addr1");
		String recvAddrNumber = request.getParameter("addr2");
		String phoneNumber = request.getParameter("phoneNumber");
		
		String jsonStr = request.getParameter("jsonStr");
		JSONArray jsonArray = null;
		JSONParser parser = new JSONParser();
		try
		{
			jsonArray = (JSONArray)parser.parse(jsonStr);
			OrderService service = new OrderService();
			for (Object obj : jsonArray)
			{
				JSONObject json = (JSONObject)obj;
				if (json != null)
				{
					String productId = (String)json.get("productId");
					String userId = (String)json.get("userId");
					String sellerId = (String)json.get("sellerId");
					int productPrice = Integer.parseInt(json.get("productPrice").toString());
					int amount = Integer.parseInt(json.get("amount").toString());
					int deliveryPrice = Integer.parseInt(json.get("deliveryPrice").toString());
					int totalPrice = Integer.parseInt(json.get("totalPrice").toString());
					
					OrderDTO order = new OrderDTO();
					order.setOrderId(IDGenerator.getNewOrderId());
					order.setOrderProductId(productId);
					order.setOrderUserId(userId);
					order.setOrderSellerId(sellerId);
//					ORDER_STATUS
//					ORDER_REG_DATE
//					ORDER_UPDATE_DATE
					order.setOrderRecvPhone(phoneNumber);
					order.setOrderAmount(amount);
					order.setOrderRecvAddressNumber(recvAddrNumber);
					order.setOrderPaymentPrice(totalPrice);
					order.setOrderRecvAddressRoad(recvAddrRoad);
					order.setOrderProdPrice(productPrice);
					order.setOrderDeliveryPrice(deliveryPrice);
					order.setOrderRecvName(recvName);
					
					service.insertOrder(order);
				}
			}
			
			response.sendRedirect("OrderListServlet");
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
