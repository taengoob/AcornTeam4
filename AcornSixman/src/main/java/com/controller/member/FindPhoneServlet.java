package com.controller.member;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.dto.MemberDTO;
import com.service.MemberService;

/**
 * Servlet implementation class FindUser
 */
@WebServlet("/FindPhoneServlet")
public class FindPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPhoneServlet() {
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
		String accountPhone = request.getParameter("phoneNumber");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accountName", accountName);
		map.put("accountPhone", accountPhone);

		System.out.println(map);
		MemberService service = new MemberService();
		MemberDTO dto = service.findidforphone(map);// 중복 count
		HttpSession session = request.getSession();
		String id= "";
		String name = "";
		if (dto != null) {
			id = dto.getAccountId();
			name= accountName;
			System.out.println(id);
			session.setAttribute("userid", id);
			session.setAttribute("name", name);
			response.sendRedirect("findid.jsp");
		}else {
			session.setAttribute("findid", "nonid");
			response.sendRedirect("FirstFindID.jsp");	
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
