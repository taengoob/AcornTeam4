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
<style type="text/css">
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
	<h1>로그인 페이지</h1>
	<jsp:include page="member/Login.jsp" flush="true"></jsp:include>
</body>
</html>