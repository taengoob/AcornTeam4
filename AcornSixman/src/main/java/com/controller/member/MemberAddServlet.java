package com.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class MemberAddServlet
 */
@WebServlet("/MemberAddServlet")
public class MemberAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("add서블릿 호출됨");
		String userid = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String username = request.getParameter("name");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String phone = request.getParameter("phoneNumber");
		String email01 = request.getParameter("email01");
		String email02 = request.getParameter("email02");
		String seller_YN = request.getParameter("seller_YN");

		MemberDTO dto = new MemberDTO(userid, passwd, username, post, addr1, addr2, phone, email01, email02, seller_YN);
		System.out.println(dto);

		MemberService service = new MemberService();
		int list = service.memberAdd(dto);

		if (list == 1) {

			HttpSession session = request.getSession();
			session.setAttribute("mesg", userid);
			session.setMaxInactiveInterval(60 * 30);
			response.sendRedirect("member/finish.jsp");
		} else {
			System.out.println("에러 페이지로");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
