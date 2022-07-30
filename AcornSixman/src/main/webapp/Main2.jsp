<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu-item {
	text-align: right;
	background-image: url(member/img/logo.png);
	 background-size: 300px 100px;
	 background-repeat: no-repeat;
	 background-position: center;

	
	
	
}
h1 {
	text-align: left;
}

.top {
	margin-right: 20px;
	color: black;
	text-decoration: none;
	position: relative;
}

.top:hover {
	text-decoration: underline width: 100%;
	border-bottom: 3px solid gray;
	color: gray;
}

</style>
</head>
<body>
	<div class="menu-item">
		<h1>메인 화면 입니다</h1>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include><br>

		<hr>
	</div>
</body>
</html>