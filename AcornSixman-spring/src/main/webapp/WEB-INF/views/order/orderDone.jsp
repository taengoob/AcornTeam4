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

	String recvName = (String)request.getAttribute("name");
	String recvAddrRoad = (String)request.getAttribute("addr1");
	String recvAddrNumber = (String)request.getAttribute("addr2");
	String recvPhone = (String)request.getAttribute("phoneNumber");
	String payMethod = (String)request.getAttribute("payMethodDesc");
	
//	오더 정보 List의 json 포맷

//		const order = {
//			cartId : ""
//			,productId : productId
//			,amount : parseInt(qty)
//		}
// 	위와 같은 형식의 객체 정보임
%>

<script>

</script>



	<table width="80%" cellspacing="0" cellpadding="0">
		<tr><td height="30"></tr>

		<tr><td><h3><b>주문완료</b></h3></td></tr>

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
								maxlength="20" value="<%= userName %>" readonly></input>
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
								maxlength="15" value="<%= phone %>" readonly></input>
							
						</td>
					</tr>
				</table>							
			</td>
		</tr>
<!--  고객 정보 끝-->
		
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
								name="name" size="20" maxlength="20" value="<%= recvName %>" readonly></input>
						</td>
					</tr>
					<tr>
						<td height="35" class="td_default">
							
							주소
						</td>
						<td height="35" class="td_default">
						<!-- 다음주소 시작-->
							<input type="text" name="addr1" size="35" maxlength="200" value="<%= recvAddrRoad %>" readonly><br>
							<input type="text" name="addr2" size="35" maxlength="200" value="<%= recvAddrNumber %>" readonly>
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
								name="phoneNumber" size="15" maxlength="15" value="<%= recvPhone %>" readonly></input>
						
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
							<%= payMethod %>
						</td>
						
					</tr>
					
				</table>							
			</td>
		</tr>
		
		<tr><td height="30"></tr>
	
		<tr>
			<td class="td_default" align="center">
				<a href="MyPage"><button >마이페이지로</button></a>
				<a href="cartList"><button >장바구니로</button></a>
			</td>
		</tr>
	</table>
