package com.controller.orderrequest;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.OrderRequestDTO;
import com.service.OrderRequestService;

/**
 * Servlet implementation class DeliveryRequestListServlet
 */
@WebServlet("/DeliveryRequestListServlet")
public class DeliveryRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryRequestListServlet() {
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
		
		OrderRequestService service = new OrderRequestService();
		List<OrderRequestDTO> orderRequestPDList = service.selectOrderRequestList("PD");
		List<OrderRequestDTO> orderRequestBDList = service.selectOrderRequestList("BD");
		List<OrderRequestDTO> orderRequestCDList = service.selectOrderRequestList("CD");
		
		request.setAttribute("orderRequestPDList", orderRequestPDList);
		request.setAttribute("orderRequestBDList", orderRequestBDList);
		request.setAttribute("orderRequestCDList", orderRequestCDList);
		
//		메인용 경로
//		RequestDispatcher dis = request.getRequestDispatcher("paymentRquestList.jsp");
		
//		테스트용 경로
		RequestDispatcher dis = request.getRequestDispatcher("orderRequest/deliveryRequestList.jsp");
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
