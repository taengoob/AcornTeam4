<%@page import="com.dto.MemberDTO"%>
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
	text-align: left;
	overflow: hidden;
	height: 300px;
	margin-top: 3%;
}

.main-write {
	margin-top: 15%;
	border-bottom: 4px solid #000;
	width: 22.27%;
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

/* .btn-form {
    float: right;
    width: 158px;
    height: 91px;
    margin: 15px 0 0 0;
    color: #ffffff;
    font-size: 15px;
    font-weight: bold;
    border: 1px solid #3e3d3c;
    background: #3e3d3c;
    cursor: pointer;
} */
</style>

</head>

<body>
	<div class="main-container">

		<h1 class="main-write">아이디찾기</h1>
		<span class="high-line"></span>
		<div class="main-box">
			<form action="FindUseridServlet" method="post" id="mainform">
				<div class="main-id">회원아이디 찾기</div>
				<br> <input type="radio" name="findid" id="email"
					checked="checked">이메일 <input type="radio" name="findid"
					id="phone">휴대폰번호*수정예정* <br>
				<div class="login-input">
					<input type="text" id="name" name="name" placeholder="이름"><br>
					<input type="text" name="email01" id="email01"
						placeholder="이메일을 입력하세요">&nbsp;&nbsp; @ <input type="text"
						name="email02" id="email02"> <select id="sel">
						<option value="self" selected="selected"
							style="display: inline-block;">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
				<button type="submit" class="btn-form">아이디 찾기</button>
				<br> <span class="span-line"></span> <a href="#" class="home">홈으로</a>
				<a href="LoginUIservlet" class="login">로그인</a>
			</form>
		</div>
	</div>



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
	</script>

</body>
</html>
