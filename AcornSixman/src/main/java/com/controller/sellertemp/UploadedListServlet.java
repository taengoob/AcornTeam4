package com.controller.sellertemp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.dto.ProductDTO_Temp;
import com.service.ProductService;

/**
 * Servlet implementation class UploadedListServlet
 */
@WebServlet("/UploadedListServlet")
public class UploadedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadedListServlet() {
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
		
		String sellerId = "taengoov";
		
		Object obj = request.getSession().getAttribute("login");
		if (obj != null)
		{
			MemberDTO user = (MemberDTO)obj;
			if (user.getAccountIsSeller().equals("True"))
				sellerId = user.getAccountId();
		}
		
		ProductService service = new ProductService();
		List<ProductDTO_Temp> list = service.selectProductBySellerId(sellerId);
		
		request.setAttribute("products", list);
		RequestDispatcher dis = request.getRequestDispatcher("uploadedList.jsp");
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
