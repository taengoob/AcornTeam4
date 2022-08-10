<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO" %>
<%@page import="com.dto.BoardDTO" %>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
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
		String Title = bdto.getBoardTitle();
		String Content = bdto.getBoardContent();
	
%>
<style type="text/css">

	textarea{
		height: 800px;
		resize: none;
	}
	
	#nTableTop, #nTableBot{
		height: 20px;
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

	function writeChk(event) {
		//id가 smarteditor인 textarea에 에디터에서 대입
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

        // 이부분에 에디터 validation 검증
        var category = document.getElementById("category").value;
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;
		console.log(category,title,content);
		if(category.length==0||title.length==0||content.length==0){
			event.preventDefault();
			alert("작성되지 않은 칸이 있습니다.");
		}else{
			try {
				document.getElementById("writeForm").submit();
			} catch(e) {}
		}
	}

	 function getContextPath() {

		    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

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
	<div id="nTableTop"></div>
	<form action="BoardWriteServlet" id="writeForm" method="post">
		<input type="hidden" value="">
		<table class="table table-light text-center">
			<colgroup>
				<col width="10%;"/>
				<col width="90%;"/>
			</colgroup>
			<tr>
				<td colspan=2  align="center" height="80px;" style="font-size: 24px; font-weight: bold; vertical-align: middle;">
				 	게시판 글수정
				</td>
			</tr>
			<tr>
				<td colspan="1" align="center">
					<select name="category" id="category" style="width: 100%;">
						<option>카테고리</option>
						<option class="option admin" value="NOTICE" <%if("NOTICE".equals(Category)){%> selected="selected" <%} %>>공지사항</option>
						<option class="option admin" value="EVENT" <%if("EVENT".equals(Category)){%> selected="selected" <%} %>>이벤트</option>
						<option value="GENERAL" <%if("GENERAL".equals(Category)){%> selected="selected" <%} %>>잡담</option>
					</select>
				</td>
				<td colspan="1" align="center">
					<input type="text" name="title" id="title" placeholder="글 제목" style="width: 100%;" value="<%=Title%>">
				</td>
			</tr>
				<td colspan="2" height="30px;"></td>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<textarea class="form-control" name="content" id="content" placeholder="글 내용" 
					 maxlength="2048" spellcheck="false"><%=Content%></textarea>
				</td>
			</tr>
		</table>
		<div id="nTableBot"></div>
		<a href="BoardListServlet" class="btn btn-outline-dark">작성취소</a>
		<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark">임시저장</a>
		<a id="writeBtn" onclick="writeChk(event)" class="btn btn-secondary" style="float: right;">수정완료</a>
	</form>
</div>
<br>
<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "smarteditor2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
	
</script>