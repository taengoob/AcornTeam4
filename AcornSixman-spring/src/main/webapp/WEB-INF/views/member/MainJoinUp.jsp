<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>로그인</title>
<style type="text/css">
#id {
	width: 50%;
}

.main-box {
	width: 100%;
	border: 1px solid;
	border-color: gray;
	overflow: hidden;
	width: 80%;
	margin-top: 3%;
	margin-left: 10%;
}
	
#id-con {
	background-color: #aaaaaa;
	padding: 6px;
	color: white;
}

.form-group {
	margin-top: 2.3%;
	margin-left: 7%;
}

#checkResult, #result #resultName {
	color: blue;
	font-size: 14px;
}

.addr-input {
	margin-left: 17.2%;
}	

.finish {
	text-align: right;
	margin-right: 5%;
	margin-top: 3%;
	margin-bottom: 3%;
}

#type {
	height: 30px;
	display: flex;
	align-items: center;
	/* font-family: 'Lobster', cursive; */
	font-size: 30px;
	padding: 0 2rem;
	font-weight: 600;
	justify-content: center;
	margin-top: 40px;
}
</style>
</head>
<body>
	<span id="type"></span>
	<form action="MemberAdd" class="form-inline" method="post"
		id="mainform">
		<div class="main-box">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">아이디</label>
				<input type="text" class="form-control" id="id" name="accountId"
					placeholder="" style="display: inline; width: 40%;">&nbsp;&nbsp;
				<button class="btn btn-outline-secondary" id="idCheck"
					name="idCheck" type="button" style="margin-bottom: 4.5px;">
					아이디 중복 확인</button>
				&nbsp;&nbsp; <span id="checkResult"></span> &nbsp;&nbsp; <input
					type="hidden" id="idc" name="idc"> <input type="radio"
					value="사용자" id="consumer" name="sel">사용자 &nbsp;&nbsp; <input
					type="radio" value="판매자" id="seller" name="sel">판매자 <input
					type="hidden" id="seller_YN" name="seller_YN">
			</div>

			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">비밀번호</label>
				<input type="password" id="passwd" name="accountPasswd"
					class="form-control" style="display: inline; width: 40%;">
			</div>


			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">비밀번호
					확인</label> <input type="password" id="passwd1" name="passwd1"
					class="form-control" style="display: inline; width: 40%;">
				&nbsp;&nbsp; <span id='result'></span>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">이름</label>
				<input type="text" id="name" name="accountName" class="form-control"
					placeholder="한글로 2-4자리" style="display: inline; width: 40%;">
				&nbsp;&nbsp; <span id='resultName'></span>

			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">이메일</label>
				<input type="text" name="accountEmailId" id="email01" class="form-control"
					style="display: inline; width: 20%;" placeholder="이메일을 입력하세요"><span
					class="input-group-text" style="width: 6%; display: inline;">@</span><input
					type="text" name="accountEmailDomain" id="email02" class="form-control"
					style="display: inline; width: 16.6%;">&nbsp;&nbsp;<select
					id="sel" class="form-select" style="display: inline; width: 10%;">
					<option value="self" selected="selected">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">휴대폰
					번호</label> <input type="text" data-pattern="gdNum" id="phoneNumber"
					name="accountPhone" class="form-control"
					placeholder="010으로 시작하는 11자리 숫자"
					style="display: inline; width: 40%;">

			</div>
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label" id="id-con">
					주소</label> <input type="text" name="accountAddressLoad" id="sample4_postcode"
					class="form-control" style="display: inline; width: 20%;"
					placeholder="우편번호">&nbsp;&nbsp;
				<button onclick="sample4_execDaumPostcode()" id="idCheck2"
					class="btn btn-outline-secondary" name="idCheck2" type="button"
					style="margin-bottom: 4.5px;">우편주소 찾기</button>
				<br>
				<div class="addr-input">
					<input type="text" name="accountAddressNumber" class="form-control"
						style="display: inline; width: 24.2%;" id="sample4_roadAddress"
						placeholder="도로명주소">&nbsp;&nbsp;<input type="text"
						name="addr2" id="sample4_jibunAddress" class="form-control"
						style="display: inline; width: 24.4%; margin-left: 0.5%;"
						placeholder="지번주소"> <span id="guide" style="color: #999">
					</span>
				</div>
			</div>
			<div class="finish">
				<button class="btn btn-outline-success" type="button"
					onclick="location.href='FirstJoinUpPage.jsp'" id="cancle">취소</button>
				<button class="btn btn-outline-success" type="submit"
					id="finishuser">회원가입</button>
			</div>
			<span class="addr-bottom-line"></span>
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
								var regPhone = /^010-?[0-9]{4}-?[0-9]{4}$/;
								var regName = /^[가-힣]{2,4}$/;
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
								
								else if (!regPhone.test(phoneNum)) {
									console.log('입력된 값은 휴대전화번호입니다.');
									alert("휴대폰 번호 형식이 잘못되었습니다.");
									$("#resultName").text("");
									event.preventDefault();
									
								} else if (!regName.test(name)){
									console.log('입력된 값은 이름입니다.');
									alert("이름이 올바르지 않습니다.");
									event.preventDefault();
									$("#resultName").text("이름이 올바르지 않습니다");
								}
								
								
							})//비어있는 부분이 있는지 확인

				})

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

		$("#idCheck").on("click", function(event) {
			$.ajax({
				type : "GET",
				url : "MemberIdCheck",
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
	<script src="http://threejs.org/build/three.min.js"></script>
	<script src="http://threejs.org/examples/js/controls/OrbitControls.js"></script>
	<script src="https://unpkg.com/typeit@8.7.0/dist/index.umd.js"></script>
	<script type="text/javascript">
	new TypeIt('#type', {
	  speed: 200,
	  afterStep: (instance) => {
		    instance.getElement().style.color = randomColor();
		  },
	  afterComplete: function (instance) {
	   	   instance.destroy();
	   },
	}) 
	  .type("The SixMan 기타 쇼핑몰 !!", {delay: 1000})
	  .delete(10, {pause: 1000})
	  .type(" 회원가입 하세요 !", {pause: 600})
	  .go();
	  
	  
		function randomColor() {
	  var letters = '0123456789ABCDEF';
	  var color = '#';
	  for (var i = 0; i < 6; i++) {
	    color += letters[Math.floor(Math.random() * 16)];
	  }
	  console.log(color)
	  return color;
	}
</script>
</body>
</html>
