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
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
</head>


<body>

	<div class="menu-item"> <!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/MyPage.jsp" flush="true"></jsp:include>
</body>
</html>