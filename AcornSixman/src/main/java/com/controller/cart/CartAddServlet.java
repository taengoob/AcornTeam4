package com.controller.cart;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.service.CartService;

/**
 * Servlet implementation class CartAddServlet
 */
@WebServlet("/CartAddServlet")
public class CartAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String userid2 = "DGLee";//회원전용처리 필요
		
		String productId = request.getParameter("productId");
		int cartCount = Integer.parseInt(request.getParameter("cartCount"));
		
		
		CartService service = new CartService();
		int n = service.cartSearch(userid2, productId);
		if(n==0) {
			service.cartAdd(userid2, productId, cartCount);
		}else if(n==1) {
			service.cartUpdate(userid2, productId, cartCount);
		}
		
		System.out.println(n);
		
		response.sendRedirect("image/ProductDetailServlet?productId="+productId);
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
