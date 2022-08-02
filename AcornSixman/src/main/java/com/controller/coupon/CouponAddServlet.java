package com.controller.coupon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.common.IDGenerator;
import com.dto.CouponDTO;
import com.dto.MemberDTO;
import com.service.CouponService;

@WebServlet("/CouponAddServlet")
public class CouponAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = "dg38";

		Object obj = request.getSession().getAttribute("login");
		if (obj != null)
		{
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}else {
			String couponMesg = "로그인이 필요합니다.";
			request.setAttribute("couponMesg", couponMesg);
			RequestDispatcher dis = request.getRequestDispatcher("coupon/event.jsp");
			dis.forward(request, response);
		}
		String couponName = "";
		String coupon = request.getParameter("coupon");
		CouponDTO cdto = new CouponDTO();
		if(coupon.equals("1")) {
			couponName = "30%_할인쿠폰";
			cdto.setCouponName(couponName);
			cdto.setCouponDisper(0.3);
		}else if(coupon.equals("3")) {
			couponName = "20%_할인쿠폰";
			cdto.setCouponName(couponName);
			cdto.setCouponDisper(0.2);
		}else if(coupon.equals("5")){
			couponName = "10%_할인쿠폰";
			cdto.setCouponName(couponName);
			cdto.setCouponDisper(0.1);
		}
		cdto.setCouponId(IDGenerator.getNewCouponId());
		cdto.setCouponuserId(userId);
		
		CouponService service = new CouponService();
		service.couponAdd(cdto);
		
		response.sendRedirect("coupon/event.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
