package com.controller.product;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ProductDTO;
import com.service.ProductService;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String product_Id = request.getParameter("product_Id");
		String product_name = request.getParameter("product_name");
		int product_Price = Integer.parseInt(request.getParameter("product_Price"));
		int product_Delivery = Integer.parseInt(request.getParameter("product_Delivery"));
		String product_Model = request.getParameter("product_Model");
		String product_Maker = request.getParameter("product_Maker");
		String product_Madein = request.getParameter("product_Madein");
		int product_stock = Integer.parseInt(request.getParameter("product_Stock"));
		String product_Seller = request.getParameter("product_Seller");
		String product_Regdate = request.getParameter("product_Regdate");
		String product_Preview = request.getParameter("product_Preview");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		
		
		ProductDTO pdto = new ProductDTO(product_Id,product_name, product_Price, product_Delivery, product_Model, 
										 product_Maker, product_Madein, product_stock, product_Seller,
										 product_Regdate, product_Preview);
		
		ProductService service = new ProductService();
		int n = service.registration(pdto);
		System.out.println(n);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
