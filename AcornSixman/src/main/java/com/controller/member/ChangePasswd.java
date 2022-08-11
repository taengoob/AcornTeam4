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
 * Servlet implementation class ChangePasswd
 */
@WebServlet("/ChangePasswd")
public class ChangePasswd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberService service = new MemberService();
		String accountPasswd = request.getParameter("passwd1");
		String accountId = request.getParameter("userid");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("accountPasswd", accountPasswd);
		map.put("accountId", accountId);
		System.out.println(map);
		int list = service.changePW(map);
		String mesg = "";
		if (list != 0) {
			mesg = "비밀번호가 변경되었습니다.";
			session.setAttribute("changepw", mesg);
			response.sendRedirect("LoginUIservlet");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
