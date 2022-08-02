<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="member/Maincss/sample.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<style type="text/css">
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo:400" rel="stylesheet">
#userid {
	padding-left: 5px;
	width: 17%;
	margin-top: 3%;
	border: 1px solid #c0c0c0;
	line-height: 40px;
	outline: none;
}

#passwd {
	padding-left: 5px;
	width: 17%;
	margin-top: 5px;
	border: 1px solid #c0c0c0;
	line-height: 40px;
	outline: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="menu-item"> <!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<jsp:include page="member/Login.jsp" flush="true"></jsp:include>
	<jsp:include page="common/bot.jsp"></jsp:include>
</body>
</html>