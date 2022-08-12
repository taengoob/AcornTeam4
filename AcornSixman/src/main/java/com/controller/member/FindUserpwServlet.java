package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class FindUser
 */
@WebServlet("/FindUserpwServlet")
public class FindUserpwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindUserpwServlet() {
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
		String accountId = request.getParameter("name");
		String accountEmailId = request.getParameter("email01");
		String accountEmailDomain = request.getParameter("email02");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accountId", accountId);
		map.put("accountEmailId", accountEmailId);
		map.put("accountEmailDomain", accountEmailDomain);
		System.out.println(map);
		MemberService service = new MemberService();
		MemberDTO dto = service.findid2(map);// 중복 count
		HttpSession session = request.getSession();
		String id = "";
		String mesg = "";
		if (dto != null) {
			mesg = dto.getAccountName();
			id = dto.getAccountId();
			System.out.println("유저 이름" + mesg);
			System.out.println("유저 아이디" + id);
			session.setAttribute("useridpw", id);
			session.setAttribute("name", mesg);
			response.sendRedirect("findipw.jsp");
		} else {
			session.setAttribute("findid", "nonid");
			response.sendRedirect("FirstFindPW.jsp");
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
