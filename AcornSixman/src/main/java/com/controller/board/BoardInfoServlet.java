package com.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

@WebServlet("/BoardInfoServlet")
public class BoardInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardInfoServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		int boardCount = service.boardCount();
		int boardStart = service.boardStart();
		int boardEnd = service.boardEnd();
		System.out.println(boardStart +"  "+boardEnd);
		
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardStart", boardStart);
		request.setAttribute("boardEnd", boardEnd);
		
		String ContentId = request.getParameter("ContentId");
		service.increaseHitCount(ContentId);
		
		String Move = request.getParameter("Move");
		BoardDTO bdto = null;
		if(Move!=null) { 
			bdto = service.boardMove(Move, ContentId);
			
		}else {
			bdto = service.boardInfo(ContentId);
		}
		request.setAttribute("bdto", bdto);
		
		String category = request.getParameter("category");
		if(category==null) {
			category = "GENERAL";
		}
		String notice = "NOTICE";
		List<BoardDTO> flist = service.boardList(notice);
		List<BoardDTO> slist = service.boardList(category);
		
		request.setAttribute("flist", flist);
		request.setAttribute("slist", slist);
		
		RequestDispatcher dis = request.getRequestDispatcher("boardInfo.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
