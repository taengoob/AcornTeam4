package com.controller.cart;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CartService;

@WebServlet("/CartDeleteServlet")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		
		CartService service = new CartService();
		int n = 0;
		String cartId = "";
		String[] chkedCartId = request.getParameterValues("chkedCartId");
		for (int i = 0; i < chkedCartId.length; i++) {
			cartId = chkedCartId[i];
			n = service.cartDelete(cartId);
		}
		
		response.sendRedirect("CartListServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
