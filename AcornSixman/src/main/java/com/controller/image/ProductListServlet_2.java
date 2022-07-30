package com.controller.image;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dto.ProductDTO_Temp;
import com.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/image/ProductListServlet_2")
public class ProductListServlet_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet_2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");
		String searchStr = request.getParameter("searchStr");
		
		HashMap<String, String> searchOption = new HashMap<String, String>();
		searchOption.put("category", category);
		searchOption.put("searchStr", searchStr);
		
		String newpage = "";
		ProductService service = new ProductService();
		List<ProductDTO_Temp> list = null;
		list = service.getProductByOption(searchOption);
		newpage = "../productList.jsp";
		
		request.setAttribute("products", list);
		RequestDispatcher dis = request.getRequestDispatcher(newpage);
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