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
@WebServlet("/FindUseridServlet")
public class FindUseridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindUseridServlet() {
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
		String accountName = request.getParameter("name");
		String accountEmailId = request.getParameter("email01");
		String accountEmailDomain = request.getParameter("email02");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accountName", accountName);
		map.put("accountEmailId", accountEmailId);
		map.put("accountEmailDomain", accountEmailDomain);
		System.out.println(map);
		MemberService service = new MemberService();
		MemberDTO dto = service.findid(map);// 중복 count
		String id= "";
		String name = "";
		if (dto != null) {
			id = dto.getAccountId();
			name= accountName;
			System.out.println(id);
			HttpSession session = request.getSession();
			session.setAttribute("userid", id);
			session.setAttribute("name", name);
			response.sendRedirect("findid.jsp");
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
