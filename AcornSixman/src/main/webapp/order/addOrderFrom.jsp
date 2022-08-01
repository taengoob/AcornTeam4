<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!--     	<link rel="stylesheet" href="orderFrom.css"> -->
<!-- <link rel="stylesheet" href="order/orderFrom.css"> -->
</head>

<%
	MemberDTO userInfo = (MemberDTO)session.getAttribute("login");
	
// 	List<OrderDTO> orderList = (List<OrderDTO>)request.getAttribute("orderList");
// 	int orderCount = orderList.size();
	
// 	int sumAll = 0;
// 	for(OrderDTO order : orderList)
// 	{
// 		sumAll += order.getOrderPaymentPrice();
// 	}
	String jsonStr = request.getParameter("jsonStr");
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	%>

<body>
	<script type="text/javascript">
		
			window.onload = function() {
				const form = document.getElementById("orderForm");
				form.onsubmit = onOrderFormSubmit;
				console.log("addOrderForm loaded");
				console.log(form);
			}
			
			function onOrderFormSubmit() {
				console.log("onOrderFormSubmit()");
				//event.preventDefault();
				const orderList = JSON.parse('<%= jsonStr %>');
				//주문 개수가 없으면
				if (orderList.length < 1)
					return false;
				
				const tempUserId = "<%= userInfo == null ? null : userInfo.getAccountId() %>";
				const userId = tempUserId === "null" ? "taengoov" : tempUserId;
				
				for (var i = 0; i < orderList.length; i++) {
					orderList[i].userId = userId;
				}
				
				const orderListJsonStr = JSON.stringify(orderList);
				console.log(orderListJsonStr);
				document.getElementById("hiddenInput").value = orderListJsonStr;
				return true;
			}
			
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
			
		</script>

	<h1 class="gibon-item1">배송정보</h1>
	<p class="gibon-item2">
		<span class="xi-checkbox-blank"></span> 표시는 반드시 입력하셔야 하는 항목입니다.
	</p>
	<br>
	<form action="AddOrderServlet" method="get" id="orderForm">
		<input id="hiddenInput" name="jsonStr" value="" type="hidden">
		<section class="password-container">
			<p class="form-item">결제금액</p>
			<p
				style="margin-top: 1%; margin-left: 1%; width: 15%; display: inline-block;"><%= totalPrice %>원
			</p>
		</section>
		<section class="name-container">
			<p class="form-item">
				<span class="xi-checkbox-blank"></span> 받는사람
			</p>
			<input type="text" id="name" name="name">
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
				placeholder="우편번호">&nbsp;&nbsp; <input type="button"
				style="padding: 6px;" onclick="sample4_execDaumPostcode()"
				value="우편번호 찾기" id="idCheck2" name="idCheck2"> <br> <input
				type="text" name="addr1" id="sample4_roadAddress"
				placeholder="도로명주소"> <input type="text" name="addr2"
				id="sample4_jibunAddress" placeholder="지번주소"> <span
				id="guide" style="color: #999"></span>
		</section>
		<span class="addr-bottom-line"></span>

		<div class="finish">
			<a href="" id="cancle">취소</a> <input type="submit" id="finishuser"
				value="주문결제">
		</div>
	</form>
	<p class="row"></p>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script> <!-- 주소 팝업 -->
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