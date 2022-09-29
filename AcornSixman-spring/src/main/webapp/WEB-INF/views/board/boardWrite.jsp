<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.acorn.sixman.dto.MemberDTO" %>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<% 
	String userId = "";
	Object obj = session.getAttribute("login");
	if (obj != null)
	{
		MemberDTO user = (MemberDTO)obj;
		userId = user.getAccountId();
	}
	
	String Category = (String)request.getParameter("Category");
%>
<div class="container">
	<div style="height: 50px;"></div>
	<h1 class="text-center" >회원게시판</h1>
	<div style="height: 50px;"></div>
	<a href="BoardListServlet?Category=BOARD" class="btn btn-outline-dark">일반게시판</a>
	<a href="BoardListServlet?Category=NOTICE" class="btn btn-outline-dark">공지사항</a>
	<a href="BoardListServlet?Category=NEWS" class="btn btn-outline-dark">최신소식</a>
	<a href="BoardListServlet?Category=SECONDHAND" class="btn btn-outline-dark">중고거래</a>
	<a href="BoardListServlet?Category=QnA" class="btn btn-outline-dark">QnA</a>
	<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark admin">휴지통</a>
	<div id="nTableTop"></div>
	<form action="BoardWriteServlet" id="writeForm" method="post">
		<input type="hidden" value="">
		<div class="w-100" id="writeBoxOut">
			<div id="writeBox">
				<table class="table table-light table-borderless text-center" id="writeTB">
					<colgroup>
						<col width="15%;"/>
						<col width="15%;"/>
						<col width="60%;"/>
						<col width="10%;"/>
					</colgroup>
					<tr>
						<td colspan=4  align="center" height="80px;" style="font-size: 24px; font-weight: bold; vertical-align: middle;">
						 	게시판 글쓰기
						</td>
					</tr>
					<tr>
						<td colspan="1" align="center">
							<select name="category" id="Category" style="width: 100%;" onchange="changeCategory()">
								<option value="" disabled>게시판 선택</option>
								<option class="option admin" value="NOTICE" <%if("NOTICE".equals(Category)){%> selected="selected" <%} %>>공지사항 게시판</option>
								<option class="option admin" value="NEWS" <%if("NEWS".equals(Category)){%> selected="selected" <%} %>>최신소식 게시판</option>
								<option value="BOARD" <%if("BOARD".equals(Category)){%> selected="selected" <%} %>>회원 게시판</option>
								<option value="SECONDHAND" <%if("SECONDHAND".equals(Category)){%> selected="selected" <%} %>>중고거래 게시판</option>
								<option value="QnA" <%if("QnA".equals(Category)){%> selected="selected" <%} %>>Q&A 게시판</option>
							</select>
						</td>
						<td colspan="1" align="center">
							<select name="subcategory" id="subCategory" style="width: 100%;">
								 <option value="" disabled selected>글유형 선택</option>
							<%if("NOTICE".equals(Category)){%>
								<option>공지사항</option>
								<option>이벤트</option>
							<%}else if("NEWS".equals(Category)){%>
								<option class="n admin">공지사항</option>
								<option>기타소식</option>
								<option>할인소식</option>
								<option>공연소식</option>
							<%}else if("BOARD".equals(Category)){%>
								<option class="n admin">공지사항</option>
								<option>잡담</option>
								<option>질문</option>
								<option>정보</option>
							<%}else if("SECONDHAND".equals(Category)){%>
								<option class="n admin">공지사항</option>
								<option>기타소식</option>
								<option>삽니다</option>
								<option>팝니다</option>
							<%}else{ %>
								<option class="n admin">공지사항</option>
								<option>질문</option>
								<option>답변</option>
							<%} %>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<input type="text" name="title" id="title" placeholder="글 제목" style="width: 100%;">
						</td>
					</tr>
					<tr>
						<td colspan="4" height="30px;" width="70%;">
							<span style="float: left;">음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다. [저작권법 안내] [게시물 활용 안내]</span>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="border: 1px solid grey;">
							<textarea class="form-control" name="content" id="content" placeholder="글 내용" 
							 maxlength="2048"></textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="nTableBot"></div>
		<a href="BoardListServlet" class="btn btn-outline-dark">작성취소</a>
		<a href="BoardListServlet?category=NOTICE" class="btn btn-outline-dark">임시저장</a>
		<a id="writeBtn" onclick="writeChk(event)" class="btn btn-secondary" style="float: right;">작성완료</a>
	</form>
</div>
<br>
<script type="text/javascript" src="smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",//textarea ID 입력
	 sSkinURI: "smarteditor2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	 
	});

	
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

	function getIsAdmin() {//세션에서 받아온 로그인중인 ID가 taengoov 일 경우 관리자로 인식
		if("taengoov"=="<%=userId%>"){
			return true;
		}else{
			return false;
		}
	}

	function writeChk(event) {
		//스마트 에디터를 사용할 textarea의 ID 입력
        oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

        //버튼 클릭시 유효성 검사(제목/내용 미입력 및 카테고리 셀렉트 안할시)
        var category = document.getElementById("Category").value;
        var subcategory = document.getElementById("subCategory").value;
		var title = document.getElementById("title").value;
		var content = document.getElementById("content").value;
		console.log(category,title,content);
		if(category.length==0||title.length==0||content.length==0||subcategory.length==0){
			event.preventDefault();
			alert("작성되지 않은 칸이 있습니다.");
		}else{
			try {//유효성 검사가 끝난 후 서브밋 진행
				document.getElementById("writeForm").submit();
			} catch(e) {}
		}
	}

	 function getContextPath() {

		    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

	 }
	
	 function changeCategory() {
		 var NOTICE = ["공지사항","이벤트"];
         var NEWS = ["공지사항",'기타소식','할인소식','공연소식'];
         var BOARD = ["공지사항",'잡담','질문','정보'];
         var SECONDHAND = ["공지사항",'삽니다','팝니다'];
         var QnA = ["공지사항",'질문','답변'];
         var Category = document.getElementById("Category").value;
         var Option;
         if(Category == 'NOTICE'){
        	Option = NOTICE;
         }else if(Category == 'NEWS'){
        	Option = NEWS;
         }else if(Category == 'BOARD'){
         	Option = BOARD;
         }else if(Category == 'SECONDHAND'){
         	Option = SECONDHAND;
         }else{
        	Option = QnA;
         }
         document.getElementById("subCategory").innerHTML = "";
         $("#subCategory").append('<option disabled selected>글유형 선택</option>');
         if("taengoov"=="<%=userId%>"){//관리자 전용 메뉴 
          	$("#subCategory").append('<option class="n admin" value="'+Option[i]+'">'+Option[0]+'</option>');
         }
         for (var i=1; i<Option.length; i++) {
        	$("#subCategory").append('<option value="'+Option[i]+'">'+Option[i]+'</option>');
         }
	 }
</script>