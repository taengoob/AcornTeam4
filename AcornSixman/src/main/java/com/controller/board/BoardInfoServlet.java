package com.controller.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.dto.BoardPageDTO;
import com.service.BoardService;

@WebServlet("/BoardInfoServlet")
public class BoardInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardInfoServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		String Category = request.getParameter("Category");//현재 어떤 페이지인지
		if(Category==null) {Category="BOARD";}
		
		String searchGroup = request.getParameter("searchGroup");//검색분류
		if(searchGroup==null) {searchGroup="";}
		String searchValue = request.getParameter("searchValue");//검색어
		if(searchValue==null) {searchValue="";}
		
		//게시글 상세보기
		int boardCount = service.boardCount(Category, searchGroup, searchValue);
		int boardStart = service.boardStart(Category, searchGroup, searchValue);
		int boardEnd = service.boardEnd(Category, searchGroup, searchValue);
		
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardStart", boardStart);
		request.setAttribute("boardEnd", boardEnd);
		
		String ContentId = request.getParameter("ContentId");
		service.increaseHitCount(ContentId);
		
		String Move = request.getParameter("Move");
		BoardDTO bdto = null;
		if(Move!=null) { 
			bdto = service.boardMove(Move, ContentId, Category, searchGroup, searchValue);
			
		}else {
			bdto = service.boardInfo(ContentId);
		}
		request.setAttribute("bdto", bdto);
		
		
		
		//댓글
		String x = "11111";
		Map<String, Object> map = service.replyList(ContentId);
		request.setAttribute("map", map);
		
		
		
		//아래 게시글 목록
		
		String curPage = request.getParameter("curPage");//현재 몇 페이지인지
		if(curPage==null) {curPage="1";}
		
		String view = request.getParameter("view");//게시판 형식
		if(view==null||view.equals("")) {
			view = "";
		}else {
			request.setAttribute("view", view);
		}
		
		List<BoardDTO> flist = service.boardList(Category); //게시판 공지목록
		
		BoardPageDTO bpDTO = service.boardPageList(Category, view, Integer.parseInt(curPage), searchGroup, searchValue);
		
		request.setAttribute("Category", Category);
		request.setAttribute("flist", flist);
		request.setAttribute("bpDTO", bpDTO);
		request.setAttribute("searchGroup", searchGroup);//현재 선택된 검색분류 넘기기
		request.setAttribute("searchValue", searchValue);//현재 검색된 검색어 넘기기
		RequestDispatcher dis = request.getRequestDispatcher("boardInfo.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
