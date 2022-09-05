<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
</head>
<body>
	<div class="menu-item">
		<jsp:include page="../common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="../common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<hr>
	 <jsp:include page="1productlist.jsp" flush="true"></jsp:include><br>
	<hr>
	<jsp:include page="sidebar1.jsp" flush="true"></jsp:include><br>  
	<jsp:include page="../common/bot.jsp"></jsp:include>
	<hr>
	<jsp:include page="../common/mesg.jsp"></jsp:include>
</body>
</html>