<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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

form {
	text-align: center;
	margin-top: 5%;
}

.btn-primary {
	font-size: 14px;
	width: 17%;
	line-height: 40px;
	margin-top: 1.5%;
}

a {
	color: grey;
	text-decoration: none;
}

.input-style {
	margin-left: 41.5%;
}
</style>

</head>


<body>
	<p class="main-img"></p>
	<form action="loginServlet" method="post" id="mainform">
		<p class="main-name">The SixMan</p>
		<div class="input-style">
			<input type="text" placeholder="아이디" id="userid" name="userid"
				class="form-control" style="width: 29%"> <input
				type="password" placeholder="비밀번호" id="passwd" name="passwd"
				class="form-control" style="width: 29%">
		</div>
		<button class="btn btn-primary" type="submit" id="submit">로그인</button>
		<div class="iph">
			<a href="MainJoinUpServlet" class="heiwon">회원가입</a> <a
				href="FirstFindID.jsp" class="id" id="find-id">아이디 찾기</a> <a
				class="ll">|</a> <a href="FirstFindPW.jsp" class="password"
				id="find-pw">비밀번호 찾기</a>
		</div>
		<a href="javascript:loginWithKakao();" class="kakao">카카오로 1초만에 로그인하기<img
			src="member/img/kka.png" alt="카카오" class="kakao-img">
		</a> <a href="#" class="naver">네이버로 1초만에 로그인하기<img src="member/img/nav.png"
			alt="네이버" class="naver-img">
		</a>
	</form>
	<%
	String mesg2 = (String) session.getAttribute("nologin");
	if (mesg2 != null){
	%>
	<script type="text/javascript">
	alert("로그인 정보를 다시 확인해주세요.");
	</script>
	<%
	}
	session.removeAttribute("nologin");
	%>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	Kakao.init('12991a69612ed8393fdc0e713c736af9');
    console.log(Kakao.isInitialized());
	  function loginWithKakao() {
		    Kakao.Auth.login({
		      success: function(authObj) {
		    	  
		    	  Kakao.API.request({
		    		url:'/v2/user/me',
		    		success: function (res) {
						console.log(res);
						var email = res.kakao_account.email;
						var name = res.properties.nickname;
						location.href='kakaologinServlet?email='+ email +'&name='+name;
					}
		    	 }) 
		        console.log(authObj)
		      },
		      fail: function(err) {
		        alert(JSON.stringify(err))
		      },
		    })
		  }
		</script>


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
	<%
	request.setCharacterEncoding("utf-8");
	String mesg1 = (String) session.getAttribute("userid");
	
	%>
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
			<%if (mesg1 != null) {%>
			console.log($("#userid").val());
			$("#userid").val("<%=mesg1%>");
			console.log($("#userid").val());
	<%session.removeAttribute("userid");
} ;%>
		};

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


</body>
</html>