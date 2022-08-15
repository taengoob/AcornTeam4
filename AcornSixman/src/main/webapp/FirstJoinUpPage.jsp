<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="member/Maincss/FirstJoinUp.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="member/Maincss/include.css?after">
<style type="text/css">
</style>

</head>
<body>
	<div class="menu-item">
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/firstJoinUPPage.jsp"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
</body>
</html>