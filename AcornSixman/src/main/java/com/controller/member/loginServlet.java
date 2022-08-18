package com.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
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
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		HashMap<String, String> map = new HashMap<>();
		MemberService service = new MemberService();
		map.put("accountId", userid);
		map.put("accountPasswd", passwd);
		MemberDTO dto = service.Login(map);

		System.out.println(map);
		System.out.println(dto);
		HttpSession session = request.getSession();
		if (dto != null) {
			response.sendRedirect("Mainservlet");

			session.setAttribute("login", dto);
			System.out.println("써쁠릿 >>>>" + dto.getAccountIsSeller());
			session.setMaxInactiveInterval(60 * 60);
			System.out.println("로그인 성공");
		} else {
			response.sendRedirect("LoginUIservlet");
			session.setAttribute("nologin", "로그인 정보를 확인해 주세요");
			System.out.println("로그인 실패");
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
