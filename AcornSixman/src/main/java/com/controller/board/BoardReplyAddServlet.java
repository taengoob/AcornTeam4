package com.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.IDGenerator;
import com.dto.BoardDTO;
import com.google.gson.Gson;
import com.service.BoardService;

@WebServlet("/BoardReplyAddServlet")
public class BoardReplyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardReplyAddServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refContentId = request.getParameter("ContentId");//받아온 컨텐츠 아이디를 참조
		String ReplyId = IDGenerator.getNewBoardContentId();
		System.out.println("댓글번호"+ReplyId);
		String UserId = request.getParameter("UserId");
		String ReplyContent = request.getParameter("ReplyContent");
		
		BoardService service = new BoardService();
		int n = service.replyAdd(refContentId, ReplyId, UserId, ReplyContent);
		List<BoardDTO> list = null;
		if(n!=0) {
			list = service.replySelect(ReplyId);
			//System.out.println(list);
			String json = new Gson().toJson(list);
			//System.out.println(json);
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
