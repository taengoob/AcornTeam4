<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Map<String,Integer> status = (Map<String,Integer>) request.getAttribute("status");
	int wp = status.get("wp");
	int cp = status.get("cp");
	int pd = status.get("pd");
	int bd = status.get("bd");
	int cd = status.get("cd");
	%>
	<section class="high-section">
		<div class="order-strong-span-mom">
		<a href="memberUpdatePage" class="update">*회원정보수정 페이지로 이동*</a><br>
			<strong class="order-strong">주문내역</strong>&nbsp; <span
				class="order-span">(최근 6개월,배송상품 기준)</span>
		</div>
		<div class="order-item-container">
			<div class="order-item1-container">
				<div class="order-item1">
					<p class="order-item1-span"><%=wp%></p>
				</div>
				<p class="order-item1-write">입금대기중</p>
			</div>
			<div class="order-item2-container">
				<div class="order-item2">
					<p class="order-item2-span"><%=cp%></p>
				</div>
				<p class="order-item2-write">결제완료</p>
			</div>
			<div class="order-item3-container">
				<div class="order-item3">
					<p class="order-item3-span"><%=pd%></p>
				</div>
				<p class="order-item3-write">배송준비중</p>
			</div>
			<div class="order-item4-container">
				<div class="order-item4">
					<p class="order-item4-span"><%=bd%></p>
				</div>
				<p class="order-item4-write">배송중</p>
			</div>
			<div class="order-item5-container">
				<div class="order-item5">
					<p class="order-item5-span"><%=cd%></p>
				</div>
				<p class="order-item5-write">배송완료</p>
			</div>
		</div>
		<div class="order-cancel">
			<p class="cancel">
				취소/반품/교환 &nbsp;<span class="number-color1">0</span>
			</p>
			<span class="line">I</span>
			<p class="start">
				구매확정 &nbsp;<span class="number-color2">0</span>
			</p>
		</div>

	
		<strong class="order-two" id="order-two">최근 주문 정보</strong> <span
			class="order-two-item">최근 30일 내에 주문하신 내역입니다.</span>
		<div class="order-two-write">
			<p class="order-two-write-item1">날짜/주문번호</p>
			<p class="order-two-write-item2">상품명/옵션</p>
			<p class="order-two-write-item3">상품금액/수량</p>
			<p class="order-two-write-item4">주문상태</p>
			<p class="order-two-write-item5">확인/리뷰</p>
		</div>
	</section>
