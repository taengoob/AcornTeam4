<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.acorn.sixman.dto.OrderRequestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- pull테스트 -->
<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- Bootstrap CSS -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous"/>

		<script type="text/javascript">
		
			function onCompleteBtnClicked(btn) {
				const dataset = btn.dataset;
				const requestType = dataset.requestType
				const requestId = dataset.requestId;
				const status = dataset.status;
				location.href = "updateOrderRequest?"
						+ "requestId=" + requestId
						+ "&&status=" + status
						+ "&&requestType=" + requestType;
			}
			
			function onStartDeliveryBtnClicked(btn) {
				const dataset = btn.dataset;
				const requestId = dataset.requestId;
				location.href = "addDelivery?requestId=" + requestId;
			}
		
		</script>

		<title>결제시스템</title>
	</head>
<%
	List<OrderRequestDTO> wpList = (List<OrderRequestDTO>)request.getAttribute("orderRequestWPList");
	List<OrderRequestDTO> cpList = (List<OrderRequestDTO>)request.getAttribute("orderRequestCPList");
%>
	<body>
		<!-- 컨텐츠 작성 -->
		<hr size="0" />
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="container">
					<div>
						<header><strong>입금 대기</strong></header>
						<hr />
					</div>
					<table class="table table-hover align-middle" style="text-align: center">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Request ID</th>
								<th scope="col">Order ID</th>
								<th scope="col">Product Name</th>
								<th scope="col">User ID</th>
								<th scope="col">Request Date</th>
								<th scope="col">Update Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						<%
						for (int i = 0; i < wpList.size(); i++) {
							OrderRequestDTO orderRequest = wpList.get(i);
							String requestId = orderRequest.getRequestId();
							String orderId = orderRequest.getOrderId();
							String productName = orderRequest.getProductName();
							String userId = orderRequest.getUserId();
							String requestDate = orderRequest.getRequestRegDate();
							String updateDate = orderRequest.getRequestUpdateDate();
						%>
							<tr>
								<th scope="row"><%=i + 1%></th>
								<td><%=requestId%></td>
								<td><%=orderId%></td>
								<td><%=productName%></td>
								<td><%=userId%></td>
								<td><%=requestDate%></td>
								<td><%=updateDate%></td>
								<td>
									<button type="button" class="btn btn-primary" 
									data-request-id="<%=requestId%>" data-status="CP" data-request-type="PAYMENT"
									onclick="onCompleteBtnClicked(this)">결제완료</button>
								</td>
							</tr>
						<%
						}
						%>
						</tbody>
					</table>

					<div style="height: 100px"></div>

					<div>
						<header><strong>결제 완료</strong></header>
						<hr />
					</div>
					<table class="table table-hover align-middle" style="text-align: center">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Request ID</th>
								<th scope="col">Order ID</th>
								<th scope="col">Product Name</th>
								<th scope="col">User ID</th>
								<th scope="col">Request Date</th>
								<th scope="col">Update Date</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						<%
						for(int i = 0; i < cpList.size(); i++) {
							OrderRequestDTO orderRequest = cpList.get(i);
							String requestId = orderRequest.getRequestId();
							String orderId = orderRequest.getOrderId();
							String productName = orderRequest.getProductName();
							String userId = orderRequest.getUserId();
							String requestDate = orderRequest.getRequestRegDate();
							String updateDate = orderRequest.getRequestUpdateDate();
							int count = orderRequest.getdeliveryCount();
						%>
							<tr>
								<th scope="row"><%=i + 1%></th>
								<td><%=requestId%></td>
								<td><%=orderId%></td>
								<td><%=productName%></td>
								<td><%=userId%></td>
								<td><%=requestDate%></td>
								<td><%=updateDate%></td>
								
								<td>
								<%
								if (count == 0) {
								%>
									<button type="button" class="btn btn-primary" 
									data-request-id="<%=requestId%>"
									onclick="onStartDeliveryBtnClicked(this)">배송준비</button>
								<%
								}
								%>
								</td>
								
							</tr>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 컨텐츠 작성 -->
		<!-- Optional JavaScript; choose one of the two! -->
		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous">
		</script>
		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    --></body>
</html>

