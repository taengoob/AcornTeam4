<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.BoardDTO" %>
<%@page import="com.dto.MemberDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
	List<BoardDTO> flist = (List<BoardDTO>)request.getAttribute("flist");
	List<BoardDTO> slist = (List<BoardDTO>)request.getAttribute("slist");
	
	String userId = "";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}

%>
<style type="text/css">
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
</style>
<script type="text/javascript">

	window.onload = function () {
		hideAdminElelments(getIsAdmin());
	};

	function hideAdminElelments(isAdmin) {
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
<div class="container">
<br>
<br>
<h1 class="text-center" >회원게시판</h1>
<br>
<br>
<a href="BoardListServlet" class="btn btn-outline-dark">전체글</a>
<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark">공지</a>
<a href="BoardWriteUIServlet" class="btn btn-secondary" style="float: right;">글쓰기</a>
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
    <tr>
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
		String Category = dto.getBoardCategory();
		if(Category.equals("NOTICE")){
			Category = "공지사항";
		}
		String Title = dto.getBoardTitle();
		String UserId = dto.getBoardUserId();
		if(UserId.equals("taengoov")){
			UserId = "관리자";
		}
		String RegDate = dto.getBoardRegDate();
		int HitCount = dto.getBoardHitCount();
    %>
    <tr class="table-secondary fw-bold">
     <td scope="row"><%=ContentId %></td>
     <td><%=Category %></td>
     <td><a href="BoardInfoServlet?ContentId=<%=ContentId %>" class="link-dark text-decoration-none"><%=Title %></a></td>
     <td><%=UserId %></td>
     <td><%=RegDate %></td>
     <td><%=HitCount %></td>
    </tr>
    <%} %>
    <%for(int i=0;i<slist.size();i++){ 
	    BoardDTO dto = slist.get(i);
	    String ContentId = dto.getBoardContentId();
	    String Category = dto.getBoardCategory();
	    if(Category.equals("NOTICE")){
	    	Category = "공지사항";
	    }else if(Category.equals("GENERAL")){
	    	Category = "잡담";
	    }
		String Title = dto.getBoardTitle();
		String UserId = dto.getBoardUserId();
		if(UserId.equals("taengoov")){
			UserId = "관리자";
		}
		String RegDate = dto.getBoardRegDate();
		int HitCount = dto.getBoardHitCount();
    %>
    <tr>
     <td scope="row"><%=ContentId %></td>
     <td><%=Category %></td>
     <td><a href="BoardInfoServlet?ContentId=<%=ContentId %>" class="link-dark text-decoration-none"><%=Title %></a>
     	&nbsp;<a href="BoardDeleteServlet?ContentId=<%=ContentId %>" class="btn btn-outline-danger btn-sm admin">x</a>
     </td>
     <td><%=UserId %></td>
     <td><%=RegDate %></td>
     <td><%=HitCount %></td>
    </tr>
    <%} %>
</table>
</div>
<div id="nTableBot"></div>
<a href="BoardListServlet" class="btn btn-outline-dark">전체글</a>
<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark">공지</a>
<a href="BoardWriteUIServlet" class="btn btn-secondary" style="float: right;">글쓰기</a>
</div>
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link link-dark">Previous</a>
    </li>
    <%for(int i=1;i<=10;i++){ %>
    <li class="page-item"><a class="page-link link-dark" href="#"><%=i %></a></li>
    <li class="page-item">
    <%} %>
      <a class="page-link link-dark" href="#">Next</a>
    </li>
  </ul>
</nav>
