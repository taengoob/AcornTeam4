package com.controller.orderrequest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderRequestListServlet
 */
@WebServlet("/OrderRequestListServlet")
public class OrderRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderRequestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		결제
//		1. 결재 요청 목록 - 주문 요청 테이블의 결재 : 주문서 작성하면 결제 요청 테이블에 인서트
//			1-1. 해당 페이지에서 결재 버튼 누르면 : 입금대기 -> 결제완료 상태 업데이트
		
//		2. 결제 완료 목록 : 위에서 결제완료로 상태 변경된 목록
		
		
//		배송
//		1. 배송 요청 목록 - 주문 요청 테이블의 배송 : 판매자 페이지에서 배송 요청 클릭하면 배송 요청 테이블에 인서트
//			1-1. 해당 페이지에서 배송준비 버튼 누르면 : 결제완료 -> 배송준비 상태 업데이트
		
//		2. 배송 준비중인 목록
//		
//		3. 배송 중인 목록
//		
//		4. 배송 완료인 목록
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
