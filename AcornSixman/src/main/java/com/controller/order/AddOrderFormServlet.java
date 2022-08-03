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
import com.dto.PayMethodDTO;
import com.dto.ProductDTO_Temp;
import com.service.OrderService;
import com.service.ProductService;

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
		
//		const order = {
//			cartId : ""
//			,productId : productId
//			,amount : parseInt(qty)
//		}
		
//		input : 위와 같은 형식 객체들이 담긴 리스트의 json 포맷
//		=> key - value pair 가 2개인 객체의 리스트
		
		String jsonStr = request.getParameter("jsonStr");
		
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
					
					ProductService service = new ProductService();
					ProductDTO_Temp product = service.getProductByProductId(productId);
					product.setOrderAmount(amount);
					
					orderInfoList.add(product);
				}
			}
			//셋 어트리뷰트
			
			request.setAttribute("orderInfoList", orderInfoList);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().append(e.toString());
		}
		
		OrderService service = new OrderService();
		List<PayMethodDTO> payMethodList = service.selectPayMethodList();
		request.setAttribute("payMethodList", payMethodList);
		
//		메인연결용 경로
		RequestDispatcher dis = request.getRequestDispatcher("addOrderFrom.jsp");
		
//		테스트용 경로
//		RequestDispatcher dis = request.getRequestDispatcher("/order/addOrderForm.jsp");
		dis.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Enumeration<String> params = request.getParameterNames();
//		while (params.hasMoreElements())
//		{
//			String key = params.nextElement();
//			String val = request.getParameter(key);
//			System.out.println(key + " : " + val);
//			request.setAttribute(key, val);
//		}
		doGet(request, response);
	}

}
