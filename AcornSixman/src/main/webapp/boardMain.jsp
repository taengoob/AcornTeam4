<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<title>게시판 전체</title>
</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="common/search.jsp"></jsp:include>
	<hr>
<%
	String view = (String)request.getAttribute("view");
	if(view==null||view.equals("null")||view.equals("")){
%>
	<jsp:include page="board/boardList.jsp"></jsp:include>
<%
	}else{
%>
	<jsp:include page="board/boardImageList.jsp"></jsp:include>
<%
	}
%>
	<jsp:include page="common/bot.jsp"></jsp:include>
	<hr>
	<jsp:include page="common/mesg.jsp"></jsp:include>
</body>
</html>