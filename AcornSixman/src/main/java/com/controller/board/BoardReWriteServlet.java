package com.controller.board;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.BoardDTO;
import com.dto.MemberDTO;
import com.service.BoardService;

@WebServlet("/BoardReWriteServlet")
public class BoardReWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardReWriteServlet() {}

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
		String ContentId = request.getParameter("ContentId");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String content = request.getParameter("content");
		
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	    Matcher matcher = pattern.matcher(content);
	    
	    String[] imgs = new String[10];//이미지 최대 10개 저장
	    int index = 0;
		while(matcher.find()){ 
			 imgs[index] = matcher.group(1);//img 태그의 src 값만 추출
			 index++;
		}
		if(imgs[0]==null) {
			imgs[0]="";
		}
		
		BoardService service = new BoardService();
		
		BoardDTO dto = new BoardDTO();
		dto.setBoardContentId(ContentId);
		dto.setBoardUserId(userId);
		dto.setBoardTitle(title);
		dto.setBoardCategory(category);
		dto.setBoardSubCategory(subcategory);
		dto.setBoardContent(content);
		dto.setBoardPreviewImg(imgs[0]);
		
		int n = service.boardReWrite(dto);
		if(n!=0	){
			response.sendRedirect("BoardInfoServlet?Category="+category+"&ContentId="+ContentId);
		}else {
			response.sendRedirect("BoardListServlet?Category="+category);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
