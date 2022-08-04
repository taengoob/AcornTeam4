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
<link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo:400"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"
	text="text/javascript"></script>
<title>로그인</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

.main-name {
	font-family: 'Lobster', cursive;
	color: black;
}
</style>

</head>


<body>
	<p class="main-img"></p>
	<form action="loginServlet" method="post" id="mainform">
		<p class="main-name">The 식스맨#</p>
		<input type="text" placeholder="아이디" id="userid" name="userid"><br>
		<input type="password" placeholder="비밀번호" id="passwd" name="passwd"><br>
		<input class="p-login" type="submit" id="submit" value="로그인">
		<div class="iph">
			<a href="MainJoinUpServlet" class="heiwon">회원가입</a> <a
				href="findid.jsp" class="id" id="find-id">아이디 찾기</a> <a class="ll">|</a>
			<a href="#" class="password" id="find-pw">비밀번호 찾기</a>
		</div>
		<a href="#" class="kakao">카카오 로그인 <img src="member/img/kka.png"
			alt="카카오" class="kakao-img">
		</a> <a href="#" class="naver">NAVER 로그인 <img src="member/img/nav.png"
			alt="네이버" class="naver-img">
		</a>
	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		var childwin;
		$("#submit").click(function() {
			if ($("#userid").val().length == 0) {
				alert("아이디 필수")
				event.preventDefault()
			} else if ($("#passwd").val().length == 0) {
				alert("비밀번호 필수")
				event.preventDefault()
			}
		})
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			//테스트 버튼
			//document.getElementById("testButton").onclick = onTestButtonCliked;

			//서브밋 예제
			document.getElementById("mainform").onsubmit = onTestButtonCliked;
		}

		//회원가입시 패스워드 암호화 해서 서버에 넘기는 예제
		//db에는 암호화 된 패스워드를 insert
		function onTestButtonCliked() {
			//입력값
			const target = document.getElementById("passwd");
			console.log("target.value :", target.value);

			//암호화 시킨값
			const encryptedVal = sha256(target.value);
			console.log("encrypted");

			//input에 데이터 넣기
			target.value = encryptedVal;
			console.log("target.value :", target.value);
			console.log("encryptedVal :", encryptedVal);

			//action으로 submit
			return ture;

			//submit 중지
			//return false;
		}
	</script>
<%
request.setCharacterEncoding("utf-8");
String mesg1 = (String) session.getAttribute("userid");
if (mesg1 != null) {
%>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload = function() {
	console.log($("#userid").val());
	$("#userid").val("<%=mesg1%>");
	console.log($("#userid").val());
};
</script>
<%
session.removeAttribute("userid");
}
%>

</body>
</html>