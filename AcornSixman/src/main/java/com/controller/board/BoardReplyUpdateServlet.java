package com.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BoardService;

@WebServlet("/BoardReplyUpdateServlet")
public class BoardReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardReplyUpdateServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		BoardService service = new BoardService();
		
		String ReplyId = request.getParameter("ContentId");
		String ReplyContent = request.getParameter("ReplyContent");//수정요청시에만 데이터 파싱
		String mesg = "";
		if(ReplyContent==null) {//삭제요청인 경우
			int n = service.replyDelete(ReplyId);
			if(n!=0) {
				mesg = "삭제된 댓글입니다.";
			}
		}else {//수정요청인 경우
			int n = service.replyUpdate(ReplyId, ReplyContent);
			if(n!=0) {
				mesg = ReplyContent;
			}
		}
		out.print(mesg);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
