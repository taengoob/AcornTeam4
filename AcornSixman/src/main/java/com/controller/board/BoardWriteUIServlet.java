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
		String Category = request.getParameter("Category");
		Object obj = request.getSession().getAttribute("login");
		if (obj != null){//1. 회원인증
			if(ContentId != null) {//2-1. 글수정 버튼으로 왔을경우, 넘겨받은 ContentId의 글수정 페이지로 이동
				BoardService service = new BoardService();
				BoardDTO bdto = service.boardInfo(ContentId);
				request.setAttribute("bdto", bdto);
				RequestDispatcher dis = request.getRequestDispatcher("boardReWrite.jsp");
				dis.forward(request, response);
			}else {//2-1. 글쓰기 버튼으로 왔을경우, 넘겨받은 ContentId가 없으므로 글쓰기 페이지로 이동
				System.out.println(Category);
				response.sendRedirect("boardWrite.jsp?Category="+Category);
			}
		}else {//회원이 아닐경우 로그인UI로 이동
			response.sendRedirect("LoginUIservlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
