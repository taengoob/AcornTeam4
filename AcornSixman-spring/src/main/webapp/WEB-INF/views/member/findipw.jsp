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
	font-size: 30px;
	width: 45%; 
	margin-top : 15%;
	border-bottom: 4px solid #000;
	padding-bottom: 18px;
	margin-top: 15%;
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

.email-result, .name-result {
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
	width: 50%;
}
</style>

</head>

<body>
	<div class="main-container">

		<h1 class="main-write">이메일로 비밀번호 변경</h1>
		<span class="high-line"></span>
		<div class="main-box">
			<form action="FindUserpw" method="post" id="mainform">
				<br>
				<div class="login-input">
					<div class="mb-3">
						<input type="text" class="form-control" id="name" name="accountId"
							placeholder="아이디를 입력하세요"> <span class="name-result"></span>
					</div>
					 <br> <br>
					<input type="text" class="form-control" name="accountEmailId" id="email01"
						placeholder="이메일을 입력하세요" style="width: 30%; display: inline;">
					<span class="input-group-text" style="width: 6%; display: inline;">@</span>
					<input type="text" name="accountEmailDomain" id="email02" class="form-control"
						style="width: 30%; display: inline;">&nbsp;&nbsp; <select
						id="sel" class="form-select" aria-label="Default select example"
						style="width: 22%; display: inline; cursor: pointer;">
						<option value="self" selected="selected"
							style="display: inline-block;">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select><span class="email-result"></span>
				</div>
				<br>

				<button type="submit" class="btn btn-outline-primary" id="submit">사용자
					확인</button>
				<br> <br> <span class="span-line"></span>
				<div class="menu-link">
					<a href="/" class="btn btn-outline-success">홈으로</a>
				
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
		$("#sel").change(function() {
			var sel = $(this).val();
			if (sel == "self") {
				$("#email02").val("");
				$("#email02").attr("readonly", false);

			} else {
				$("#email02").val(sel);
				$("#email02").attr("readonly", true);
				console.log($("#email02").val());
			}

		});
		$("#submit").click(function() {
			var name = $("#name").val();
			var email = $("#email01").val();
			var email2 = $("#email02").val();
			if (name.length == 0) {
				event.preventDefault();
				$(".name-result").text("아이디 부분이 비어있습니다.");
				$(".email-result").text("");
			} else if (email.length == 0 || email2.length == 0) {
				event.preventDefault();
				$(".name-result").text("");
				$(".email-result").text("이메일 부분이 비어있습니다.");
			}
		})
	</script>


</body>
</html>
