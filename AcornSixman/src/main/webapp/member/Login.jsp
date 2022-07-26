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
<link href="Maincss/sample.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-latest.min.js"
	text="text/javascript"></script>
<title>로그인</title>

</head>


<body>
	<p class="main-img"></p>
	<form action="loginServlet" method="post">
		<p class="main-name">식스맨 악기#</p>

		<input type="text" placeholder="아이디" id="text-input"><br>
		<input type="password" placeholder="비밀번호" id="password-input">
		<p class="p-login">로그인</p>
		<div class="iph">
			<a href="member/FirstJoinUpPage.jsp" class="heiwon">회원가입</a> <a href="#"
				class="id">아이디 찾기</a> <a class="ll">|</a> <a href="#"
				class="password">비밀번호 찾기</a>
		</div>
		<a href="#" class="kakao">카카오 로그인 <img src="img/kka.png"
			alt="카카오" class="kakao-img">
		</a> <a href="#" class="naver">NAVER 로그인 <img src="img/nav.png"
			alt="네이버" class="naver-img">
		</a>
	</form>


</body>
</html>