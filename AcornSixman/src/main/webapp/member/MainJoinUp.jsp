<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="Maincss/MainJoinUp.css">



<title>로그인</title>

<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<p class="high"></p>


	<h1 class="gibon-item1">기본정보</h1>
	<p class="gibon-item2">
		<span class="xi-checkbox-blank"></span> 표시는 반드시 입력하셔야 하는 항목입니다.
	</p>
	<form action="../MemberAddServlet" method="get">
		<section class="id-container">
			<p class="form-item">
				<span class="xi-checkbox-blank"></span> 아이디
			</p>
			<input type="text" id="id" name="id">&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="idCheck" name="idCheck" type="button">아이디 중복 확인</button>
			&nbsp;&nbsp;&nbsp;&nbsp; <span id="checkResult"></span>
			&nbsp;&nbsp;&nbsp;&nbsp; <input type="hidden" id="idc" name="idc">
			<input type="radio" value="사용자" id="consumer" name="sel">사용자
			&nbsp;&nbsp; <input type="radio" value="판매자" id="seller" name="sel">판매자
			<input type="hidden" id="seller_YN" name="seller_YN">

		</section>
		<section class="password-container">
			<p class="form-item">
				<span class="xi-checkbox-blank"></span> 비밀번호
			</p>
			<input type="password" id="passwd" name="passwd">
		</section>
		<section class="password-good-container">
			<p class="form-item">
				<span class="xi-checkbox-blank"></span> 비밀번호 확인
			</p>
			<input type="password" id="passwd1" name="passwd1"> <span
				id='result'></span>
		</section>
		<section class="name-container">
			<p class="form-item">
				<span class="xi-checkbox-blank"></span> 이름
			</p>
			<input type="text" id="name" name="name">
		</section>
		<section class="email-container">
			<p class="email-name">
				<span class="xi-checkbox-blank"></span> 이메일
			</p>
			<input type="text" name="email01" id="email01"
				placeholder="이메일을 입력하세요">&nbsp;&nbsp; @
				<input type="text" name="email02" id="email02"> <select id="sel">
				<option value="self" selected="selected">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>
			</select>
		</section>
		<section class="call-number-container">
			<p class="number-item1">
				<span class="xi-checkbox-blank"></span> 휴대폰번호
			</p>
			<input type="text" placeholder="- 없이 입력하세요." data-pattern="gdNum"
				id="phoneNumber" name="phoneNumber" onkeyup="checkNumber(event)">

		</section>
		<section class="addr-container">
			<p class="number-item3">
				<span class="xi-checkbox-blank"></span> 주소
			</p>
			<input type="text" name="post" id="sample4_postcode"
				placeholder="우편번호"> <input type="button" 
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기" > <br> <input type="text" name="addr1"
				id="sample4_roadAddress" placeholder="도로명주소"> <input
				type="text" name="addr2" id="sample4_jibunAddress"
				placeholder="지번주소"> <span id="guide" style="color: #999">
			</span>
		</section>
		<span class="addr-bottom-line"></span>

		<div class="finish">
			<a href="../FirstJoinUpPage.html" id="cancle">취소</a> <input
				type="submit" id="finishuser" value="회원가입">
		</div>
	</form>
	<p class="row"></p>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">

		$(document).ready(
				function() {
					$("#consumer").click(function() {
						$("#seller_YN").val("False");
						console.log($("#seller_YN").val());
					});
					$("#seller").click(function() {
						$("#seller_YN").val("True");
						console.log($("#seller_YN").val());
					});

					$("#passwd1").keyup(function() {
						var pw1 = $("#passwd").val();
						var pw2 = $("#passwd1").val();
						if (pw1 == pw2) {
							$("#result").text("비밀번호 일치");
						} else {
							$("#result").text("비밀번호 불일치");
						}
					});//비밀번호 확인
					$("#finishuser").click(
							function() {
								var id = $("#id").val();
								var pw = $("#passwd").val();
								var pw1 = $("#passwd1").val();
								var name = $("#name").val();
								var email = $("#email01").val();
								var email2 = $("#email02").val();
								var phoneNum = $("#phoneNumber").val();
								var seller_YN = $("#seller_YN").val();
								var post = $("#sample4_postcode").val();
								var addr1 = $("#sample4_roadAddress").val();
								var addr2 = $("#sample4_jibunAddress").val();
								var idcheck = $("#checkResult").text();
								var idc = $("#idc").val();
								if (id.length == 0) {
									event.preventDefault();
									alert("아이디 부분이 비어있습니다.");
								} else if (pw.length == 0) {
									alert("비밀번호 부분이 비어있습니다.");
									event.preventDefault();
								} else if (pw1.length == 0) {
									alert("비밀번호 확인 부분이 비어있습니다");
									event.preventDefault();
								} else if (name.length == 0) {
									alert("이름 부분이 비어있습니다.");
									event.preventDefault();
								} else if (email.length == 0
										|| email2.length == 0) {
									alert("이메일 부분이 비어있습니다.");
									event.preventDefault();
								} else if (phoneNum.length == 0) {
									alert("전화번호 부분이 비어있습니다.");
									event.preventDefault();
								} else if (seller_YN.length == 0) {
									alert("사용자 및 판매자 여부를 체크하지 않았습니다.");
									event.preventDefault();
								} else if (post.length == 0
										|| addr1.length == 0
										|| addr2.length == 0) {
									alert("주소 부분이 비어있습니다.");
									event.preventDefault();
								} else if (idc == "1") {
									alert("중복된 아이디 입니다.");
									event.preventDefault();
								} else if (idc == "") {
									alert("아이디 중복체크를 눌러주세요");
									event.preventDefault();
								}
							})//비어있는 부분이 있는지 확인

				})
	/* 	 	function change(n) {
				// 선택하는거 아이디 ("selectemail") 출력부분 아이디("email02")
				var selectemail = document.getElementById("sel");
				var email02 = document.getElementById("email02");
				if (n == "self") {
					email02.value = "";
					email02.disabled = false;
				} else {
					email02.value = n;
					email02.disabled = true;
				}

			}   */

			$("#sel").change(function() {
				var sel = $(this).val();
				if (sel == "self") {
					$("#email02").val("");
					$("#email02").attr("readonly", false);
					
				}else {
					$("#email02").val(sel);
					$("#email02").attr("readonly", true);
					console.log($("#email02").val());
				}

			}); 
			
		function checkNumber(event) {
			var phoneNum = document.getElementById("phoneNumber").value;
			if (event.key >= 0 && event.key <= 9 || event.keyCode == 8) {
				return true;
			} else {
				alert("숫자만 입력해야 합니다.");
				phoneNumber.value = null;
				return false;
			}
		}
		$("#idCheck").on("click", function(event) {
			$.ajax({
				type : "GET",
				url : "../MemberIdCheckServlet",
				dataType : "text",//응답 데이터 타입
				data : { //서버에 넘겨줄 데이터 
					userid : $("#id").val()
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					if ($("#id").val().length == 0) {
						$("#id").attr("placeholder", "아이디를 입력하세요.")
						$("#checkResult").text("");
						event.preventDefault()

					} else if (responseData == "아이디 중복") {

						$("#idc").val("1");
						$("#checkResult").text(responseData);
						console.log($("#idc").val());
					} else {
						$("#idc").val("0");
						$("#checkResult").text(responseData);
						console.log($("#idc").val());
					}
					;
				},
				error : function(xhr, status, error) {
					console.log("eeeerror");
				}
			});
		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>

</body>
</html>
