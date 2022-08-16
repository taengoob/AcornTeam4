<%@page import="com.dto.CategoryDTO"%>
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
.logo-image {
	margin-top: -1.5%;
}

.dropdown1:hover>ul.dropdown-menu {
	display: block;
	margin: 0;
}
</style>
</head>

<body>
	<div class="logo-image">
		<a href="Mainservlet"> <img src="member/img/LOGO2.png"
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
	<div class="btn-group btn-group-justified" role="group"
		aria-label="...">
		<button type="button" class="btn btn-link" 	onclick="location.href='ProductListServlet?category=<%=id0%>'"
			style="text-decoration: none; color: black;">전체 상품</button>
		<div class="dropdown1" style="display: inline-block;">|
			<button type="button" class="btn btn-link"
				style="text-decoration: none; color: black;"><a style="text-decoration: none; color: black;" href="ProductListServlet?category=<%=id %>*<%=id2%>">일렉기타 & 베이스</a></button>
			<ul class="dropdown-menu" role="menu"
				aria-labelledby="dropdownMenuDivider">

				<li><a class="dropdown-item"
					href="ProductListServlet?category=<%=id%>"><%=id%></a></li>
				<li><a class="dropdown-item"
					href="ProductListServlet?category=<%=id2%>"><%=id2%></a></li>
				<li role="presentation" class="divider"></li>
			</ul>|
		</div>
		<div class="dropdown1" style="display: inline-block;">
			<button type="button" class="btn btn-link"
				style="text-decoration: none; color: black;"><a style="text-decoration: none; color: black;" href="ProductListServlet?category=<%=id3 %>*<%=id4%>">어쿠스틱기타 & 클래식기타</a></button>
			<ul class="dropdown-menu" role="menu"
				aria-labelledby="dropdownMenuDivider">

				<li><a class="dropdown-item"
					href="ProductListServlet?category=<%=id3%>"><%=id3%></a></li>
				<li><a class="dropdown-item"
					href="ProductListServlet?category=<%=id4%>"><%=id4%></a></li>
				<li role="presentation" class="divider"></li>
			</ul>|
		</div>

		<button type="button" class="btn btn-link"
			onclick="location.href='ProductListServlet?category=<%=id5%>'"
			style="text-decoration: none; color: black;">우쿠렐레</button>
			<div class="dropdown1" style="display: inline-block;">|
			<button type="button" class="btn btn-link"onclick="location.href='BoardListServlet'"
				style="text-decoration: none; color: black;">게시판</button>
			<ul class="dropdown-menu" role="menu"
				aria-labelledby="dropdownMenuDivider">
				<%
				
				%>
				<li><a class="dropdown-item"
					href="#">공지사항</a></li>
				<li><a class="dropdown-item"
					href="#">판매 문의 게시판</a></li>
				<li role="presentation" class="divider"></li>
			</ul>
		</div>
	</div>

	<div class="top-container" style="text-align: center;"></div>

</body>
</html>

