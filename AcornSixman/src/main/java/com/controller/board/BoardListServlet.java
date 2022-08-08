package com.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public BoardListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		if(category==null) {
			category = "GENERAL";
		}
		String notice = "NOTICE";
		BoardService service = new BoardService();
		List<BoardDTO> nlist = service.boardList(notice);
		List<BoardDTO> glist = service.boardList(category);
		
		request.setAttribute("nlist", nlist);
		request.setAttribute("glist", glist);
		RequestDispatcher dis = request.getRequestDispatcher("boardMain.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
