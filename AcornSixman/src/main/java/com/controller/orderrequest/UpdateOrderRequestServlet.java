package com.controller.orderrequest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.OrderRequestType;
import com.service.OrderRequestService;

/**
 * Servlet implementation class UpdateOrderRequestServlet
 */
@WebServlet("/UpdateOrderRequestServlet")
public class UpdateOrderRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderRequestServlet() {
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
		
		String requestType = request.getParameter("requestType");
		String requestId = request.getParameter("requestId");
		String status = request.getParameter("status");
		
		OrderRequestService service = new OrderRequestService();
		service.UpdateOrderRequestStatus(requestId, status);
		
		if (requestType.equals(OrderRequestType.PAYMENT.toString()))
			response.sendRedirect("PaymentRequestListServlet");
		else if (requestType.equals(OrderRequestType.DELIVERY.toString()))
			response.sendRedirect("DeliveryRequestListServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
