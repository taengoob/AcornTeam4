package com.controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.OrderService;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/OrderListServlet")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
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
		
		String userId = "taengoov";
		
		Object obj = request.getSession().getAttribute("login");
		if (obj != null)
		{
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}
		
		OrderService service = new OrderService();
		List<OrderDTO> orderList = service.selectOrderByUserId(userId);
		
		request.setAttribute("orderList", orderList);
//		메인용 경로
//		RequestDispatcher dis = request.getRequestDispatcher("orderList.jsp");
		
//		테스트용 경로
		RequestDispatcher dis = request.getRequestDispatcher("order/orderList.jsp");
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
