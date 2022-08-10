package com.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardWriteUIServlet")
public class BoardWriteUIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public BoardWriteUIServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ContentId = request.getParameter("ContentId");
		Object obj = request.getSession().getAttribute("login");
		if (obj != null){
			if(ContentId != null) {
				BoardService service = new BoardService();
				BoardDTO bdto = service.boardInfo(ContentId);
				request.setAttribute("bdto", bdto);
				RequestDispatcher dis = request.getRequestDispatcher("boardReWrite.jsp");
				dis.forward(request, response);
			}else {
				response.sendRedirect("boardWrite.jsp");
			}
		}else {
			response.sendRedirect("LoginUIservlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
