package com.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.service.BoardService;

@WebServlet("/BoardMoveServlet")
public class BoardMoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public BoardMoveServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		String Move = request.getParameter("Move");
		String ContentId = request.getParameter("ContentId");
		if(Move!=null) { 
			BoardDTO bdto = service.boardMove(Move, ContentId);
			
		}else {
			response.sendRedirect("BoardInfoServlet?ContentId="+ContentId);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
