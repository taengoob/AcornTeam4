<%@page import="com.dto.ProductDTO_Temp"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--     	<link rel="stylesheet" href="orderList.css"> -->
    	<link rel="stylesheet" href="order/orderList.css">
	</head>
	
	<%
	List<OrderDTO> orderList = (List<OrderDTO>)request.getAttribute("orderList");
	%>
	
	<body>
		<div class="boxtop"></div>
		<div class="tabaleboxout">
			<div class="tablebox">
				<table border="1" class="listtable">
					<tr>
						<td class="tabletop" colspan="15"></td>
					</tr>
				<%
				for (OrderDTO order : orderList)
				{
					ProductDTO_Temp product = order.getProduct();
					String image = product.getPreviewUrl();
					String name = product.getProductName();
					String model = product.getProductModel();
					String maker = product.getProductModel();
					String category = product.getProductCategory();
					
					String orderId = order.getOrderId();
					String displayStatus = order.getDisplayStatus();
					int payment = order.getOrderPaymentPrice();
				%>
					<tr class="basketlist">
						<td colspan="2">
							<span>주문번호</span><br>
							<span class="sumPrice"><%= orderId %></span>
						</td>
						<td colspan="2">
							<div class="selectbox"></div>
							<div><img src="<%= image %>" width="78px" height="78px"></div>
						</td>
						<td colspan="4">
							<div style="text-align: left;"><%= name %></div>
							<div style="text-align: left;"><%= model %>/<%= maker %>/<%= category %></div>
						</td>
						
						<td colspan="3">
							<span>결제(예정)금액</span><br>
							<span class="sumPrice"><%= payment %></span>원
						</td>
						<td colspan="2">
							<span>주문상태</span><br>
							<span class="sumPrice"><%= displayStatus %></span>
						</td>
						<td colspan="2">
							<form id="btnForm" action="#" method="post">
		                   		<input id="hiddenInput" name="jsonStr" value="" type="hidden">
		                        <input id="actionBtn" type="button" class="actionBtn" value="주문취소">
	                   		</form>
						</td>
					</tr>
				<%
				}
				%>
				
					<tr>
						<td class="tablebot" colspan="15"></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="boxbot"></div>
	</body>
</html>