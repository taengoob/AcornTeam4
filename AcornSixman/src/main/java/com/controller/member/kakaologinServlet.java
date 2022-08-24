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
 * Servlet implementation class kakaologinServlet
 */
@WebServlet("/kakaologinServlet")
public class kakaologinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public kakaologinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String accountName = request.getParameter("name");
		String accountEmailId1 = request.getParameter("email");
		String email = accountEmailId1;
		String tempEmail[] = email.split("@");
		String accountEmailId = tempEmail[0];
		String accountEmailDomain = tempEmail[1];

		HashMap<String, String> kakao = new HashMap<String, String>();
		kakao.put("accountName", accountName);
		kakao.put("accountEmailId", accountEmailId);
		kakao.put("accountEmailDomain", accountEmailDomain);
		MemberService service = new MemberService();
		MemberDTO dto = service.Loginforkakao(kakao);
		

		HttpSession session = request.getSession();
		if (dto != null) {
			session.setAttribute("login", dto);
			response.sendRedirect("Mainservlet");
			System.out.println("카카오 로그인");
			
		} else {
			session.setAttribute("nameforkakao",accountName);
			session.setAttribute("emailforkakao",accountEmailId);
			session.setAttribute("domainforkakao",accountEmailDomain);
			response.sendRedirect("kakaologin.jsp");
			System.out.println("카카오 회원가입");
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
