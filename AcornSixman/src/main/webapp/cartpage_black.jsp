<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.CartDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	
	List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face { /* 애플산돌고딕 폰트 적용 */
	 	font-family: "GSMedium";
	 	src: url("fonts/GmarketSansTTFMedium.ttf") format("truetype");
	  	font-weight: normal;
	}
	*{
		font-family: "GSMedium";
	}
	.top{
		width: 100%;
		height: 80px;
		background-color: grey;
	}
	.head{
		width: 100%;
		height: 110px;
		background-color: white;
	}
	.boxbot{
		width: 100%;
		height: 30px;
		background-color: #f4f4f4;
		border-bottom-left-radius: 10px;
  		border-bottom-right-radius: 10px;
 		margin: auto;
	}
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
		width: 850px;
  		border-radius : 10px;
  		background-color: white; /* #f4f4f4; */
 		margin: auto;
	}
	.listtable{
		border: 1px solid #bcbcbc;
		width: 800px;
		table-layout: fixed;
		margin: auto;
		background-color: white;
		border-collapse: collapse;
		/* border-radius: 10px; */
		border-style: hidden;
		box-shadow: 0 0 0 1px white;
	
	}
	.listtable tr,td{
		border-color: #f4f4f4;
	}
	.tabletop{
		height: 30px;
	}
	.tablebot{
		height: 50px;
	}
	td{
		text-align: center;
		font-size: 10px;
	}
	.basketlist{
		height: 50px;
	}
	.selectbox{
		float: left;
		text-align: center;
		position: relative;
  		top: 18px;
  		left: 10px;
	}
	.bottom{
		width: 100%;
		height: 300px;
	}	
	.totalprice{
		text-align: center;
		margin: auto;
		background-color: white;
		width: 500px;
		height: 70px;
	}
	.totalpriceTop{
		margin: auto;
		background-color: white;
		width: 500px;
		height: 30px;
	}
	.goPaybox{
		text-align: center;
	}
	.goPay{
		line-height : 40px;
		text-align: center;
		background-color: grey;
		width: 250px;
		height: 40px;
		color: white;
		border-radius : 5px;
		margin:auto;
        display:block;
        border: 0;
        outline: 0;
	}
	.tptable {
		width: 500px;
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
</style>
</head>
<body>

<div class="top"></div>
<div class="head">
<div style="width: 100%; height: 60px;">
	<div style="width:850px; margin: auto;">
		<div style="width:300px; height: 60px; float:left; font-size: 24px; line-height:60px;">장바구니</div>
		<div align= "right" style="width:550px; height: 60px; float: right; line-height:60px; font-size: 12px;">
			장바구니>주문/결제>완료
		</div>
	</div>
</div>
<hr style="background-color: #f4f4f4;">
<div style="width: 800px; height: 40px; margin: auto;">
	<div align="left" style="width: 600px; float: left;"><input type="checkbox">&nbsp;전체선택</div>
	<div align="right"><button>x 전체 삭제</button>&nbsp;&nbsp;<button>x 선택 삭제</button></div>
</div>
</div>
<div class="boxtop"></div>
<div class="tabaleboxout">
<div class="tablebox">
<table border="1" class="listtable">
	<tr>
		<td class="tabletop" colspan="13"></td>
	</tr>
	<%for(int i=0; i<list.size();i++){
		CartDTO cdto = list.get(i);
		String Product_name = cdto.getProduct_name();
		int Product_price = cdto.getProduct_price();
		String Product_model = cdto.getProduct_model();
		int Cart_Count = cdto.getCart_Count();
		int Product_delivery_price = cdto.getProduct_delivery_price();
		
	
	
	%>
	<tr class="basketlist">
		<td colspan="2">
			<div class="selectbox"><input type="checkbox" checked="checked" class="price" value="<%=Product_price %>"></div>
			<div><img src="guitar0<%=i+1 %>.png" width="50px" height="50px"></div>
		</td>
		<td colspan="4">
			<div style="text-align: left;"><%=Product_name%></div>
			<div style="text-align: left;"><%=Product_model%></div>
		</td>
		<td colspan="3">
			수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="number" style="width:90px; text-align: right;" value="<%=Cart_Count%>"><br>
			쿠폰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select style="width:98px; height:20px; font-size:7px;">
				<option value="없음">없음</option>
				<option value="20% 할인 쿠폰" >20% 할인 쿠폰</option>
				<option value="30% 할인 쿠폰" >30% 할인 쿠폰</option>
			</select>
		</td>
		<td colspan="2"><span >상품금액<br><%=Product_price %>원</span></td>
		<td colspan="2"><span >배송비<br><%=Product_delivery_price %>원</span></td>
	</tr>
	<%} %>
	<tr>
		<td class="tablebot" colspan="13"></td>
	</tr>
</table>
</div>
</div>
<div class="boxbot"></div>
<div class="bottom">
<div class="totalpriceTop"></div>
<div class="totalprice">
<table class="tptable">
	<tr>
		<td colspan="2">총 선택상품금액</td>
		<td colspan="2">총 배송비</td>
		<td colspan="2">할인예상금액</td>
		<td rowspan="2" colspan="2" class="totalpricetd">총 주문금액</td>
		<td rowspan="2" colspan="2" class="totalpricetd" id="totalprice">0원</td>
	</tr>
	<tr class="totalpricetr">
		<td colspan="2">50000원</td>
		<td colspan="2">50000원</td>
		<td colspan="2">0원</td>
	</tr>
</table>
</div>
<div class="goPaybox">
<button class="goPay" id="goPay" onclick="xxx()">총 1건 주문하기</button>
</div>
</div>
<script type="text/javascript">

	function xxx() {
		location.href="OrderServlet"
	}

	window.onload = function() {
		var prices = document.getElementsByClassName("price");
		var total = 0;
		for (var i = 0; i < prices.length; i++) {
			var price = prices[i];
			console.log(price.value);
			total += parseInt(price.value);
		}
		document.getElementById("totalprice").innerText=total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원";
	}
	
</script>
</body>
</html>