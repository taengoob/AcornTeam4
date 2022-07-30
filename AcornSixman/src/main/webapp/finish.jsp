<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="member/Maincss/include.css">
<title>index</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	text-decoration: none;
}

ul li {
	list-style: none;
}

.main-container {
	margin: 0 auto;
	width: 50%;
}

.main-box {
	width: 100%;
	border: 1px solid #eaeaea;
	text-align: center;
	overflow: hidden;
	height: 300px;
	margin-top: 3%;
}

.main-write {
	margin-top: 15%;
	border-bottom: 4px solid #000;
	width: 18.27%;
	padding-bottom: 18px;
}

.high-line {
	border: 1px solid #eaeaea;
	display: block;
	width: 100%;
}

.login-img {
	margin-top: 7%;
	width: 8.5%;
	transition-duration: 2s;
}

.login-img {
	animation: login 2s 1 forwards;
}

@
keyframes login { 0%{
	transform: rotate(0deg);
}

100






%
{
transform






:






rotate




(






360deg

)




;
}
}
.write1 {
	margin-top: 2%;
	font-size: 17px;
}

.write1-span {
	font-weight: bold;
}

.write2 {
	color: rgb(133, 133, 133);
	margin-top: 3%;
	font-size: 13px;
}

.span-line {
	border-bottom: 1px solid #eaeaea;
	margin: 0 auto;
	display: block;
	width: 70%;
	margin-top: 3%;
}

.login {
	display: inline-block;
	background-color: #383838;
	color: #fff;
	padding: 10px;
	width: 20%;
	margin-top: 3%;
	margin-left: 5px;
}

.home {
	display: inline-block;
	border: 1px solid #eaeaea;
	color: #000;
	padding: 10px;
	width: 20%;
	margin-right: 5px;
}
</style>

</head>

<body>

	<div class="menu-item">
		<!-- 메뉴는 이거랑 css 같이 다니게 복붙해주세요 -김봉근- -->
		<jsp:include page="common/top.jsp" flush="true"></jsp:include>
		<jsp:include page="common/menu.jsp" flush="true"></jsp:include>
	</div>
	<div class="wide"></div>
	<div class="main-container">
		<h1 class="main-write">회원가입</h1>
		<span class="high-line"></span>
		<div class="main-box">
			<!--  <img src="loginimg2.png" alt="로그인이미지" class="login-img"> -->
			<p class="write1">
				회원가입이 <span class="write1-span">완료</span> 되었습니다.
			</p>
			<p class="write2">
				<span class="write2-span" id="name"></span>님의 회원가입을 축하합니다.<br>알차고
				실속있는 서비스로 찾아뵙겠습니다.
			</p>
			<span class="span-line"></span> <a href="#" class="home">홈으로</a> <a
				href="LoginUIservlet" class="login">로그인</a>
		</div>
	</div>
	<%
	String mesg = (String) session.getAttribute("mesg");
	if (mesg != null) {
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$("#name").text(
"<%=mesg%>");
	</script>
	<%
	session.removeAttribute("mesg");
	}
	%>
</body>
</html>