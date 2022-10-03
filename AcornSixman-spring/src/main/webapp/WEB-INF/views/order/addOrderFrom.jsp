<%@page import="com.acorn.sixman.dto.PayMethodDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.acorn.sixman.dto.ProductDTO_Temp"%>
<%@page import="com.acorn.sixman.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	로그인 되어 있는 유저 정보
	MemberDTO userInfo = (MemberDTO)session.getAttribute("login");
	String userName = userInfo.getAccountName();
	String addrN = userInfo.getAccountAddressNumber();
	String addrR = userInfo.getAccountAddressLoad();
	String phone = userInfo.getAccountPhone();

// 	주문 대상 제품 정보
	List<ProductDTO_Temp> orderInfoList = (List<ProductDTO_Temp>)request.getAttribute("orderInfoList");

//	결제 수단 	정보
	List<PayMethodDTO> payMethodList = (List<PayMethodDTO>)request.getAttribute("payMethodList");
	
//	오더 정보 List의 json 포맷

//		const order = {
//			cartId : ""
//			,productId : productId
//			,amount : parseInt(qty)
//		}
// 	위와 같은 형식의 객체 정보임
	String jsonStr = request.getParameter("jsonStr");
	
%>

<script>

	window.onload = function () {
		document.getElementById("checkBoxSame").onclick = onCheckBoxSameClicked;
// 		document.getElementById("myForm").onsubmit =
	}

	function onSumbitClicked() 
	{
		document.getElementById("hiddenInput").value = '<%= jsonStr %>';
		return true;
	};
	
	function onCheckBoxSameClicked() {
		if (this.checked)
		{
			document.getElementById("recvName").value = "<%= userName %>";
			document.getElementById("sample4_roadAddress").value = "<%= addrR %>";
			document.getElementById("sample4_jibunAddress").value = "<%= addrN %>";
			document.getElementById("recvPhone").value = "<%= phone %>";
		}
		else
		{
			document.getElementById("recvName").value = "";
			document.getElementById("sample4_roadAddress").value = "";
			document.getElementById("sample4_jibunAddress").value = "";
			document.getElementById("recvPhone").value = "";
		}
	}
	
</script>


<form name="myForm" method="get" action="AddOrderServlet" onsubmit="onSumbitClicked()">
	<input id="hiddenInput" name="jsonStr" value="" type="hidden">
	
	<table width="80%" cellspacing="0" cellpadding="0">
		<tr><td height="30"></tr>

		<tr><td><h3><b>주문상품 확인</b></h3></td></tr>

<!-- 		<tr><td height="15"></tr> -->

		<tr><td><hr size="1" color="CCCCCC"></td></tr>

		<tr><td height="5"></tr>

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="3px" style="text-align: center;">
					<tr>
						<th class="td_default" align="center" width="10%" colspan="1"><strong></strong></th>
						<th class="td_default" align="center" width="20%" colspan="2"><strong>상품정보</strong></th>
						<th class="td_default" align="center" width="10%" colspan="1"><strong>판매가</strong></th>
						<th class="td_default" align="center" width="10%" colspan="1"><strong>수량</strong></th>
						<th class="td_default" align="center" width="10%" colspan="1"><strong>배송비</strong></th>
						<th class="td_default" align="center" width="20%" colspan="2"><strong>결제금액</strong></th>
					</tr>

					<tr>
						<td colspan="10"><hr size="1" color="CCCCCC"></td>
					</tr>

					<tr>
					<%
					int priceSum = 0;
					for(ProductDTO_Temp orderInfo : orderInfoList)
					{
						String image = orderInfo.getPreviewUrl();
						String pName = orderInfo.getProductName();
						String pContent = orderInfo.getProductContent();
						int pPrice = orderInfo.getProductPrice();
						int pAmount = orderInfo.getOrderAmount();
						int pDelivery = orderInfo.getProductDeliveryPrice();
						int payment = (pPrice * pAmount) + pDelivery;
						priceSum += payment;
					%>
					
						<td class="td_default" colspan="1" >
							
							<img src="<%= image %>" border="0" width="80" />
						</td>
						<td class="td_default" colspan="2" align="left" >
							<%= pName %>
							<br>
							<font size="2" color="#665b5f">
								<%= pContent %>
							</font>
						</td>
						<td class="td_default" align="center">
							<%= pPrice %>
						</td>
						<td class="td_default" align="center">
							<%= pAmount %>
						</td>
						<td class="td_default" align="center">
							<%= pDelivery %>
						</td>
						<td class="td_default" align="center" colspan="2">
							<%= payment %>
						</td>
					</tr>
					<%
					}
					%>
					<tr>
						<td colspan="10"><hr size="1" color="CCCCCC"></td>
					</tr>
					
					<tr>
						<td class="td_default" colspan="7" align="right">총 결제 금액 :</td>
						<td class="td_default" colspan="8" align='right'><%= priceSum %>원</td>
					</tr>
				</table>
			</td>
		</tr><!--  고객 정보 시작-->
		
		<tr>
			<td ><hr size="1" color="CCCCCC"></td>
		</tr>
		
		<tr><td height="30"></tr>

		<tr><td><h3><b>고객 정보</b></h3></td></tr>

<!-- 		<tr><td height="15"></td></tr> -->

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							
							이 름
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="mname" size="20"
								maxlength="20" value="<%= userName %>"></input>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td height="35" class="td_default"> -->
							
<!-- 							우편번호 -->
<!-- 						</td> -->
<!-- 						<td height="35" class="td_default"> -->
<!-- 							<input class="input_default" type="text" id="mpost" size="6" -->
<!-- 								maxlength="6" value="" readonly> -->
							
<!-- 						</td> -->
<!-- 					</tr> -->
					<tr>
						<td height="35" class="td_default">
							
							주 소
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="maddress1" size="35"
								maxlength="200" value="<%= addrR %>" readonly></input><br>
							<input class="input_default" type="text" id="maddress2" size="35"
								maxlength="200" value="<%= addrN %>" readonly></input>
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							휴대전화
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="mphone" size="15"
								maxlength="15" value="<%= phone %>"></input>
							
						</td>
					</tr>
				</table>							
			</td>
		</tr>
<!--  고객 정보 끝-->
		<tr><td height="30"></td></tr>

		<tr> 
			<td class="td_default">
				 <input type="checkbox" name="same" id="checkBoxSame"> 배송지가 동일할 경우 선택하세요.
			</td>
		</tr>
<!--  배송지 정보 시작-->
		<tr><td height="30"></td></tr>

		<tr><td><h3><b>배송지 정보</b></h3></td></tr>
	
<!-- 		<tr><td height="15"></tr> -->

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							
							이 름
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="recvName"
								name="name" size="20" maxlength="20" value=""></input>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">
							
							주소
						</td>
						<td height="35" class="td_default">
						<!-- 다음주소 시작-->
							<input type="hidden" name="post" id="sample4_postcode" placeholder="우편번호" >
							<input type="text" name="addr1" size="35" maxlength="200" id="sample4_roadAddress" placeholder="도로명주소">
							<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
							<input type="text" name="addr2" size="35" maxlength="200" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999"></span>
							<br>
						<!-- 다음주소 끝 -->
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							
							휴대전화
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="recvPhone"
								name="phoneNumber" size="15" maxlength="15" value=""></input>
						
						</td>
					</tr>
				</table>							
			</td>
		</tr>
<!--  배송지 정보 끝-->

		<tr>
			<td height="40">
		
			</tr>
		<tr>
			<td><h3><b>결제수단</b></h3></td>
		</tr>
	
<!-- 		<tr> -->
<!-- 			<td height="15"> -->
		
<!-- 			</tr> -->
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
						<%
						for (int i = 0; i < payMethodList.size(); i++)
						{
							PayMethodDTO payMethod = payMethodList.get(i);
							String code = payMethod.getPayMethodId();
							String desc = payMethod.getPayMethodDesc();
							
						%>
							<input type="radio" name="payMethodDesc" value="<%= desc %>"
						<%	if (i == 0) { %>checked <% } %> ><%= desc %>
						<%
						}
						%>	
						</td>
						
					</tr>
					
				</table>							
			</td>
		</tr>
		
		<tr>
			<td height="30">
		
			</tr>
	
		<tr>
			<td class="td_default" align="center">
				<input type='button' value='취소' onclick="javascript:history.back()">	
				<input type='submit' value='결제하기'>
			</td>
		</tr>
	</table>
</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>