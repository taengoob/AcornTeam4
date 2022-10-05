package com.controller.order;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.CommonService;
import com.service.OrderService;

/**
 * Servlet implementation class OrderDetailServlet
 */
@WebServlet("/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailServlet() {
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
		
		Object dto = request.getSession().getAttribute("login");
		if (dto == null)
		{
			CommonService service = new CommonService();
			MemberDTO user = service.testLogin();
			request.getSession().setAttribute("login", user);
		}
		
		String orderId = request.getParameter("orderId");
		OrderService service = new OrderService();
		OrderDTO order = service.selectOrderByOrderId(orderId);
		request.setAttribute("order", order);
		
//		메인용 경로
		RequestDispatcher dis = request.getRequestDispatcher("orderDetail.jsp");
		
//		테스트용 경로
//		RequestDispatcher dis = request.getRequestDispatcher("order/orderDetail.jsp");
		
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
