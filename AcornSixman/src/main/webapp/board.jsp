<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<style type="text/css">
#noticetitle{
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div><div class="wide"></div>
	<h1 id="noticetitle">공지사항 게시판</h1>
<hr>
<jsp:include page="board/board.jsp" flush="true"></jsp:include>
<hr>
<jsp:include page="common/bot.jsp" flush="true"></jsp:include>
<hr>
<jsp:include page="common/mesg.jsp" flush="true"></jsp:include>
</body>
</html>