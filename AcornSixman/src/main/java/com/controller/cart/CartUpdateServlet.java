package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CartService;

@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String userid2 = "DGLee"; //임시로 아이디 부여
		
		String productId = request.getParameter("productId");
		int cartCount = Integer.parseInt(request.getParameter("cartCount"));
		
		System.out.println(productId + cartCount);
		
		CartService service = new CartService();
		service.cartUpdate2(userid2, productId, cartCount);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("비동기처리 성공");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
