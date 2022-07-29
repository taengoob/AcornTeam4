<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="member/Maincss/MyPage.css">
<style type="text/css">
a {
	margin-right: 20px;
	color: black;
	text-decoration: none;
}

.menu-item {
	text-align: right;
}
</style>
</head>


<body>
	<h1>마이페이지 입니다</h1>
	<div class="menu-item"> <!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<jsp:include page="member/MyPage.jsp" flush="true"></jsp:include>
</body>
</html>