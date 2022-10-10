<%@page import="com.acorn.sixman.dto.MemberDTO"%>
<%@page import="com.acorn.sixman.dto.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?after"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

.logo-image {
	margin-top: -1.5%;
}

.dropdown1:hover>ul.dropdown-menu {
	display: block;
	margin: 0;
}

#span1 {
	color: black;
}

header {
	text-decoration: none;
	width: 100%;
	z-index: 999;
	top: 0;
}

header.sticky {
	position: fixed;
	background-color: rgba(255, 255, 255, 0.8);
	transition: 0.3s;
	padding: 1.5%;

}

header.sticky #span1 {
	color: black;
	font-size: 15px;
}

#button-tag {
	text-decoration: none;
}

.login-service {
	display: none;
}

header.sticky .login-service {
	width: 300px;
	display: inline-block;
}

#main-span {
	font-family: 'Lobster', cursive;
	color: black;
	font-size: 30px;
	cursor: pointer;
	text-align: left;
	margin-right: 9%;
	display: none;
}
header.sticky #main-span{
display: inline-block;
}
header.sticky .navbar1{
text-align: center;
}
header.sticky .menu-container-top{
text-align: center;
}
</style>
</head>

<body>
	<div class="logo-image">
		<a href="/"> <img src="static/img/LOGO2.png"
			height="70px" width="110px">
		</a>
	</div>
	<hr>
	<%
	List<CategoryDTO> list = (List<CategoryDTO>) session.getAttribute("Guitar");
	CategoryDTO dto0 = list.get(0);
	String id0 = dto0.getCategoryId();
	%>
	<%
	CategoryDTO dto = list.get(1);
	String id = dto.getCategoryId();
	CategoryDTO dto2 = list.get(4);
	String id2 = dto2.getCategoryId();
	%>
	<%
	CategoryDTO dto3 = list.get(2);
	String id3 = dto3.getCategoryId();
	CategoryDTO dto4 = list.get(3);
	String id4 = dto4.getCategoryId();
	CategoryDTO dto5 = list.get(5);
	String id5 = dto5.getCategoryId();
	%>
	<header>

		<div class="navbar1">
<span onclick="location.href='/'" id="main-span">The SixMan</span>
			<button type="button" class="btn btn-link" id="button-tag"
				onclick="location.href='ProductListServlet?category=<%=id0%>'">
				<span id="span1">전체 상품</span>
			</button>
			<div class="dropdown1" style="display: inline-block;">
				|
				<button type="button" class="btn btn-link" id="button-tag"
					onclick="location.href='ProductListServlet?category=<%=id%>*<%=id2%>'">
					<span id="span1">일렉기타 & 베이스</span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenuDivider">

					<li><a class="dropdown-item"
						href="ProductListServlet?category=<%=id%>"><%=id%></a></li>
					<li><a class="dropdown-item"
						href="ProductListServlet?category=<%=id2%>"><%=id2%></a></li>
					<li role="presentation" class="divider"></li>
				</ul>
				|
			</div>
			<div class="dropdown1" style="display: inline-block;">
				<button type="button" class="btn btn-link" id="button-tag"
					onclick="location.href='ProductListServlet?category=<%=id3%>*<%=id4%>'">
					<span id="span1">어쿠스틱기타 & 클래식기타</span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenuDivider">

					<li><a class="dropdown-item"
						href="ProductListServlet?category=<%=id3%>"><%=id3%></a></li>
					<li><a class="dropdown-item"
						href="ProductListServlet?category=<%=id4%>"><%=id4%></a></li>
					<li role="presentation" class="divider"></li>
				</ul>
				|
			</div>

			<button type="button" class="btn btn-link" id="button-tag"
				onclick="location.href='ProductListServlet?category=<%=id5%>'">
				<span id="span1">우쿠렐레</span>
			</button>
			<div class="dropdown1" style="display: inline-block;">
				|
				<button type="button" class="btn btn-link" id="button-tag"
					onclick="location.href='BoardListServlet'">
					<span id="span1">게시판</span>
				</button>
				<ul class="dropdown-menu" role="menu"
					aria-labelledby="dropdownMenuDivider">
					<li>
						<a class="dropdown-item" href="BoardListServlet?Category=NOTICE"><span id="span1">공지사항</span></a>
					</li>
					<li>
						<a class="dropdown-item" href="BoardListServlet?Category=NEWS"><span id="span1">최신소식</span></a>
					</li>
					<li>
						<a class="dropdown-item" href="BoardListServlet?Category=BOARD"><span id="span1">회원게시판</span></a>
					</li>
					<li>
						<a class="dropdown-item" href="BoardListServlet?Category=SECONDHAND"><span id="span1">중고거래</span></a>
					</li>
					<li>
						<a class="dropdown-item" href="BoardListServlet?Category=QnA"><span id="span1">Q&A</span></a>
					</li>
					<li role="presentation" class="divider"></li>
				</ul>
			</div>
			<div class="login-service">
				
				<%
				MemberDTO dtolo = (MemberDTO) session.getAttribute("login");
				if (dtolo != null) {
					String username = dtolo.getAccountName();
					String sell = dtolo.getAccountIsSeller();
				%>
				<div class="menu-container-top">

					<span class="top-login" OnClick="location.href='logoutServlet'"
						style="margin-right: 4%"><img src="static/img/logout.png"
						width="30px" height="30px" style="margin-right: -0.5%;"></span> <span
						class="top-login" OnClick="location.href='MyPageServlet'"
						style="margin-right: 4.2%"><img src="static/img/mypage.png"
						width="30px" height="30px"></span>

					<!-- <span
		class="top-login" OnClick="location.href='MyPageServlet'"><img
		src="image/JoinupIcon.png" width="30px" height="30px"></span> -->
					<%
					if (dtolo.getAccountIsSeller().equals("False")) {
					%>
					<span class="top-login" OnClick="location.href='/cartList'"
						style="margin-right: 2.8%"><img src="static/img/cart3.png"
						width="30px" height="30px"></span>

					<%
					} else {
					%>
					<span class="top-login"
						OnClick="location.href='/UploadedList'"
						style="margin-right: 3.5%"><img src="static/img/set.png"
						width="30px" height="30px"></span>
					<%
					}
					%>
				</div>
				<%
				} else {
				%>
				<div class="menu-container-top">
					<span class="top-login" OnClick="location.href='/LoginUI'"
						style="margin-right: 2.5%"><img src="static/img/LoginIcon.png"
						width="30px" height="30px"></span> <span class="top-login"
						OnClick="location.href='/MainJoinUp'"
						style="margin-left: 5%"><img src="static/img/JoinupIcon.png"
						width="30px" height="30px"></span>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</header>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var $header = $('header')
			$(window).scroll(function() {
				var window = $(this).scrollTop();
				if (window > 300) {
					$header.addClass('sticky');
					$("#login-service").attr("style", "display: inline-block;")
					console.log("자바스크륍트")
				} else {
					$header.removeClass('sticky');
					$("#login-service").attr("style", "display: none;")
				}
			})

		})
	</script>
</body>
</html>

