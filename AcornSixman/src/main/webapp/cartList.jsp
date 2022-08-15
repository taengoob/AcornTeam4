<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<style type="text/css">
	
	body {
   	 	margin: 0;
    	padding: 0;
	}

</style>
</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
<jsp:include page="cart/cartmenu.jsp" flush="true"></jsp:include><br>
<jsp:include page="cart/cartlist2.jsp" flush="true"></jsp:include><br>
<jsp:include page="common/bot.jsp" flush="true"></jsp:include><br>
</body>
</html>