<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<%
MemberDTO dto = (MemberDTO) session.getAttribute("login");
if (dto != null) {
	String username = dto.getAccountName();
	String sell = dto.getAccountIsSeller();
%>
<div class="menu-container">

	<span class="top-login" OnClick="location.href='logoutServlet'"
		style="margin-right: 4%"><img src="image/logout.png"
		width="30px" height="30px" style="margin-right: -0.5%;"></span> <span class="top-login"
		OnClick="location.href='MyPageServlet'" style="margin-right: 4.2%"><img
		src="image/mypage.png" width="30px" height="30px"></span>

	<!-- <span
		class="top-login" OnClick="location.href='MyPageServlet'"><img
		src="image/JoinupIcon.png" width="30px" height="30px"></span> -->
	<%
	if (dto.getAccountIsSeller().equals("False")) {
	%>
	<span class="top-login" OnClick="location.href='CartListServlet'"
		style="margin-right: 2.8%"><img src="image/cart3.png"
		width="30px" height="30px"></span>
	<div class="menu-write-container">
		<span class="top-login-write" style="margin-right: 1.7%"><%=username%>님 환영합니다.</span> <span
			class="top-login-write" OnClick="location.href='logoutServlet'" style="margin-right: 1.3%">로그아웃</span>
		<span class="top-login-write" OnClick="location.href='MyPageServlet'" style="margin-right: 1%">마이페이지</span>
		<span class="top-login-write" OnClick="location.href='CartListServlet'" style="margin-right: 1.7%">장바구니</span>
	</div>
	<%
	} else {
	%>
	<span class="top-login" OnClick="location.href='CartListServlet'"
		style="margin-right: 3.5%"><img src="image/set.png"
		width="30px" height="30px"></span>
	<div class="menu-write-container">
		<span class="top-login-write" style="margin-right: 1.7%"><%=username%>님 환영합니다.</span> <span
			class="top-login-write" OnClick="location.href='logoutServlet'" style="margin-right: 1.3%">로그아웃</span>
		<span class="top-login-write" OnClick="location.href='MyPageServlet'" style="margin-right: 1%">마이페이지</span>
		<span class="top-login-write" OnClick="location.href='UploadedListServlet'" style="margin-right: 1.7%">판매자메뉴</span>
	</div>
	<%
	}
	%>
</div>
<hr>
<%
} else {
%>
<div class="menu-container">
	<span class="top-login" OnClick="location.href='LoginUIservlet'"
		style="margin-right: 2.5%"><img src="image/LoginIcon.png"
		width="30px" height="30px"></span> <span class="top-login"
		OnClick="location.href='MainJoinUpServlet'" style="margin-right: 2%"><img
		src="image/JoinupIcon.png" width="30px" height="30px"></span>

	<div class="menu-write-container">
		<span class="top-login-write" OnClick="location.href='LoginUIservlet'"
			style="margin-right: 0.7%">로그인</span> <span class="top-login-write"
			OnClick="location.href='MainJoinUpServlet'" style="margin-right: 1%">회원가입</span>
	</div>
	<hr>
</div>
<%
}
%>

