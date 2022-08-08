<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.BoardDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
	List<BoardDTO> nlist = (List<BoardDTO>)request.getAttribute("nlist");
	List<BoardDTO> glist = (List<BoardDTO>)request.getAttribute("glist");

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


</script>
<div class="container">
<br>
<h1 class="text-center" >회원게시판</h1>
<br>
<button type="button" class="btn btn-outline-dark">전체글</button>
<button type="button" class="btn btn-outline-dark">공지</button>
<button type="button" class="btn btn-secondary " style="float: right;">글쓰기</button>
<div id="nTableTop"></div>
<div id="nTableBox">
<table class="table table-light table-hover text-center" id="nTable">
   <tr>
      <th scope="col" style="width: 10%;">번호</th>
      <th scope="col" style="width: 50%;">제목</th>
      <th scope="col" style="width: 10%;">글쓴이</th>
      <th scope="col" style="width: 20%;">작성일</th>
      <th scope="col" style="width: 10%;">조회수</th>
   </tr>
   <%for(int i=0;i<nlist.size();i++){ 
		BoardDTO dto = nlist.get(i);
		String nContentId = dto.getBoardContentId();
		String nTitle = dto.getBoardTitle();
		String nRegDate = dto.getBoardRegDate();
		int nHitCount = dto.getBoardHitCount();
   %>
   <tr class="table-secondary fw-bold">
     <td scope="row"><%=nContentId %></td>
     <td ><a href="#" class="link-dark text-decoration-none"><%=nTitle %></a></td>
     <td>관리자</td>
     <td><%=nRegDate %></td>
     <td><%=nHitCount %></td>
   </tr>
   <%} %>
   <%for(int i=0;i<glist.size();i++){ 
	    BoardDTO dto = glist.get(i);
	    String gContentId = dto.getBoardContentId();
		String gTitle = dto.getBoardTitle();
		String gUserId = dto.getBoardUserId();
		String gRegDate = dto.getBoardRegDate();
		int gHitCount = dto.getBoardHitCount();
   %>
   <tr>
     <td scope="row"><%=gContentId %></td>
     <td><a href="#" class="link-dark text-decoration-none"><%=gTitle %></a></td>
     <td><%=gUserId %></td>
     <td><%=gRegDate %></td>
     <td><%=gHitCount %></td>
   </tr>
   <%} %>
</table>
</div>
<div id="nTableBot"></div>
<button type="button" class="btn btn-outline-dark">전체글</button>
<button type="button" class="btn btn-outline-dark">공지</button>
<a class="btn btn-secondary" style="float: right;">글쓰기</a>
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
