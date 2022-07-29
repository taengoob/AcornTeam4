<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	margin-right: 20px;
	color: black;
	text-decoration: none;
}
.menu-item{
text-align: right;

}
</style>
</head>
<body>
	<h1>메인 화면 입니다</h1>
	<div class="menu-item">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	</div>
</body>
</html>