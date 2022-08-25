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
import com.dto.BoardPageDTO;
import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardListServlet")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public BoardListServlet() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
		
		String Category = request.getParameter("Category");//현재 어떤 페이지인지
		if(Category==null) {Category="BOARD";}
		
		String curPage = request.getParameter("curPage");//현재 몇 페이지인지
		if(curPage==null) {curPage="1";}
		
		String view = request.getParameter("view");//게시판 형식
		if(view==null||view.equals("")) {
			view = "";
		}else {
			request.setAttribute("view", view);
		}
		
		String searchGroup = request.getParameter("searchGroup");//검색분류
		if(searchGroup==null) {searchGroup="";}
		String searchValue = request.getParameter("searchValue");//검색어
		if(searchValue==null) {searchValue="";}
		
		List<BoardDTO> flist = service.boardList(Category); //게시판 공지목록
		
		BoardPageDTO bpDTO = service.boardPageList(Category, view, Integer.parseInt(curPage), searchGroup, searchValue);
		
		request.setAttribute("Category", Category);
		request.setAttribute("flist", flist);
		request.setAttribute("bpDTO", bpDTO);
		request.setAttribute("searchGroup", searchGroup);//현재 선택된 검색분류 넘기기
		request.setAttribute("searchValue", searchValue);//현재 검색된 검색어 넘기기
		RequestDispatcher dis = request.getRequestDispatcher("boardMain.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
