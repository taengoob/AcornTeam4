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
		request.setCharacterEncoding("utf-8");
		System.out.println("add서블릿 호출됨");

		String accountId = request.getParameter("id");
		String accountPasswd = request.getParameter("passwd");
		String accountName = request.getParameter("name");
		String accountAddressNumber = request.getParameter("post");
		String accountAddressLoad = request.getParameter("addr1");
		String accountPhone = request.getParameter("phoneNumber");
		String accountEmailId = request.getParameter("email01");
		String accountEmailDomain = request.getParameter("email02");
		String accountIsSeller = request.getParameter("seller_YN");

		MemberDTO dto = new MemberDTO(accountId, accountPasswd, accountName, accountAddressNumber, accountAddressLoad,
				accountPhone, accountEmailId, accountEmailDomain, accountIsSeller);
		System.out.println(dto);

		MemberService service = new MemberService();
		int list = service.memberAdd(dto);
		System.out.println(list);
		if (list == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("mesg", accountId);
			session.setMaxInactiveInterval(60 * 30);
			response.sendRedirect("finish.jsp");
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
