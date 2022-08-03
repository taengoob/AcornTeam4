package com.controller.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dbconfig.MySqlSessionFactory;
import com.dto.MemberDTO;
import com.dto.ProductDTO_Temp;
import com.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/ProductListServlet")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
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
		
		String category = request.getParameter("category");
		String searchStr = request.getParameter("searchStr");
		
		HashMap<String, String> searchOption = new HashMap<String, String>();
		searchOption.put("category", category);
		searchOption.put("searchStr", searchStr);
		
		ProductService service = new ProductService();
		List<ProductDTO_Temp> list = service.selectProductByOption(searchOption);
		
		request.setAttribute("list", list);
		
//		메인용 경로
		RequestDispatcher dis = request.getRequestDispatcher("productList.jsp");
		
//		테스트용 경로
//		SqlSession session = MySqlSessionFactory.getSession();
//		MemberDTO dto = null;
//		try {
//			dto = session.selectOne("MemberMapper.testLogin");
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//		request.getSession().setAttribute("login", dto);
//		RequestDispatcher dis = request.getRequestDispatcher("product/productList.jsp");
//		테스트용 경로
		
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
