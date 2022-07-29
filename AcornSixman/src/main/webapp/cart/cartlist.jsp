<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.CartDTO" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
	
	List<CartDTO> list = (List<CartDTO>)request.getAttribute("list");
	
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
 		
	
</style>
<script type="text/javascript">

</script>
<div class="boxtop"></div>
<div class="tabaleboxout">
<div class="tablebox">
<table border="1" class="listtable">
	<tr>
		<td class="tabletop" colspan="13"></td>
	</tr>
	
<%	for(int i=0; i<list.size();i++){
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