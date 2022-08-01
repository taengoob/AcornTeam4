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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.common.IDGenerator;
import com.dto.OrderDTO;

/**
 * Servlet implementation class AddOrderFormServlet
 */
@WebServlet("/AddOrderFormServlet")
public class AddOrderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderFormServlet() {
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
//		
//		Enumeration<String> params = request.getParameterNames();
//		while (params.hasMoreElements())
//		{
//			String key = params.nextElement();
//			String val = request.getParameter(key);
//			System.out.println(key + " : " + val);
//			request.setAttribute(key, val);
//		}
//		
//		메인연결용 경로
		RequestDispatcher dis = request.getRequestDispatcher("addOrderFrom.jsp");
		
//		테스트용 경로
//		RequestDispatcher dis = request.getRequestDispatcher("order/addOrderFrom.jsp");
		dis.forward(request, response);
		
//		JSONArray jsonArray = null;
//		JSONParser parser = new JSONParser();
//		try
//		{
//			jsonArray = (JSONArray)parser.parse(jsonStr);
//			List<OrderDTO> orderList = new ArrayList<OrderDTO>();
//			for (Object obj : jsonArray)
//			{
//				JSONObject json = (JSONObject)obj;
//				if (json != null)
//				{
//					String productId = (String)json.get("productId");
//					String userId = (String)json.get("userId");
//					String sellerId = (String)json.get("sellerId");
//					int productPrice = Integer.parseInt(json.get("productPrice").toString());
//					int amount = Integer.parseInt(json.get("amount").toString());
//					int deliveryPrice = Integer.parseInt(json.get("deliveryPrice").toString());
//					int totalPrice = Integer.parseInt(json.get("totalPrice").toString());
//					
//					OrderDTO order = new OrderDTO();
//					order.setOrderProductId(productId);
//					order.setOrderUserId(userId);
//					order.setOrderSellerId(sellerId);
//					order.setOrderProdPrice(productPrice);
//					order.setOrderAmount(amount);
//					order.setOrderDeliveryPrice(deliveryPrice);
//					order.setOrderPaymentPrice(totalPrice);
//					orderList.add(order);
//				}
//			}
//		}
//		catch (Exception e)
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			response.getWriter().append(e.toString());
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
