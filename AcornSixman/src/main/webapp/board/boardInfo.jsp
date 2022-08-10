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

	function reWrite() {
		var writer = document.getElementById("writer").value;
		console.log(writer);
		if(writer=="<%=userId%>"||"taengoov"=="<%=userId%>"){
			var href = "BoardWriteUIServlet?ContentId="+"<%=ContentId%>";
			location.href = href;
		}else{
			alert("수정 권한이 없습니다.");
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
<a href="#" onclick="reWrite()" class="btn btn-secondary " style="float: right;">글수정</a>
<div id="nTableTop"></div>
<div id="nTableBox">
<table class="table table-light table-hover text-center" id="nTable">
	<input type="hidden" id="writer" name="writer" value="<%=wUserId%>">
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
      <td colspan="1"><%=Category%></td>
      <td colspan="2" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<%=Title%></td>
      <td colspan="4" align="left"><%if(RegDate==UpdateDate){%><%=RegDate %><%}else{%><%=UpdateDate%><%}%></td>
   </tr>
   <tr>
     <td colspan="1"><%=wUserId %></td>
     <td colspan="2"> </td>
     <td colspan="1">조회수</td>
     <td colspan="1"><%=HitCount%></td>
     <td colspan="1">댓글</td>
     <td colspan="1">0</td>
   </tr>
   <tr>
     <td colspan="7" style="height: 500px;" align="left"><br><br><%=Content %><br><br></td>
   </tr>
</table>
</div>
<div id="nTableBot"></div>
<button type="button" class="btn btn-outline-dark">이전글</button>
<button type="button" class="btn btn-outline-dark">다음글</button>
<a class="btn btn-secondary" style="float: right;">글삭제</a>
</div>

