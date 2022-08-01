package com.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.CategoryDTO;
import com.dto.CouponDTO;
import com.dto.MemberDTO;
import com.service.CartService;
import com.service.CommonService;
import com.service.CouponService;

@WebServlet("/CartListServlet")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CommonService cservice = new CommonService();
		List<CategoryDTO> dto = cservice.getGuitarCategories();
		session.setAttribute("Guitar", dto);
		
		String userId = "DGLee";
		
		Object obj = request.getSession().getAttribute("login");
		if (obj != null)
		{
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}
		
		CartService service = new CartService();
		List<CartDTO> cartList = service.cartList(userId);
		request.setAttribute("cartList", cartList);
		
		CouponService service2 = new CouponService();
		List<CouponDTO> couponList = service2.couponList(userId);
		request.setAttribute("couponList", couponList);
		System.out.println(couponList);
	
		
		RequestDispatcher dis = request.getRequestDispatcher("cartList.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
