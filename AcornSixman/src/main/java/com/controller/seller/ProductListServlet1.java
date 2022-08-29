package com.controller.seller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.dto.ProductPageDTO;
import com.service.ProductService;

/**
 * Servlet implementation class ProductListServlet1
 */
@WebServlet("/ProductListServlet1")
public class ProductListServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = "";
		Object dto = request.getSession().getAttribute("login");
		if (dto != null)
		{
			MemberDTO user = (MemberDTO)dto;
			userId = user.getAccountId();
		}
		
		String curPage = request.getParameter("curPage");   //현재페이지 
		if(curPage == null) curPage = "1";   //시작시 현재페이지 1 
		
		
		String searchName = request.getParameter("searchName");
		ProductService service = new ProductService();

		ProductPageDTO pDTO = service.select(searchName, Integer.parseInt(curPage), userId);
		
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		
		RequestDispatcher dis = request.getRequestDispatcher("seller/1productlistInclude.jsp");
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
