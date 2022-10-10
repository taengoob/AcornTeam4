<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("Cd7pBzZFkenqQfTi0_AL", "http://127.0.0.1:8087/navercollback");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  var email = naver_id_login.getProfileData('email');
		var name =  naver_id_login.getProfileData('name');
	  $.ajax({
			url:"../kakaologin",
			type:"post",
			dataType:"text",
			data:{
				email: email,
				name : name
		
			},
			success: function(data, status, xhr) {
				
				window.opener.location.href='../';
				window.close();
				    
			},
			error: function(xhr, status, error) {
				console.log(error);
			}			
		});//end ajax
	   
	};//ddd
  
</script>
