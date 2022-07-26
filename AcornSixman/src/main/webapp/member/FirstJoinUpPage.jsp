<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="Maincss/FirstJoinUp.css" rel="stylesheet" type="text/css" />


<title>회원가입</title>

</head>


<body>
	<div class="main-container">
		<a href="MainJoinUp.jsp" class="main-link-item">쇼핑몰 회원가입</a>
		<p class="main-line"></p>
		<p class="naver-login">
			<span class="naver-box"><img src="img/nav.png" alt="네이버"
				class="naver-img"></span><span class="naver-item">네이버 아이디 회원가입</span>
		</p>
		<p class="kakao-login">
			<span class="kakao-box"> <img src="img/kka.png" alt="카카오"
				class="kakao-img"></span><span class="kakao-item" id="kakao">카카오
				아이디 회원가입</span>
		</p>
		<p class="last-write">
			SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다.<br> 이 과정에서 고객님의 데이터는 철저하게
			보호됩니다.
		</p>

	</div>
	<p class="finally">
		이미 회원이세요? <a href="../Login/MainLogin.html" class="finally-login">로그인</a>
	</p>
<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"
		type="text/javascript">
//12991a69612ed8393fdc0e713c736af9
/* $("#kakao").click(function () {
	window.init("12991a69612ed8393fdc0e713c736af9");
	window.Kakao.Auth.login({
		scope:'profile, account_email, gender',
		success: function (authObj) {
			window.Kakao.API.request({
				url : '/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				
			}
		});
	}
});
}); */


</script> -->
</body>
</html>