<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>index</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	color: grey;
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
	text-align: left;
	overflow: hidden;
	height: 380px;
	margin-top: 3%;
}

.main-write {
	margin-top: 15%;
	border-bottom: 4px solid #000;
	width: 30%;
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

.badge bg-success:hover {
	color: white;
}

.passwd1-result, .passwd2-result {
	font-size: 12px;
	color: blue;
}

#submit {
	margin-left: 3.5%;
}

.menu-link {
	text-align: right;
	margin-right: 5.5%;
}

.form-control {
	margin-left: 5%;
	width: 50%;
}
</style>
<%
String dto = (String) session.getAttribute("useridpw");
%>
</head>

<body>
	<div class="main-container">

		<h1 class="main-write">비밀번호변경</h1>
		<span class="high-line"></span>
		<div class="main-box">
			<form action="ChangePasswd" method="post" id="mainform">

				<br>
				<div class="login-input">
					<div class="mb-3">
					<input type="hidden" id="userid" name="userid" value="<%=dto%>">
						<input type="password" class="form-control" id="passwd1"
							name="passwd1" placeholder="새 비밀번호"> <span
							class="passwd1-result"></span>
					</div>
					&nbsp;&nbsp; <span class="name-result"></span> <br> <input
						type="password" class="form-control" name="passwd2" id="passwd2"
						placeholder="비밀번호 확인"> <br> <span
						class="passwd2-result"></span>
				</div>
				<br>

				<button type="submit" class="btn btn-outline-primary" id="submit">
				비밀번호 변경</button>
				<br> <br> <span class="span-line"></span>
				<div class="menu-link">
					<a href="Mainservlet" class="btn btn-outline-success">홈으로</a>
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="LoginUIservlet"
						class="btn btn-outline-success">로그인</a>
				</div>
			</form>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$("#submit").click(function() {
			var pw1 = $("#passwd1").val();
			var pw2 = $("#passwd2").val();

			if (pw1.length == 0) {
				event.preventDefault();
				$(".passwd1-result").text("이름 부분이 비어있습니다.");
				$(".passwd2-result").text("");
			} else if (email.length == 0 || email2.length == 0) {
				event.preventDefault();
				$(".passwd2-result").text("");
				$(".passwd1-result").text("이메일 부분이 비어있습니다.");
			}
		})
		$("#passwd2").keyup(function() {
			var pw1 = $("#passwd1").val();
			var pw2 = $("#passwd2").val();
			if (pw1 == pw2) {
				$(".passwd2-result").text("비밀번호 일치");
			} else {
				$(".passwd2-result").text("비밀번호 불일치");
			}
		});//비밀번호 확인
	</script>
<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {

			//테스트 버튼
			//document.getElementById("testButton").onclick = onTestButtonCliked;

			//서브밋 예제
			document.getElementById("mainform").onsubmit = onTestButtonCliked;

		};

		//회원가입시 패스워드 암호화 해서 서버에 넘기는 예제
		//db에는 암호화 된 패스워드를 insert
		function onTestButtonCliked() {
			//입력값
			const target = document.getElementById("passwd1");
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


</body>
</html>
