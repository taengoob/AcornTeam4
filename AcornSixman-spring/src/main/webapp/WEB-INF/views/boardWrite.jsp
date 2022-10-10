<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="static/css/include.css">
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<div class="menu-item">
<jsp:include page="common/top.jsp" flush="true"></jsp:include>
<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
		
</div><div class="wide"></div>
<jsp:include page="common/search.jsp"></jsp:include>
<hr>
<jsp:include page="board/boardWrite.jsp" flush="true"></jsp:include>
<jsp:include page="common/bot.jsp" flush="true"></jsp:include>
<hr>
<jsp:include page="common/mesg.jsp" flush="true"></jsp:include>
</body>
</html>