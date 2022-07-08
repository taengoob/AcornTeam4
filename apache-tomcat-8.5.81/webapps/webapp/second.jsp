<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>second</title>
		<style type="text/css">
			h1 {
				color: red;
			}
		</style>
	</head>
	<body>
		<%-- <% request.setAttribute("name", "강백호"); %> --%>
		<a href="first.jsp">first</a>
		<br />
		second.jsp <%= session.getAttribute("name") %>
		<br />
		top.jsp를 include 시킨 내용
		<br />
		<br />
		<jsp:include page="include/top.jsp" flush="true" />
		<br />
		<br />
		다시 second.jsp
		<br />
	</body>
</html>
