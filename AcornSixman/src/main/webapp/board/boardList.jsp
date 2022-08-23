<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.BoardDTO" %>
<%@page import="com.dto.BoardPageDTO" %>
<%@page import="com.dto.MemberDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
	//페이징 처리
	List<BoardDTO> flist = (List<BoardDTO>)request.getAttribute("flist");
	BoardPageDTO bpDTO = (BoardPageDTO)request.getAttribute("bpDTO");
	List<BoardDTO> slist = bpDTO.getList();
	int curPage = bpDTO.getCurPage();

	//로그인 인증
	String userId = "";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}
	
	//카테고리 분류
	String Category = (String)request.getAttribute("Category");
	
%>
<style type="text/css">
	#boardlistctn{
		
	}
	#nTableBox{
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	#nTable{
		padding: 0px;
		margin: 0px;
	}
	#nTableTop, #nTableBot{
		height: 20px;
	}
	#nTr{
		border-bottom: 1px solid black;
	}
	#NoticeRow{
		border-top: 1px solid grey;
		border-bottom: 1px solid grey;
	}
	#ReplyCount{
		font-size: 14px;
		color: #92B8B1;
	}
</style>
<div class="container" id="boardlistctn">
	<div style="height: 50px;"></div>
	<h1 class="text-center" >
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
	<a href="BoardListServlet?Category=<%=Category %>" class="btn btn-outline-dark">전체글</a>
	<a href="BoardListServlet?Category=NOTICE" class="btn btn-outline-dark">공지</a>
	<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark admin">휴지통</a>
	<%if(Category.equals("BOARD")||Category.equals("SECONDHAND")){ %>
	<a href="BoardListServlet?Category=<%=Category %>&view=img" style="position: relative; bottom: -5px; float: right; padding-right: 20px;">
		<img src="upload/imgview5.png" width="40px;" height="40px;">
	</a>
	<a href="BoardListServlet?Category=<%=Category %>" style="position: relative; bottom: -5px; float: right; padding-right: 20px;">
		<img src="upload/textview2.png" width="40px;" height="40px;">
	</a>
	<%} %>
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
				if(subCategory.equals("bNOTICE"));
				String Title = dto.getBoardTitle();
				String UserId = dto.getBoardUserId();
				if(UserId.equals("taengoov")){
					UserId = "관리자";
				}
				String RegDate = dto.getBoardRegDate();
				int HitCount = dto.getBoardHitCount();
				int ReplyCount = dto.getBoardReplyCount();
			%>
			<tr class="table-secondary fw-bold">
				<td scope="row">-</td>
				<td><%=subCategory %></td>
				<td>
					<a href="BoardInfoServlet?Category=<%=Category %>&curPage=<%=curPage %>&ContentId=<%=ContentId %>" class="link-dark text-decoration-none">
						<%=Title %><span id="ReplyCount">(<%=ReplyCount %>)</span>
					</a>
				</td>
				<td><%=UserId %></td>
				<td><%=RegDate %></td>
				<td><%=HitCount %></td>
				<%} %>
			</tr>
			<tr id="NoticeRow">
			</tr>
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
				int ReplyCount = dto.getBoardReplyCount();
			 %>
			<tr>
				<td scope="row"><%=ContentId %></td>
				<td><%=subCategory %></td>
				<td>
					<a href="BoardInfoServlet?Category=<%=Category %>&curPage=<%=curPage %>&ContentId=<%=ContentId %>" class="link-dark text-decoration-none">
						<%=Title %><span id="ReplyCount">(<%=ReplyCount %>)</span>
					</a>&nbsp;
					<a href="BoardDeleteServlet?curPage=<%=curPage %>&ContentId=<%=ContentId %>" class="btn btn-outline-danger btn-sm admin">
						x
					</a>
				</td>
				<td><%=UserId %></td>
				<td><%=RegDate %></td>
				<td><%=HitCount %></td>
			</tr>
			<%} %>
		</table>
	</div>
	<div id="nTableBot"></div>
	<a href="BoardListServlet?Category=<%=Category %>" class="btn btn-outline-dark">전체글</a>
	<a href="BoardListServlet?Category=NOTICE" class="btn btn-outline-dark">공지</a>
<%if("taengoov".equals(userId)||Category.equals("BOARD")||Category.equals("SECONDHAND")||Category.equals("QnA")) {%>
	<a href="BoardWriteUIServlet?Category=<%=Category %>" class="btn btn-secondary" style="float: right;">글쓰기</a>
<%} %>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link link-dark">Previous</a>
    </li>
    <%  
		int perPage = bpDTO.getPerPage();
		int totalCount = bpDTO.getTotalCount();
		int totalPage = totalCount/perPage;
		if(totalCount%perPage!=0)totalPage++;
		for(int i=1; i<=totalPage;i++){
			if(i==curPage){%>
				<li class="page-item active">
					<a href="BoardListServlet?Category=<%=Category%>&curPage=<%=i%>" class="page-link link-dark"><%=i %></a>
				</li>
			<%}else{ %>
				<li class="page-item">
					<a href="BoardListServlet?Category=<%=Category%>&curPage=<%=i %>" class="page-link link-dark"><%=i %></a>
				</li>
			<%}%>
    <%
    	}
    %>
      <li class="page-item"><a class="page-link link-dark" href="#">Next</a>
    </li>
  </ul>
</nav>
<script type="text/javascript">

	window.onload = function () {
		hideAdminElelments(getIsAdmin());
	};

	function hideAdminElelments(isAdmin) {//나중에 메인 jsp에서 참조
		if (isAdmin === false) {
			//class 에 admin이 있는 요소들을 찾는다.
			const elements = document.getElementsByClassName("admin");
	
			//class 에 admin이 있는 요소들을 순회하면서
			for (const key in elements) {
				if (Object.hasOwnProperty.call(elements, key)) {
					const element = elements[key];
					//안보이게 만든다.
					element.style.display = "none";
				}
			}
		}
	}

	function getIsAdmin() {
		if("taengoov"=="<%=userId%>"){
			return true;
		}else{
			return false;
		}
	}


</script>