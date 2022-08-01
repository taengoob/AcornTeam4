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
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateServlet() {
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
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		MemberService service = new MemberService();

		if (dto != null) {
			request.setCharacterEncoding("utf-8");
			
			String accountId = request.getParameter("userid");
			String accountPasswd = request.getParameter("passwd");
			String accountName = request.getParameter("name");
			String accountAddressNumber = request.getParameter("post");
			String accountAddressLoad = request.getParameter("addr1");
			String accountPhone = request.getParameter("phoneNumber");
			String accountEmailId = request.getParameter("email01");
			String accountEmailDomain = request.getParameter("email02");
			String accountIsSeller = request.getParameter("seller_YN");
			MemberDTO dto2 = new MemberDTO(accountId, accountPasswd, accountName, accountAddressNumber, accountAddressLoad,
					accountPhone, accountEmailId, accountEmailDomain, accountIsSeller);
			System.out.println(dto2);
			int list = service.update(dto2);
			System.out.println("업데이트 된 갯수" + list);
			if (list == 1) {
				session.setAttribute("memberupdate", "회원정보가 수정되었습니다.");
				response.sendRedirect("Mainservlet");
			}
		} else {
			response.sendRedirect("LoginUIServlet");
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
