<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>first</title>
		<style type="text/css">
			h1 {
				color: red;
			}
		</style>
	</head>
	<body>
		<% session.setAttribute("name", "홍길동"); %>
		<a href="second.jsp">second</a>
		<br />
		first.jsp <%= session.getAttribute("name") %>
		<br />
		top.jsp를 include 시킨 내용
		<br />
		<br />
		<jsp:include page="include/top.jsp" flush="true" />
		<br />
		<br />
		다시 first.jsp
		<br />
	</body>
</html>
