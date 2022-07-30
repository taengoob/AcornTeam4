<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu-item {
	text-align: center;
}
.top {
	margin-right: 60px;
	color: black;
	text-decoration: none;
	position: relative;
}

.top:hover {
	text-decoration: underline width: 100%;
	border-bottom: 3px solid gray;
	color: gray;
}
.top-menu {
	margin-right: 10px;
	color: black;
	text-decoration: none;
	position: relative;
}

.top-menu:hover {
	text-decoration: underline width: 100%;
	border-bottom: 3px solid gray;
	color: gray;
}

</style>
</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	
		<hr>
	</div>
</body>
</html>