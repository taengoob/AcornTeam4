<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.CartDTO" %>
<%@page import="com.dto.CouponDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%
	
	List<CartDTO> cartList = (List<CartDTO>)request.getAttribute("cartList");
	List<CouponDTO> couponList = (List<CouponDTO>)request.getAttribute("couponList");
%>
<style type="text/css">
	.boxtop{
		width: 100%;
		height: 30px;
		background-color: #f4f4f4;
		border-top-left-radius: 10px;
  		border-top-right-radius: 10px;
 		margin: auto;
	}
	.tabaleboxout{
		width: 100%;
		background-color: #f4f4f4;
 		margin: auto;
	}
	.tablebox{
		width: 1200px;
  		border-radius : 10px;
  		background-color: white; /* #f4f4f4; */
 		margin: auto;
 	}
 	.listtable{
		border-top: 1px solid #bcbcbc;
		width: 1100px;
		table-layout: fixed;
		margin: auto;
		background-color: white;
		border-collapse: collapse;
		/* border-radius: 10px; */
		border-style: hidden;
		box-shadow: 0 0 0 1px white;
	
	}
	.listtable tr,td{
		border-bottom: 1px solid #bcbcbc;
	    border-left: 1px solid #bcbcbc;
	    padding: 10px;
	}
	.tabletop{
		height: 50px;
	}
	.tablebot{
		height: 60px;
	}
	td{
		text-align: center;
		font-size: 12px;
	}
	.basketlist{
		height: 80px;
	}
	.selectbox{
		float: left;
		text-align: center;
		position: relative;
  		top: 18px;
  		left: 10px;
	}
 		
 		
 	/* 아래부터는 bot  */
 	
 	.bottom{
		width: 100%;
		height: 150px;
	}	
 	.totalpriceTop{
		width: 100%;
		height: 30px;
	}
	.totalpriceBox0{
		margin: auto;
		width: 800px;
		height: 100px;
	}
	.totalpriceBox0>div{
		float: left;
	}
	.totalpriceBox1{
		width: 140px;
		height: 100px;
	}
	.totalpriceBox2{
		width: 20px;
		margin-top: 30px;
		height: 50px;
	}
	.totalpriceBox3{
		width: 150px;
		height: 100px;
	}
	.totalpriceBox4{
		width: 170px;
		height: 100px;
	}
	.totalpriceCell1{
		font-size: 11px;
		font-weight: bold;
		text-align: center;
		margin-top: 15px;
	}
	.totalpriceCell2{
		font-size: 15px;
		font-weight: bold;
		text-align: center;
		margin-top: 20px;
	}
	.totalpriceCell3{
		font-size: 22px;
		font-weight: bold;
		text-align: center;
		margin-top: 30px;
		margin-left: 20px;
	}
	.totalpriceCell4{
		font-size: 22px;
		font-weight: bold;
		text-align: center;
		margin-top: 30px;
	}
	
	/* 아래부터는 결제버튼  */	
	.goPaybox{
		text-align: center;
	}
	.goPay{
		line-height : 40px;
		text-align: center;
		background-color: grey;
		width: 300px;
		height: 60px;
		color: white;
		border-radius : 5px;
		margin:auto;
        display:block;
        border: 0;
        outline: 0;
        font-size: 20px;
        font-weight: bold;
	}
	.tptable {
		width: 700px;
		height: 70px;
		border-right:none;
		border-left:none;
		border-top:none;
		border-bottom:none;
		vertical-align : top;
		margin: auto;
	}
	.tptable td{
		vertical-align : top;
	}
	.tptable .totalpricetd{
		vertical-align : middle;
		font-size: 20px;
	}
	.totalpricetr td{
		font-size : 20px;
	}
	.totalpricetr{
		font-size : 20px;
		text-align: center;
	}
	input[type=checkbox]{
		accent-color: grey;
	}
 	.boxbot{
		width: 100%;
		height: 30px;
		background-color: #f4f4f4;
		border-bottom-left-radius: 10px;
  		border-bottom-right-radius: 10px;
 		margin: auto;
	}
	.tablebot{
		height: 50px;
	}	
	
</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		$(".cartCount").on("click", function() {
			var productPrice = $(this).attr("data-yyy");
			var productId = $(this).attr("data-xxx");
			var cartCount = $(this).val();
			$.ajax({
				type: "get",
				url: "CartUpdateServlet",
				data:{
					productId: productId,
					cartCount: cartCount
				},
				dataType: "text",
				success: function(data, status, xhr) {
					var sum = productPrice * cartCount
					$("#sum"+productId).text(sum);
					var total = 0;
					$.each($(".sumPrice"), function(i, ele) {
						total+=parseInt(ele.innerText);
						console.log(total);
					})
					$("#totalPrice").text(total);
					total+=parseInt($("#totalDelPrice").text());
					$("#totalSumPrice").text(total);
				},
				error: function(xhr, status, error) {
					console.log("ajax 비동기처리 실패 : "+error);
				}
			})
		})
	})
	
</script>
<div class="boxtop"></div>
<div class="tabaleboxout">
<div class="tablebox">
<table border="1" class="listtable">
	<tr>
		<td class="tabletop" colspan="13"></td>
	</tr>
	
<%	for(int i=0; i<cartList.size();i++){
		CartDTO cdto = cartList.get(i);
		String cartId = cdto.getCartId();
		String cartuserId = cdto.getCartuserId();
		int cartCount = cdto.getCartCount();
		String productId = cdto.getProductId();
		String productName = cdto.getProductName();
		int productPrice = cdto.getProductPrice();
		int productDeliveryPrice = cdto.getProductDeliveryPrice();
		String productModel = cdto.getProductModel();
		String productMaker = cdto.getProductMaker();
		String previewUrl = cdto.getPreviewUrl();
		String productCategory = cdto.getProductCategory();
%>

	<tr class="basketlist">
		<td colspan="2">
			<div class="selectbox"><input type="checkbox" checked="checked" class="price" value="<%=productPrice %>"></div>
			<div><img src="<%=previewUrl %>" width="78px" height="78px"></div>
		</td>
		<td colspan="4">
			<div style="text-align: left;"><%=productName%></div>
			<div style="text-align: left;"><%=productModel%>/<%=productMaker %>/<%=productCategory %></div>
		</td>
		<td colspan="3">
			수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="number" class="cartCount" style="width:90px; text-align: right;" value="<%=cartCount%>" 
			data-xxx="<%=productId%>" data-yyy="<%=productPrice %>"><br>
			쿠폰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select style="width:98px; height:20px; font-size:7px; text-align: right">
				<option selected="selected">없음</option>
			<%for(int j=0; j<couponList.size();j++){
				CouponDTO cpdto = couponList.get(j);
				String couponid = cpdto.getCouponId();
				String couponName = cpdto.getCouponName();
				double couponDisper = cpdto.getCouponDisper();
				%>
				<option value="<%=couponDisper %>" ><%=couponName %></option>
			<%} %>
			</select>
		</td>
		<td colspan="2">
			<span >상품금액</span><br>
			<span class="sumPrice" id="sum<%=productId%>"><%=productPrice*cartCount %></span>
		원</td>
		<td colspan="2"><span >배송비<br><%=productDeliveryPrice %></span>원</td>
	</tr>
	<%} %>
	<tr>
		<td class="tablebot" colspan="13"></td>
	</tr>
</table>
</div>
</div>
<div class="boxbot"></div>

<div class="totalpriceTop"></div>
<div class="totalpriceBox0">
	<div class="totalpriceBox1">
		<div class="totalpriceCell1">총 선택상품금액</div>
		<div class="totalpriceCell2"><span id="totalPrice"></span>원</div>
	</div>
	<div class="totalpriceBox2">
		<img src="cart/plus.png" width="20px;" height="20px;">
	</div>
	<div class="totalpriceBox1">
		<div class="totalpriceCell1">총 배송비</div>
		<div class="totalpriceCell2"><span id="totalDelPrice">50000</span>원</div>
	</div>
	<div class="totalpriceBox2">
		<img src="cart/plus.png" width="20px;" height="20px;">
	</div>
	<div class="totalpriceBox1">
		<div class="totalpriceCell1">할인예상금액</div>
		<div class="totalpriceCell2"><span>0</span>원</div>
	</div>
	<div class="totalpriceBox2">
		<img src="cart/equal.png" width="20px;" height="20px;">
	</div>
	<div class="totalpriceBox3">
		<div class="totalpriceCell3">총 주문금액</div>
	</div>
	<div class="totalpriceBox4">
		<div class="totalpriceCell4">
			<span id="totalSumPrice"></span>원
		</div>
	</div>
</div>
<div class="bottom">

<div class="goPaybox">
<button class="goPay" id="goPay" onclick="xxx()">총 <span>1</span>건 주문하기</button>
</div>
</div>
<script type="text/javascript">

	function xxx() {
		location.href="OrderServlet"
	}

	window.onload = function() {
		var prices = document.getElementsByClassName("sumPrice");
		var total = 0;
		for (var i = 0; i < prices.length; i++) {
			var price = prices[i];
			console.log(price.innerText);
			total += parseInt(price.innerText);
		}
		document.getElementById("totalPrice").innerText=total;
		total += parseInt(document.getElementById("totalDelPrice").innerText);
		document.getElementById("totalSumPrice").innerText=total;
		//document.getElementById("totalPrice").innerText=total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원"; */
	}
	
</script>