package com.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public BoardWriteServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = "";
		
		Object obj = request.getSession().getAttribute("login");
		if (obj != null){
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}else {
			response.sendRedirect("LoginUIservlet");
		}
		
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		BoardService service = new BoardService();
		int boardCount = service.boardCount();
		
		BoardDTO dto = new BoardDTO();
		dto.setBoardContentId(boardCount+1+"");
		dto.setBoardUserId(userId);
		dto.setBoardTitle(title);
		dto.setBoardCategory(category);
		dto.setBoardContent(content);
		
		int n = service.boardWrite(dto);
		if(n!=0	){
			response.sendRedirect("BoardListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
