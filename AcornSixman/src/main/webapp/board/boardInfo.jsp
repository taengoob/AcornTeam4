<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO" %>
<%@page import="com.dto.BoardDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%	
		String userId = "";
		Object obj = session.getAttribute("login");
		if (obj != null)
		{
			MemberDTO user = (MemberDTO)obj;
			userId = user.getAccountId();
		}
		
		int boardCount = (int)request.getAttribute("boardCount");
		int boardStart = (int)request.getAttribute("boardStart");
		int boardEnd = (int)request.getAttribute("boardEnd");

		BoardDTO bdto = (BoardDTO)request.getAttribute("bdto");
		String ContentId = bdto.getBoardContentId();
		String Category = bdto.getBoardCategory();
		if(Category.equals("NOTICE")){
			Category = "공지사항";
		}else if(Category.equals("GENERAL")){
			Category = "잡담";
		}
		String wUserId = bdto.getBoardUserId();
		if(wUserId.equals("taengoov")){
			wUserId = "관리자";
		}
		String Title = bdto.getBoardTitle();
		String Content = bdto.getBoardContent();
		String RegDate = bdto.getBoardRegDate();
		String UpdateDate = bdto.getBoardUpdateDate();
		String DelDate = bdto.getBoardDelDate();
		if(DelDate==null){
			DelDate = " ";
		}
		int HitCount = bdto.getBoardHitCount();
		String RealContentId = bdto.getBoardRealContentId();
		
		String searchGroup = (String)request.getAttribute("searchGroup");
		String searchValue = (String)request.getAttribute("searchValue");
		String view = (String)request.getAttribute("view");
%>
<div class="container">
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
<a href="BoardListServlet?Category=<%=Category %>" class="btn btn-outline-dark">목록보기</a>
<a href="#" onclick="reWrite()" class="btn btn-secondary " style="float: right;">글수정</a>
<div id="nTableTop"></div>
<div id="nTableBox">
<table class="table table-light text-center" id="nTable">
	<input type="hidden" id="ContentId" value="<%=ContentId%>">
	<input type="hidden" id="RealContentId" value="<%=RealContentId%>">
	<input type="hidden" id="searchValue" value="<%=searchValue%>">
	<input type="hidden" id="searchGroup" value="<%=searchGroup%>">
	<input type="hidden" id="view" value="<%=view%>">
	<colgroup>
		<col width="10%;"/>
		<col width="10%;"/>
		<col width="60%;"/>
		<col width="5%;"/>
		<col width="5%;"/>
		<col width="5%;"/>
		<col width="5%;"/>
	</colgroup>
   <tr>
      <td colspan="1"><span id="Category"><%=Category%></span></td>
      <td colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%=Title%></td>
      <td colspan="4" align="left"><%if(RegDate==UpdateDate){%><%=RegDate %><%}else{%><%=UpdateDate%><%}%></td>
   </tr>
   <tr>
     <td colspan="1"><span id="writer"><%=wUserId %></span></td>
     <td colspan="2"> </td>
     <td colspan="1">조회수</td>
     <td colspan="1"><%=HitCount%></td>
     <td colspan="1">댓글</td>
     <td colspan="1">0</td>
   </tr>
   <tr>
     <td colspan="7" style="height: 500px;" align="left">
     	<div id="ContentBox"><%=Content %></div>
     </td>
   </tr>
</table>
</div>
<div id="nTableBot"></div>
<a href="#" onclick="prevPage()" class="btn btn-outline-dark">이전글</a>
<a href="#" onclick="nextPage()" class="btn btn-outline-dark">다음글</a>
<a href="#" onclick="boardDel()" class="btn btn-secondary" style="float: right;">글삭제</a>
</div>
<script type="text/javascript">

	function reWrite() {
		var writer = document.getElementById("writer").innerText;
		console.log(writer);
		if(writer=="<%=userId%>"||"taengoov"=="<%=userId%>"){
			if(window.confirm("정말 게시글을 수정하시겠습니까?")){
				var href = "BoardWriteUIServlet?ContentId="+"<%=ContentId%>";
				location.href = href;
			}else{
				alert("수정이 취소되었습니다.");
			}
		}else{
			alert("수정 권한이 없습니다.");
		}
	}
	
	function nextPage() {
		var ContentId = document.getElementById("ContentId").value;
		var Category = document.getElementById("Category").innerText;
		var curPage = document.getElementById("curPage").innerText;
		var searchValue = document.getElementById("searchValue").value;
		var searchGroup = document.getElementById("searchGroup").value;
		var view = document.getElementById("view").value;
		if(view==null){view="";}
		var Move = "Next";
		if(parseInt(ContentId)<<%=boardEnd%>){
			href = "BoardInfoServlet?Category="+Category+"&curPage="+curPage+"&searchValue="+searchValue
				 + "&searchGroup="+searchGroup+"&ContentId="+ContentId+"&view="+view+"&Move="+Move;
			location.href = href;
		}else{
			alert("다음글이 없습니다.");
		}
	}
	
	function prevPage() {
		var ContentId = document.getElementById("ContentId").value;
		var Category = document.getElementById("Category").innerText;
		var curPage = document.getElementById("curPage").innerText;
		var searchValue = document.getElementById("searchValue").value;
		var searchGroup = document.getElementById("searchGroup").value;
		var view = document.getElementById("view").value;
		if(view==null){view="";}
		var Move = "Prev";
		if(parseInt(ContentId)><%=boardStart%>){
			href = "BoardInfoServlet?Category="+Category+"&curPage="+curPage+"&searchValue="+searchValue
				 + "&searchGroup="+searchGroup+"&ContentId="+ContentId+"&view="+view+"&Move="+Move;
		location.href = href;
		}else{
			alert("이전글이 없습니다.");
		}
	}
	
	function boardDel() {
		var writer = document.getElementById("writer").innerText;
		var ContentId = document.getElementById("ContentId").value;
		if(writer=="<%=userId%>"||"taengoov"=="<%=userId%>"){
			if(window.confirm("정말 게시글을 삭제하시겠습니까?")){
				href = "BoardDeleteServlet?ContentId="+ContentId;
				location.href = href;
			}else{
				alert("삭제가 취소되었습니다.");
			}
		}else{
			alert("삭제 권한이 없습니다.");
		}
	}
	
</script>
