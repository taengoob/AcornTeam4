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
		request.setCharacterEncoding("utf-8");
		String product_Id = request.getParameter("product_Id");
		System.out.println(product_Id);
		
		CartService service = new CartService();
		CartDTO cdto = service.searchCart(product_Id);
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String userid2 = "DGLee";
		int Count = 1;
		
		if(cdto==null) {
			service.cartCreate(userid2, product_Id, Count);
		}else if(cdto!=null){
			service.cartAdd(userid2, product_Id, Count);
		}
		
		response.sendRedirect("ProductListServlet");
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
