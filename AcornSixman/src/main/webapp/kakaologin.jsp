<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <link rel="stylesheet" type="text/css" href="member/Maincss/MainJoinUp.css?after"> -->
<link rel="stylesheet" type="text/css" href="member/Maincss/include.css?after">
</head>
<body>
	<div class="menu-item"> <!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
	<jsp:include page="common/menu.jsp" flush="true"></jsp:include><br>
	<jsp:include page="common/top.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
<jsp:include page="member/kakaologin.jsp" flush="true"></jsp:include>
<jsp:include page="common/bot.jsp"></jsp:include>
<!-- 추가로 인클루드 할것들 // top , menu 페이지 -->
</body>
</html>