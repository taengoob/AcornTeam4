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
import com.service.CouponService;

@WebServlet("/CouponAddServlet")
public class CouponAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		/* 회원전용처리 필요함
		 * if(userid==null) { response.sendRedirect("main"); }
		 */
		
		String mesg = "";
		String coupon = request.getParameter("coupon");
		CouponDTO cdto = new CouponDTO();
		if(coupon.equals("1")) {
			mesg = "30%_할인쿠폰";
			cdto.setCoupon_name(mesg);
			cdto.setCoupon_disper(0.3);
		}else if(coupon.equals("3")) {
			mesg = "20%_할인쿠폰";
			cdto.setCoupon_name(mesg);
			cdto.setCoupon_disper(0.2);
		}else if(coupon.equals("5")){
			mesg = "10%_할인쿠폰";
			cdto.setCoupon_name(mesg);
			cdto.setCoupon_disper(0.1);
		}
		cdto.setCoupon_id(IDGenerator.getNewCouponId());
		String userid2 = "DGLee"; //원래는 세션에서 받아온 userid 를 set
		cdto.setCoupon_userid(userid2);
		System.out.println(cdto);
		
		CouponService service = new CouponService();
		service.couponAdd(cdto);
		
		response.sendRedirect("coupon/event.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
