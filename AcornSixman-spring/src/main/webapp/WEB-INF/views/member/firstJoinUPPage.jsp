<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class="main-container">
	
		<a href="MainJoinUp" class="main-link-item">쇼핑몰 회원가입</a>
		<p class="main-line"></p>
		<p class="naver-login">
			<span class="naver-box"><img src="static/img/nav.png"
				alt="네이버" class="naver-img"></span><span class="naver-item">네이버
				아이디 회원가입</span>
		</p>
		<p class="kakao-login">
			<span class="kakao-box"> <img src="static/img/kka.png"
				alt="카카오" class="kakao-img"></span><span class="kakao-item" onclick="location.href='javascript:loginWithKakao();'"
				id="kakao">카카오로 1초만에 로그인하기</span>
		</p>
		<p class="last-write">
			SNS계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다.<br> 이 과정에서 고객님의 데이터는 철저하게
			보호됩니다.
		</p>

	</div>
	<p class="finally">
		이미 회원이세요? <a href="LoginUI" class="finally-login">로그인</a>
	</p>
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
						location.href='kakaologin?email='+ email +'&name='+name;
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
		<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
		
			var naver_id_login = new naver_id_login("Cd7pBzZFkenqQfTi0_AL", "http://www.acornsixman.ga/Sixman-Spring/navercollback");
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("green",4,55);
			naver_id_login.setDomain("http://www.acornsixman.ga/Sixman-Spring/LoginUI");
			naver_id_login.setState(state);
			naver_id_login.setPopup();
			naver_id_login.init_naver_id_login();
		</script>
	
</body>
</html>