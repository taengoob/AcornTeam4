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
 * Servlet implementation class categoryListServlet
 */
@WebServlet("/categoryListServlet")
public class categoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public categoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		String searchStr = request.getParameter("searchStr");
		
		ProductService service = new ProductService();
		
		HashMap<String, String> searchOption = new HashMap<String, String>();
		searchOption.put("category", category);
		searchOption.put("searchStr", searchStr);
		
		
		List<ProductDTO_Temp> list = service.getProductByOption(searchOption);
		
		
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("categoryList.jsp");
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
