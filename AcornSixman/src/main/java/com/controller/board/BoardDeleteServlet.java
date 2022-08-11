package com.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardDeleteServlet")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardDeleteServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = "";
		Object obj = request.getSession().getAttribute("login");
		if (obj != null){
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}else {
			response.sendRedirect("LoginUIservlet");
		}
		
		String ContentId = request.getParameter("ContentId");
		
		BoardService service = new BoardService();
		int n = service.boardDelete(ContentId);
		response.sendRedirect("BoardListServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
