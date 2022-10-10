<%@page import="com.acorn.sixman.dto.MemberDTO"%>
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

.phone-result, .name-result {
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
</style>

</head>

<body>
	<div class="main-container">

		<h1 class="main-write">아이디찾기</h1>
		<span class="high-line"></span>
		<div class="main-box">
			<form action="FindPhone" method="post" id="mainform">
				<br>
				<div class="login-input">
					<input type="text" class="form-control" style="width: 40%;"
						id="name" name="accountName" placeholder="이름">&nbsp;&nbsp; <span
						class="name-result"></span>

					<section class="call-number-container">
						<p class="number-item1">
							<span class="xi-checkbox-blank"></span> 휴대폰번호
						</p>
						<input type="text" placeholder="- 없이 입력하세요." data-pattern="gdNum"
							style="width: 40%;" class="form-control" id="phoneNumber"
							name="accountPhone" onkeyup="checkNumber(event)">

					</section>
					<span class="phone-result"></span>
				</div>
				<br>

				<button type="submit" class="btn btn-outline-primary" id="submit">아이디
					찾기</button>
				<br> <br> <span class="span-line"></span>
				<div class="menu-link">
					<a href="/" class="btn btn-outline-success">홈으로</a>
					&nbsp;&nbsp;&nbsp;&nbsp;<a href="/LoginUI"
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
			var name = $("#name").val();
			var phone = $("#phoneNumber").val();
			if (name.length == 0) {
				event.preventDefault();
				$(".name-result").text("이름 부분이 비어있습니다.");
				$(".phone-result").text("");
			} else if (phone.length == 0) {
				event.preventDefault();
				$(".name-result").text("");
				$(".phone-result").text("휴대폰 번호 부분이 비어있습니다.");
			}
		})
		function checkNumber(event) {
			var phoneNum = document.getElementById("phoneNumber").value;
			if (event.key >= 0 && event.key <= 9 || event.keyCode == 8
					|| event.keyCode == 9 || event.keyCode == 13) {
				return true;
			} else {
				alert("숫자만 입력해야 합니다.");
				phoneNumber.value = null;
				return false;
			}
		}
	</script>


</body>
</html>
