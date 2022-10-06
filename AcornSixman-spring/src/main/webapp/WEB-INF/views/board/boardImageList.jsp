<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.acorn.sixman.dto.BoardDTO" %>
<%@page import="com.acorn.sixman.dto.BoardPageDTO" %>
<%@page import="com.acorn.sixman.dto.MemberDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
	List<BoardDTO> flist = (List<BoardDTO>)request.getAttribute("flist");
	BoardPageDTO bpDTO = (BoardPageDTO)request.getAttribute("bpDTO");
	List<BoardDTO> slist = new ArrayList<BoardDTO>();
// 	List<BoardDTO> slist = bpDTO.getList();
	int curPage = bpDTO.getCurPage();
	
	String view = (String)request.getAttribute("view");
	
	String userId = "";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}
	
	//카테고리 분류
	String Category = (String)request.getAttribute("Category");
	String searchGroup = (String)request.getAttribute("searchGroup");
	String searchValue = (String)request.getAttribute("searchValue");
%>
<style type="text/css">
	.page-link {
	  color: #000; 
	  background-color: #fff;
	  border: 1px solid #ccc; 
	}
	
	.page-item.active .page-link {
	 z-index: 1;
	 color: #343a40;
	 font-weight:bold;
	 color: white;
	 background-color: #343a40;
	 border-color: #343a40;
	 
	}
	.page-link:focus, .page-link:hover {
	  color: #000;
	  background-color: #fafafa; 
	  border-color: #ccc;
	}
</style>
<div class="container">
	<div style="height: 50px;"></div>
	<h1 class="text-center">
	<%if(Category.equals("NOTICE")){%>
		공지사항 게시판
	<%}else if(Category.equals("NEWS")){%>
		최신소식 게시판
	<%}else if(Category.equals("BOARD")){%>
		회원 게시판
	<%}else if(Category.equals("SECONDHAND")){%>
		중고거래 게시판
	<%}else{%>
		Q&A 게시판
	<%} %>
	</h1>
	<div style="height: 50px;"></div>
	<a href="BoardListServlet?Category=BOARD" class="btn btn-outline-dark">일반게시판</a>
	<a href="BoardListServlet?Category=NOTICE" class="btn btn-outline-dark">공지사항</a>
	<a href="BoardListServlet?Category=NEWS" class="btn btn-outline-dark">최신소식</a>
	<a href="BoardListServlet?Category=SECONDHAND" class="btn btn-outline-dark">중고거래</a>
	<a href="BoardListServlet?Category=QnA" class="btn btn-outline-dark">QnA</a>
	<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark admin">휴지통</a>
	<a href="BoardListServlet?view=img" style="position: relative; bottom: -5px; float: right; padding-right: 20px;">
		<img src="upload/imgview.png" width="40px;" height="40px;">
	</a>
	<a href="BoardListServlet" style="position: relative; bottom: -5px; float: right; padding-right: 20px;">
		<img src="upload/textview.png" width="40px;" height="40px;">
	</a>
	<div id="nTableTop"></div>
	<div id="nTableBox">
		<table class="table table-light table-hover text-center" id="nTable">
			<colgroup>
				<col width="5%;"/>
				<col width="10%;"/>
				<col width="50%;"/>
				<col width="10%;"/>
				<col width="20%;"/>
				<col width="5%;"/>
			</colgroup>
			<tr id="NoticeRow">
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<%for(int i=0;i<flist.size();i++){ 
				BoardDTO dto = flist.get(i);
				String ContentId = dto.getBoardContentId();
				String subCategory = dto.getBoardSubCategory();
				String Title = dto.getBoardTitle();
				String UserId = dto.getBoardUserId();
				if(UserId.equals("taengoov")){
					UserId = "관리자";
				}
				String RegDate = dto.getBoardRegDate();
				int HitCount = dto.getBoardHitCount();
				String PreviewImg = dto.getBoardPreviewImg();
				int ReplyCount = dto.getBoardReplyCount();
			%>
			<tr class="table-secondary fw-bold">
				<td scope="row">-</td>
				<td><%=subCategory %></td>
				<td>
				<%if(PreviewImg!=null){%> 
					<img src="upload/imgO.png" width="20px;" height="20px;" style="margin-bottom: 5px;">
				<%} %>
					<a href="BoardInfoServlet?Category=<%=Category%>&curPage=<%=curPage %>&searchValue=<%=searchValue%>&searchGroup=<%=searchGroup%>&ContentId=<%=ContentId %>&view=img" class="link-dark text-decoration-none">
						<%=Title %><span id="ReplyCount">(<%=ReplyCount %>)</span>
					</a>
				</td>
				<td><%=UserId %></td>
				<td><%=RegDate %></td>
				<td><%=HitCount %></td>
			</tr>
			<%} %>
			<tr id="NoticeRow">
			</tr>
	    </table>
	</div>
    <div class="row" style="width: 100%;margin: auto;" >
		<div class="w-100" style="height: 25px;"></div>
		<%for(int i=0;i<slist.size();i++){ 
			BoardDTO dto = slist.get(i);
			String ContentId = dto.getBoardContentId();
			String subCategory = dto.getBoardSubCategory();
			String Title = dto.getBoardTitle();
			String UserId = dto.getBoardUserId();
			if(UserId.equals("taengoov")){
				UserId = "관리자";
			}
			String RegDate = dto.getBoardRegDate();
			int HitCount = dto.getBoardHitCount();
			String PreviewImg = dto.getBoardPreviewImg();
			int ReplyCount = dto.getBoardReplyCount();
		%>
		<div class="col-sm-3">
			<div class="card">
				<a href="BoardInfoServlet?Category=<%=Category%>&curPage=<%=curPage %>&searchValue=<%=searchValue%>&searchGroup=<%=searchGroup%>&ContentId=<%=ContentId %>&view=img" style="margin: auto;">
					<img class="card-img-top" id="previewimg"
					<%if(PreviewImg!=null) {//대표 이미지 출력%>
						src="<%=PreviewImg %>"
					<%}else{//저장된 이미지가 없을 경우 noimage 출력 %>
						src="upload/noimage.png"
					<%} %>>
				</a>
				<ul class="list-group list-group-flush table-hover">
					<li class="list-group-item">
						<span style="font-weight: bold;"><%=Title %><span id="ReplyCount2">(<%=ReplyCount %>)</span></span>
					</li>
					<li class="list-group-item">
						<span><%=UserId %></span>
					</li>
					<li class="list-group-item">
						<span>•조회수 <%=HitCount %></span>
						<span style="float: right">•<%=RegDate %></span>
					</li>
				</ul>
			</div>
		</div>
			<% if((i+1)%4==0 && i<11){%>
				<div class="w-100" style="height: 30px;"></div>
			<%}%>
		<%} %>
	<div class="w-100" style="height: 30px;"></div>
	</div>
	<div id="nTableBots"></div>
	<div class="w-100" id="searchBox" style="height: 35px;">
		<form action="BoardListServlet" method="get" id="searchForm">
			<input type="hidden" name="Category" value="<%=Category%>">
			<input class="form-control" name="searchValue" id="searchValue" type="text" 
			<%if(searchValue!=""){%>value="<%=searchValue%>"<%} %>	placeholder="게시판 내 검색">
			<a href="#" class="btn btn-outline-secondary" id="searchBtn" onclick="searchGo()">
				<img id="searchIcon" src="upload/search.png" width="20px;" height="20px;">
			</a>
			<select class="form-select" name="searchGroup" id="searchGroup">
				<option value="Title" <%if("Title".equals(searchGroup)){%> selected <%}%>>제목</option>
				<option value="UserId" <%if("UserId".equals(searchGroup)){%> selected <%}%>>작성자</option>
				<option value="Content" <%if("Content".equals(searchGroup)){%> selected <%}%>>내용</option>
				<option value="Title,Content" <%if("Title,Content".equals(searchGroup)){%> selected <%}%>>제목+내용</option>
			</select>
		</form>
		<%if("taengoov".equals(userId)||Category.equals("BOARD")||Category.equals("SECONDHAND")||Category.equals("QnA")) {%>
		<a href="BoardWriteUIServlet?Category=<%=Category %>" class="btn btn-secondary" id="writeGoBtn">글쓰기</a>
		<%} %>
	</div>
</div>
<div class="container" style="margin: auto;">
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link link-dark">◀</a>
	    </li>
	    <%  
			int perPage = bpDTO.getPerPage();
			int totalCount = bpDTO.getTotalCount();
			int totalPage = totalCount/perPage;
			if(totalCount%perPage!=0)totalPage++;
			for(int i=1; i<=totalPage;i++){
				if(i==curPage){%>
					<li class="page-item active">
						<a id="curPage" href="BoardListServlet?Category=<%=Category%>&curPage=<%=i %>&searchValue=<%=searchValue%>&searchGroup=<%=searchGroup%>&view=img" class="page-link link-dark"><%=i %></a>
					</li>
				<%}else{ %>
					<li class="page-item">
						<a href="BoardListServlet?Category=<%=Category%>&curPage=<%=i %>&searchValue=<%=searchValue%>&searchGroup=<%=searchGroup%>&view=img" class="page-link link-dark"><%=i %></a>
					</li>
				<%}%>
	    <%
	    	}
	    %>
	      <li class="page-item"><a class="page-link link-dark" href="#">▶</a>
	    </li>
	  </ul>
	</nav>
</div>
<script src="board/boardJS/boardImageList.js"></script>